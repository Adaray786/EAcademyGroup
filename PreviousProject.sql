DELIMITER $$
DROP PROCEDURE IF EXISTS previousProject $$
CREATE PROCEDURE previousProject()
BEGIN
    START TRANSACTION;
    DROP TABLE PreviousProject;
    CREATE TABLE PreviousProject (
		PreviousProjectID SMALLINT PRIMARY KEY AUTO_INCREMENT,
        DeliveryEmployeeID SMALLINT UNSIGNED,
        ProjectID SMALLINT UNSIGNED
        );
	
    ALTER TABLE Kainoos_AdamU.PreviousProject
    ADD FOREIGN KEY (DeliveryEmployeeID) REFERENCES DeliveryEmployee(DeliveryEmployeeID);
    
    ALTER TABLE Kainoos_AdamU.PreviousProject
    ADD FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID);
    END $$
DELIMITER ;
CALL previousProject();