DELIMITER $$
DROP PROCEDURE IF EXISTS create_Employee $$
CREATE PROCEDURE create_Employee()
BEGIN
    START TRANSACTION;
		CREATE DATABASE IF NOT EXISTS Kainoos_AdamU;
		
		-- Create SalesEmployees Table

		CREATE TABLE IF NOT EXISTS Kainoos_AdamU.Employees (
		EmployeeID SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		Name VARCHAR(100) NOT NULL,
		NationalInsuranceNumber VARCHAR(20) NOT NULL
		);

		-- Create EmployeeInfo Table

		CREATE TABLE IF NOT EXISTS Kainoos_AdamU.EmployeeBankInfo (
		EmployeeBankInfoID SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		EmployeeID SMALLINT UNSIGNED NOT NULL,
		BankAccountNumber VARCHAR(8) NOT NULL
		);

		-- Create RoleTable

		CREATE TABLE IF NOT EXISTS Kainoos_AdamU.SalesEmployeeInfo (
		SalesEmployeeInfoID SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        EmployeeID SMALLINT UNSIGNED NOT NULL,
		Commision DECIMAL (5,2) NOT NULL
		);
        
        
        ALTER TABLE Kainoos_AdamU.EmployeeBankInfo
        ADD FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);
        
        ALTER TABLE Kainoos_AdamU.SalesEmployeeInfo
        ADD FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);
    END $$
DELIMITER ;
CALL create_Employee();