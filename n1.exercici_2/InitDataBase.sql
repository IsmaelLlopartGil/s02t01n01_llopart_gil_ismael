-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Pizzeria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Pizzeria` DEFAULT CHARACTER SET utf8 ;
USE `Pizzeria` ;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Province`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Province` (
  `Province_id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Province_id`),
  UNIQUE INDEX `Province_iid_UNIQUE` (`Province_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`Town`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Town` (
  `Town_id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `PostalCode` VARCHAR(25) NOT NULL,
  `Province_Province_id` INT NOT NULL,
  PRIMARY KEY (`Town_id`, `Province_Province_id`),
  UNIQUE INDEX `Town_id_UNIQUE` (`Town_id` ASC) VISIBLE,
  INDEX `fk_Town_Province_idx` (`Province_Province_id` ASC) VISIBLE,
  CONSTRAINT `fk_Town_Province`
    FOREIGN KEY (`Province_Province_id`)
    REFERENCES `Pizzeria`.`Province` (`Province_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Client` (
  `Client_id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(65) NOT NULL,
  `PhoneNumber` VARCHAR(30) NOT NULL,
  `Town_Town_id` INT NOT NULL,
  PRIMARY KEY (`Client_id`, `Town_Town_id`),
  UNIQUE INDEX `Client_id_UNIQUE` (`Client_id` ASC) VISIBLE,
  INDEX `fk_Client_Town1_idx` (`Town_Town_id` ASC) VISIBLE,
  CONSTRAINT `fk_Client_Town1`
    FOREIGN KEY (`Town_Town_id`)
    REFERENCES `Pizzeria`.`Town` (`Town_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`DeliveryMethod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`DeliveryMethod` (
  `DeliveryMethod_id` INT NOT NULL AUTO_INCREMENT,
  `MethodName` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`DeliveryMethod_id`),
  UNIQUE INDEX `DeliveryMethod_id_UNIQUE` (`DeliveryMethod_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`Store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Store` (
  `Store_id` INT NOT NULL AUTO_INCREMENT,
  `Address` VARCHAR(65) NOT NULL,
  `Town_Town_id` INT NOT NULL,
  PRIMARY KEY (`Store_id`, `Town_Town_id`),
  UNIQUE INDEX `Store_id_UNIQUE` (`Store_id` ASC) VISIBLE,
  INDEX `fk_Store_Town1_idx` (`Town_Town_id` ASC) VISIBLE,
  CONSTRAINT `fk_Store_Town1`
    FOREIGN KEY (`Town_Town_id`)
    REFERENCES `Pizzeria`.`Town` (`Town_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`Job`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Job` (
  `Job_id` INT NOT NULL AUTO_INCREMENT,
  `JobName` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`Job_id`),
  UNIQUE INDEX `Job_id_UNIQUE` (`Job_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Employee` (
  `Employee_id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `NIF` VARCHAR(45) NOT NULL,
  `PhoneNumber` VARCHAR(30) NOT NULL,
  `Store_Store_id` INT NOT NULL,
  `Job_Job_id` INT NOT NULL,
  PRIMARY KEY (`Employee_id`, `Store_Store_id`, `Job_Job_id`),
  UNIQUE INDEX `Employee_id_UNIQUE` (`Employee_id` ASC) VISIBLE,
  INDEX `fk_Employee_Store1_idx` (`Store_Store_id` ASC) VISIBLE,
  INDEX `fk_Employee_Job1_idx` (`Job_Job_id` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Store1`
    FOREIGN KEY (`Store_Store_id`)
    REFERENCES `Pizzeria`.`Store` (`Store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Job1`
    FOREIGN KEY (`Job_Job_id`)
    REFERENCES `Pizzeria`.`Job` (`Job_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`SalesOrder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`SalesOrder` (
  `SalesOrder_id` INT NOT NULL AUTO_INCREMENT,
  `Invoice` VARCHAR(15) NOT NULL,
  `DateTime` DATETIME NULL,
  `Total` DECIMAL(10,2) NOT NULL DEFAULT 0,
  `DeliveryMethod_DeliveryMethod_id` INT NOT NULL,
  `Client_Client_id` INT NOT NULL,
  `Store_Store_id` INT NOT NULL,
  `Employee_Employee_id` INT NULL,
  `DeliveryDateTime` DATETIME NULL,
  PRIMARY KEY (`SalesOrder_id`, `DeliveryMethod_DeliveryMethod_id`, `Client_Client_id`, `Store_Store_id`),
  UNIQUE INDEX `SalesOrder_id_UNIQUE` (`SalesOrder_id` ASC) VISIBLE,
  INDEX `fk_SalesOrder_DeliveryMethod1_idx` (`DeliveryMethod_DeliveryMethod_id` ASC) VISIBLE,
  INDEX `fk_SalesOrder_Client1_idx` (`Client_Client_id` ASC) VISIBLE,
  INDEX `fk_SalesOrder_Employee1_idx` (`Employee_Employee_id` ASC) VISIBLE,
  INDEX `fk_SalesOrder_Store1_idx` (`Store_Store_id` ASC) VISIBLE,
  CONSTRAINT `fk_SalesOrder_DeliveryMethod1`
    FOREIGN KEY (`DeliveryMethod_DeliveryMethod_id`)
    REFERENCES `Pizzeria`.`DeliveryMethod` (`DeliveryMethod_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SalesOrder_Client1`
    FOREIGN KEY (`Client_Client_id`)
    REFERENCES `Pizzeria`.`Client` (`Client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SalesOrder_Employee1`
    FOREIGN KEY (`Employee_Employee_id`)
    REFERENCES `Pizzeria`.`Employee` (`Employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SalesOrder_Store1`
    FOREIGN KEY (`Store_Store_id`)
    REFERENCES `Pizzeria`.`Store` (`Store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Product` (
  `Product_id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `Description` VARCHAR(500) NOT NULL,
  `Image` MEDIUMBLOB NULL,
  `Price` DECIMAL(10,2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Product_id`),
  UNIQUE INDEX `Product_id_UNIQUE` (`Product_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`OrderDetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`OrderDetail` (
  `OrderDetail_id` INT NOT NULL AUTO_INCREMENT,
  `Quantity` INT NOT NULL,
  `SubTotal` DECIMAL(10,2) NOT NULL DEFAULT 0,
  `SalesOrder_SalesOrder_id` INT NOT NULL,
  `Product_Product_id` INT NOT NULL,
  PRIMARY KEY (`OrderDetail_id`, `SalesOrder_SalesOrder_id`, `Product_Product_id`),
  UNIQUE INDEX `OrderDetail_id_UNIQUE` (`OrderDetail_id` ASC) VISIBLE,
  INDEX `fk_OrderDetail_SalesOrder1_idx` (`SalesOrder_SalesOrder_id` ASC) VISIBLE,
  INDEX `fk_OrderDetail_Product1_idx` (`Product_Product_id` ASC) VISIBLE,
  CONSTRAINT `fk_OrderDetail_SalesOrder1`
    FOREIGN KEY (`SalesOrder_SalesOrder_id`)
    REFERENCES `Pizzeria`.`SalesOrder` (`SalesOrder_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderDetail_Product1`
    FOREIGN KEY (`Product_Product_id`)
    REFERENCES `Pizzeria`.`Product` (`Product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`PizzaCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`PizzaCategory` (
  `PizzaCategory_id` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PizzaCategory_id`),
  UNIQUE INDEX `PizzaCategory_id_UNIQUE` (`PizzaCategory_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`Pizza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Pizza` (
  `Product_Product_id` INT NOT NULL,
  `PizzaCategory_PizzaCategory_id` INT NOT NULL,
  PRIMARY KEY (`Product_Product_id`, `PizzaCategory_PizzaCategory_id`),
  INDEX `fk_Pizza_PizzaCategory1_idx` (`PizzaCategory_PizzaCategory_id` ASC) VISIBLE,
  CONSTRAINT `fk_Pizza_Product1`
    FOREIGN KEY (`Product_Product_id`)
    REFERENCES `Pizzeria`.`Product` (`Product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pizza_PizzaCategory1`
    FOREIGN KEY (`PizzaCategory_PizzaCategory_id`)
    REFERENCES `Pizzeria`.`PizzaCategory` (`PizzaCategory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`Beverage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Beverage` (
  `Product_Product_id` INT NOT NULL,
  PRIMARY KEY (`Product_Product_id`),
  INDEX `fk_Beverage_Product1_idx` (`Product_Product_id` ASC) VISIBLE,
  CONSTRAINT `fk_Beverage_Product1`
    FOREIGN KEY (`Product_Product_id`)
    REFERENCES `Pizzeria`.`Product` (`Product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`Burger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Burger` (
  `Product_Product_id` INT NOT NULL,
  PRIMARY KEY (`Product_Product_id`),
  CONSTRAINT `fk_Burger_Product1`
    FOREIGN KEY (`Product_Product_id`)
    REFERENCES `Pizzeria`.`Product` (`Product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
