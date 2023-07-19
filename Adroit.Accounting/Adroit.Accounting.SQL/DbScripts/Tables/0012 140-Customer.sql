ALTER TABLE [SystemSetting] add [NewRegistrationSoftwarePlanId] TINYINT NOT NULL DEFAULT(1)
GO

INSERT INTO [FirmBranchTypeAdmin] (Title, OrderNumber, IsDeleted, Active) VALUES ('Head Office', 0, 0, 1)
UPDATE [SystemSetting] SET NewRegistrationFirmBranchTypeId = 0
GO