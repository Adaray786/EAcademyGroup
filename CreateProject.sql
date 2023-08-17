DELIMITER $$
DROP PROCEDURE IF EXISTS createProjectTable $$
CREATE PROCEDURE createProjectTable()
BEGIN
    START TRANSACTION;
		CREATE TABLE Projects (
		ProjectID SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		ProjectName VARCHAR(50) NOT NULL,
		ProjectValue DECIMAL(15, 2) NOT NULL,
        ProjectTechLeadID SMALLINT UNSIGNED NOT NULL
		);

		CREATE TABLE ProjectTechnologies (
		TechID SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		TechnologyName VARCHAR(50) NOT NULL,
		ProjectID SMALLINT UNSIGNED NOT NULL
		);

        ALTER TABLE Kainoos_AdamU.Projects 
        ADD FOREIGN KEY (ProjectTechLeadID) REFERENCES ProjectTechnologies(ProjectTechLeadID);
        
        ALTER TABLE Kainoos_AdamU.ProjectTechnologies
        ADD FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID);
    END $$
DELIMITER ;
CALL createProjectTable();