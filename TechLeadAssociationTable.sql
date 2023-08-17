DELIMITER $$
DROP PROCEDURE IF EXISTS createTechLeadTable $$
CREATE PROCEDURE createTechLeadTable()
BEGIN
    START TRANSACTION;
		ALTER TABLE Kainoos_AdamU.DeliveryEmployee
		CHANGE DeliveryEmployeeID DeliveryEmployeeID SMALLINT UNSIGNED;
        
		CREATE TABLE IF NOT EXISTS TechLeadAssociation (
			TechLeadID SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
            DeliveryEmployeeID SMALLINT UNSIGNED NOT NULL,
            ProjectID SMALLINT UNSIGNED NOT NULL
		);
		ALTER TABLE Kainoos_AdamU.TechLeadAssociation
        ADD FOREIGN KEY (DeliveryEmployeeID) REFERENCES Kainoos_AdamU.DeliveryEmployee(DeliveryEmployeeID);

		ALTER TABLE Kainoos_AdamU.TechLeadAssociation
        ADD FOREIGN KEY (ProjectID) REFERENCES Kainoos_AdamU.Projects(ProjectID);

        ALTER TABLE Kainoos_AdamU.Projects
        ADD COLUMN TechLeadID SMALLINT UNSIGNED NOT NULL;

		ALTER TABLE Kainoos_AdamU.Projects
        ADD FOREIGN KEY (TechLeadID) REFERENCES Kainoos_AdamU.TechLeadAssociation(TechLeadID);

        ALTER TABLE Kainoos_AdamU.TechLeadAssociaiton
		ADD CONSTRAINT ProjectID UNIQUE KEY (ProjectID);
    END $$
DELIMITER ;
CALL createTechLeadTable();