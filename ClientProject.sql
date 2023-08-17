DELIMITER $$
DROP PROCEDURE IF EXISTS clientProject $$
CREATE PROCEDURE clientProject()
BEGIN
    START TRANSACTION;

		CREATE TABLE ClientProjects (
		ClientProjectID SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		ClientID SMALLINT UNSIGNED NOT NULL,
        ProjectID SMALLINT UNSIGNED NOT NULL
		);

        ALTER TABLE ClientProjects 
        ADD FOREIGN KEY (ClientID) REFERENCES ClientData(ClientId);

        ALTER TABLE ClientProjects 
        ADD FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID);

		ALTER TABLE ClientProjects
        ADD CONSTRAINT ProjectID  UNIQUE (ProjectID);

    END $$
DELIMITER ;
CALL clientProject();