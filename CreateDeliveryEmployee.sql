DELIMITER $$
DROP PROCEDURE IF EXISTS create_deliveryEmployee $$
CREATE PROCEDURE create_deliveryEmployee()
BEGIN
    START TRANSACTION;
		CREATE TABLE Kainoos_AdamU.DeliveryEmployee (
		DeliveryEmployeeID INT PRIMARY KEY AUTO_INCREMENT,
		EmployeeID SMALLINT UNSIGNED NOT NULL, 
		FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
		FOREIGN KEY (EmployeeBankInfoID) REFERENCES EmployeeBankInfo(EmployeeBankInfoID)
		);
    END $$
DELIMITER ;
CALL create_deliveryEmployee();