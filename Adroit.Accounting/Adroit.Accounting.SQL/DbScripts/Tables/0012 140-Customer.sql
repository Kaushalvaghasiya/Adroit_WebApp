ALTER TABLE [SystemSetting] add [NewRegistrationSoftwarePlanId] TINYINT NOT NULL DEFAULT(1)
GO

DECLARE @ID TINYINT
INSERT INTO [FirmBranchTypeAdmin] (Title, OrderNumber, IsDeleted, Active) VALUES ('Head Office', 0, 0, 1)
SET @ID = SCOPE_IDENTITY()

UPDATE [SystemSetting] SET NewRegistrationFirmBranchTypeId = @ID 
GO