-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CULDAMPOLLA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CULDAMPOLLA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CULDAMPOLLA` DEFAULT CHARACTER SET utf8 ;
USE `CULDAMPOLLA` ;

-- -----------------------------------------------------
-- Table `CULDAMPOLLA`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CULDAMPOLLA`.`Supplier` (
  `Supplier_id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `Address` VARCHAR(60) NOT NULL,
  `PhoneNumber` VARCHAR(30) NOT NULL,
  `FaxNumber` VARCHAR(30) NULL,
  `NIF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Supplier_id`),
  UNIQUE INDEX `supplier_id_UNIQUE` (`Supplier_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CULDAMPOLLA`.`Glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CULDAMPOLLA`.`Glasses` (
  `Glasses_id` INT NOT NULL AUTO_INCREMENT,
  `Brand` VARCHAR(30) NOT NULL,
  `FrameType` VARCHAR(30) NOT NULL,
  `FrameColor` VARCHAR(15) NOT NULL,
  `GlassColor` VARCHAR(15) NOT NULL,
  `Price` DECIMAL(10,2) NOT NULL,
  `Supplier_Supplier_id` INT NOT NULL,
  PRIMARY KEY (`Glasses_id`, `Supplier_Supplier_id`),
  UNIQUE INDEX `Glasses_id_UNIQUE` (`Glasses_id` ASC) VISIBLE,
  INDEX `fk_Glasses_Supplier1_idx` (`Supplier_Supplier_id` ASC) VISIBLE,
  CONSTRAINT `fk_Glasses_Supplier1`
    FOREIGN KEY (`Supplier_Supplier_id`)
    REFERENCES `CULDAMPOLLA`.`Supplier` (`Supplier_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CULDAMPOLLA`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CULDAMPOLLA`.`Client` (
  `Client_id` INT NOT NULL AUTO_INCREMENT,
  `ReferencedBy_id` INT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `PhoneNumber` VARCHAR(30) NOT NULL,
  `Email` VARCHAR(30) NOT NULL,
  `RegistrationDate` DATE NOT NULL,
  PRIMARY KEY (`Client_id`),
  INDEX `fk_Client_Client1_idx` (`ReferencedBy_id` ASC) VISIBLE,
  UNIQUE INDEX `Client_id_UNIQUE` (`Client_id` ASC) VISIBLE,
  UNIQUE INDEX `ReferencedBy_id_UNIQUE` (`ReferencedBy_id` ASC) VISIBLE,
  CONSTRAINT `fk_Client_Client1`
    FOREIGN KEY (`ReferencedBy_id`)
    REFERENCES `CULDAMPOLLA`.`Client` (`Client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CULDAMPOLLA`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CULDAMPOLLA`.`Employee` (
  `Employee_id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Employee_id`),
  UNIQUE INDEX `Employee_id_UNIQUE` (`Employee_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CULDAMPOLLA`.`SalesOrder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CULDAMPOLLA`.`SalesOrder` (
  `SalesOrder_id` INT NOT NULL AUTO_INCREMENT,
  `Invoice` VARCHAR(15) NOT NULL,
  `Data` DATE NOT NULL,
  `Total` DECIMAL(10,2) DEFAULT 0.0 NOT NULL,
  `Client_Client_id` INT NOT NULL,
  `Employee_Employee_id` INT NOT NULL,
  PRIMARY KEY (`SalesOrder_id`, `Client_Client_id`, `Employee_Employee_id`),
  UNIQUE INDEX `Order_id_UNIQUE` (`SalesOrder_id` ASC) VISIBLE,
  INDEX `fk_SalesOrder_Client1_idx` (`Client_Client_id` ASC) VISIBLE,
  INDEX `fk_SalesOrder_Employee1_idx` (`Employee_Employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_SalesOrder_Client1`
    FOREIGN KEY (`Client_Client_id`)
    REFERENCES `CULDAMPOLLA`.`Client` (`Client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SalesOrder_Employee1`
    FOREIGN KEY (`Employee_Employee_id`)
    REFERENCES `CULDAMPOLLA`.`Employee` (`Employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CULDAMPOLLA`.`OrderDetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CULDAMPOLLA`.`OrderDetail` (
  `OrderDetail_id` INT NOT NULL AUTO_INCREMENT,
  `Quantity` INT NOT NULL,
  `Prescription` DECIMAL(4,2) NOT NULL,
  `SubTotal` DECIMAL(10,2) DEFAULT 0.0 NOT NULL,
  `Glasses_Glasses_id` INT NOT NULL,
  `SalesOrder_SalesOrder_id` INT NOT NULL,
  `SalesOrder_Client_Client_id` INT NOT NULL,
  `SalesOrder_Employee_Employee_id` INT NOT NULL,
  `Glasses_Supplier_Supplier_id` INT NOT NULL,
  PRIMARY KEY (`OrderDetail_id`, `Glasses_Glasses_id`, `SalesOrder_SalesOrder_id`, `SalesOrder_Client_Client_id`, `SalesOrder_Employee_Employee_id`, `Glasses_Supplier_Supplier_id`),
  UNIQUE INDEX `OrderDetail_id_UNIQUE` (`OrderDetail_id` ASC) VISIBLE,
  INDEX `fk_OrderDetail_SalesOrder1_idx` (`SalesOrder_SalesOrder_id` ASC, `SalesOrder_Client_Client_id` ASC, `SalesOrder_Employee_Employee_id` ASC) VISIBLE,
  INDEX `fk_OrderDetail_Glasses1_idx` (`Glasses_Glasses_id` ASC, `Glasses_Supplier_Supplier_id` ASC) VISIBLE,
  CONSTRAINT `fk_OrderDetail_SalesOrder1`
    FOREIGN KEY (`SalesOrder_SalesOrder_id` , `SalesOrder_Client_Client_id` , `SalesOrder_Employee_Employee_id`)
    REFERENCES `CULDAMPOLLA`.`SalesOrder` (`SalesOrder_id` , `Client_Client_id` , `Employee_Employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderDetail_Glasses1`
    FOREIGN KEY (`Glasses_Glasses_id` , `Glasses_Supplier_Supplier_id`)
    REFERENCES `CULDAMPOLLA`.`Glasses` (`Glasses_id` , `Supplier_Supplier_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
