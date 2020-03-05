-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ModelatgeBBBDD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ModelatgeBBBDD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ModelatgeBBBDD` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `ModelatgeBBBDD` ;

-- -----------------------------------------------------
-- Table `ModelatgeBBBDD`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ModelatgeBBBDD`.`Supplier` (
  `NIF` VARCHAR(10) NOT NULL,
  `supplierName` VARCHAR(100) NOT NULL,
  `supplierStreet` VARCHAR(50) NULL,
  `supplierStreetNumber` VARCHAR(4) NULL,
  `supplierFloor` VARCHAR(10) NULL,
  `supplierDoor` VARCHAR(10) NULL,
  `supplierCity` VARCHAR(45) NULL,
  `supplierPostalCode` INT NULL,
  `supplierCountry` VARCHAR(45) NULL,
  `supplierTelephone` INT NULL,
  `supplierFax` INT NULL,
  PRIMARY KEY (`NIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ModelatgeBBBDD`.`Brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ModelatgeBBBDD`.`Brand` (
  `idBrand` INT NOT NULL AUTO_INCREMENT,
  `NIF` VARCHAR(10) NOT NULL,
  `Supplier_NIF` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idBrand`),
  INDEX `fk_Brand_Supplier_idx` (`Supplier_NIF` ASC) VISIBLE,
  CONSTRAINT `fk_Brand_Supplier`
    FOREIGN KEY (`Supplier_NIF`)
    REFERENCES `ModelatgeBBBDD`.`Supplier` (`NIF`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ModelatgeBBBDD`.`Seller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ModelatgeBBBDD`.`Seller` (
  `idSeller` INT NOT NULL AUTO_INCREMENT,
  `sellerName` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idSeller`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ModelatgeBBBDD`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ModelatgeBBBDD`.`Customer` (
  `idCustomer` INT NOT NULL,
  `customerName` VARCHAR(100) NOT NULL,
  `customerAddress` VARCHAR(100) NULL,
  `customerTelephone` INT NULL,
  `customerEmail` VARCHAR(45) NULL,
  `customerRegisterDate` DATE NOT NULL,
  `customerRecommend` INT NULL,
  `Customer_idCustomer` INT NOT NULL,
  PRIMARY KEY (`idCustomer`, `Customer_idCustomer`),
  INDEX `fk_Customer_Customer1_idx` (`Customer_idCustomer` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Customer1`
    FOREIGN KEY (`Customer_idCustomer`)
    REFERENCES `ModelatgeBBBDD`.`Customer` (`idCustomer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ModelatgeBBBDD`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ModelatgeBBBDD`.`Invoice` (
  `idInvoice` INT NOT NULL AUTO_INCREMENT,
  `idCustomer` INT NOT NULL,
  `idBrand` INT NOT NULL,
  `idSeller` INT NOT NULL,
  `Seller_idSeller` INT NOT NULL,
  `Customer_idCustomer` INT NOT NULL,
  PRIMARY KEY (`idInvoice`),
  INDEX `fk_Invoice_Seller1_idx` (`Seller_idSeller` ASC) VISIBLE,
  INDEX `fk_Invoice_Customer1_idx` (`Customer_idCustomer` ASC) VISIBLE,
  CONSTRAINT `fk_Invoice_Seller1`
    FOREIGN KEY (`Seller_idSeller`)
    REFERENCES `ModelatgeBBBDD`.`Seller` (`idSeller`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Invoice_Customer1`
    FOREIGN KEY (`Customer_idCustomer`)
    REFERENCES `ModelatgeBBBDD`.`Customer` (`idCustomer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ModelatgeBBBDD`.`Glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ModelatgeBBBDD`.`Glasses` (
  `idGlasses` INT NOT NULL AUTO_INCREMENT,
  `idBrand` INT NOT NULL,
  `brandName` VARCHAR(45) NOT NULL,
  `Graduation` DECIMAL NOT NULL,
  `frameType` VARCHAR(45) NOT NULL,
  `frameColour` VARCHAR(20) NOT NULL,
  `glassColour` VARCHAR(20) NOT NULL,
  `prize` VARCHAR(45) NOT NULL,
  `Brand_idBrand` INT NOT NULL,
  `Invoice_idInvoice` INT NOT NULL,
  PRIMARY KEY (`idGlasses`),
  INDEX `fk_Glasses_Brand1_idx` (`Brand_idBrand` ASC) VISIBLE,
  INDEX `fk_Glasses_Invoice1_idx` (`Invoice_idInvoice` ASC) VISIBLE,
  CONSTRAINT `fk_Glasses_Brand1`
    FOREIGN KEY (`Brand_idBrand`)
    REFERENCES `ModelatgeBBBDD`.`Brand` (`idBrand`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Glasses_Invoice1`
    FOREIGN KEY (`Invoice_idInvoice`)
    REFERENCES `ModelatgeBBBDD`.`Invoice` (`idInvoice`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
