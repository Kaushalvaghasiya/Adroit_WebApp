CREATE OR ALTER PROCEDURE [dbo].[sp_MenuSettingsGet_BySoftware]
(
	@SoftwareId TINYINT
)
AS
BEGIN
	SELECT *
	FROM MenuSetting 
	WHERE SoftwareId = @SoftwareId
	and SoftwarePlanId IS NULL
	AND CustomerId IS NULL
	AND CusomerFirmId IS NULL
	AND CustomerFirmBranchId IS NULL	
	AND CustomerUserId IS NULL
END
GO