CREATE OR ALTER PROCEDURE [dbo].[sp_BoxSettingsGet_BySoftware]
(
	@SoftwareId TINYINT
)
AS
BEGIN
	SELECT *
	FROM BoxSetting
	WHERE SoftwareId = @SoftwareId
	AND CustomerId IS NULL
	AND CusomerFirmId IS NULL
END
GO