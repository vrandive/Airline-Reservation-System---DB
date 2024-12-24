-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema airline_reservation
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema airline_reservation
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `airline_reservation` DEFAULT CHARACTER SET utf8 ;
USE `airline_reservation` ;

-- -----------------------------------------------------
-- Table `airline_reservation`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airline_reservation`.`User` (
  `User_Id` INT NOT NULL,
  `User_Name` VARCHAR(60) NULL,
  `First_Name` VARCHAR(60) NULL,
  `Last_Name` VARCHAR(60) NULL,
  `Gender` VARCHAR(45) NULL,
  `Phone_Number` VARCHAR(45) NULL,
  PRIMARY KEY (`User_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airline_reservation`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airline_reservation`.`Payment` (
  `Transaction_Id` INT NOT NULL,
  `Payment_Mode` VARCHAR(50) NULL,
  `Amount` FLOAT NULL,
  PRIMARY KEY (`Transaction_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airline_reservation`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airline_reservation`.`Ticket` (
  `PNR_Number` VARCHAR(45) NOT NULL,
  `Passenger_Name` VARCHAR(100) NULL,
  `Seat_Number` VARCHAR(45) NULL,
  `Destination` VARCHAR(90) NULL,
  `Source` VARCHAR(90) NULL,
  `Date_Time` DATETIME NULL,
  `User_User_Id` INT NOT NULL,
  `Payment_Transaction_Id` INT NOT NULL,
  PRIMARY KEY (`PNR_Number`),
  INDEX `fk_Ticket_User_idx` (`User_User_Id` ASC) VISIBLE,
  INDEX `fk_Ticket_Payment1_idx` (`Payment_Transaction_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_User`
    FOREIGN KEY (`User_User_Id`)
    REFERENCES `airline_reservation`.`User` (`User_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket_Payment1`
    FOREIGN KEY (`Payment_Transaction_Id`)
    REFERENCES `airline_reservation`.`Payment` (`Transaction_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airline_reservation`.`Airline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airline_reservation`.`Airline` (
  `Airline_Id` INT NOT NULL,
  `Airline_Name` VARCHAR(90) NULL,
  `Contact_Number` VARCHAR(45) NULL,
  PRIMARY KEY (`Airline_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airline_reservation`.`Flight`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airline_reservation`.`Flight` (
  `Flight_Number` VARCHAR(45) NOT NULL,
  `Flight_Name` VARCHAR(80) NULL,
  `Departure_Time` TIME NULL,
  `Distance` FLOAT NULL,
  `Arrival_Time` TIME NULL,
  `Airline_Airline_Id` INT NOT NULL,
  `Ticket_PNR_Number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Flight_Number`),
  INDEX `fk_Flight_Airline1_idx` (`Airline_Airline_Id` ASC) VISIBLE,
  INDEX `fk_Flight_Ticket1_idx` (`Ticket_PNR_Number` ASC) VISIBLE,
  CONSTRAINT `fk_Flight_Airline1`
    FOREIGN KEY (`Airline_Airline_Id`)
    REFERENCES `airline_reservation`.`Airline` (`Airline_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flight_Ticket1`
    FOREIGN KEY (`Ticket_PNR_Number`)
    REFERENCES `airline_reservation`.`Ticket` (`PNR_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airline_reservation`.`Class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airline_reservation`.`Class` (
  `Class_Number` INT NOT NULL,
  `Fare` INT NULL,
  `Class_Type` VARCHAR(45) NULL,
  `Flight_Flight_Number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Class_Number`),
  INDEX `fk_Class_Flight1_idx` (`Flight_Flight_Number` ASC) VISIBLE,
  CONSTRAINT `fk_Class_Flight1`
    FOREIGN KEY (`Flight_Flight_Number`)
    REFERENCES `airline_reservation`.`Flight` (`Flight_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airline_reservation`.`Flight_has_User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airline_reservation`.`Flight_has_User` (
  `Flight_Flight_Number` VARCHAR(45) NOT NULL,
  `User_User_Id` INT NOT NULL,
  PRIMARY KEY (`Flight_Flight_Number`, `User_User_Id`),
  INDEX `fk_Flight_has_User_User1_idx` (`User_User_Id` ASC) VISIBLE,
  INDEX `fk_Flight_has_User_Flight1_idx` (`Flight_Flight_Number` ASC) VISIBLE,
  CONSTRAINT `fk_Flight_has_User_Flight1`
    FOREIGN KEY (`Flight_Flight_Number`)
    REFERENCES `airline_reservation`.`Flight` (`Flight_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flight_has_User_User1`
    FOREIGN KEY (`User_User_Id`)
    REFERENCES `airline_reservation`.`User` (`User_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS=0;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
