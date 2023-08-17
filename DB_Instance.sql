DELIMITER $$
DROP PROCEDURE IF EXISTS my_transaction $$
CREATE PROCEDURE my_transaction()
BEGIN
    START TRANSACTION;
		-- Create database if not exists.
		-- DROP DATABASE IF EXISTS Kainoos_AdamU;
		CREATE DATABASE IF NOT EXISTS Kainoos_AdamU;
		
		-- Create SalesEmployees Table

		CREATE TABLE IF NOT EXISTS Kainoos_AdamU.Employees (
		EmployeeID SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		Name VARCHAR(100) NOT NULL,
		EmployeeRoleID SMALLINT UNSIGNED NOT NULL
        -- FOREIGN KEY (EmployeeRoleID) REFERENCES EmployeeRole(EmployeeRoleID)
		);

		-- Create EmployeeInfo Table

		CREATE TABLE IF NOT EXISTS Kainoos_AdamU.EmployeeBankInfo (
		EmployeeBankInfoID SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		EmployeeID SMALLINT UNSIGNED NOT NULL,
		BankAccountNumber VARCHAR(8) NOT NULL,
		NationalInsuranceNumber VARCHAR(20) NOT NULL
		-- FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
		);

		-- Create RoleTable

		CREATE TABLE IF NOT EXISTS Kainoos_AdamU.EmployeeRole (
		EmployeeRoleID SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		EmployeeID SMALLINT UNSIGNED NOT NULL,
		Role VARCHAR(20) NOT NULL
		-- FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
		);
        
        ALTER TABLE Kainoos_AdamU.Employees
        ADD FOREIGN KEY (EmployeeRoleID) REFERENCES EmployeeRole(EmployeeRoleID);
        
        ALTER TABLE Kainoos_AdamU.EmployeeBankInfo
        ADD FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);
        
        ALTER TABLE Kainoos_AdamU.EmployeeRole
        ADD FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);
    END $$
DELIMITER ;
CALL my_transaction();