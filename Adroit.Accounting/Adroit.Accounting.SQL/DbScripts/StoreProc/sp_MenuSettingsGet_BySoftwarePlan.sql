CREATE OR ALTER PROCEDURE [dbo].[sp_MenuSettingsGet_BySoftwarePlan]
(
	@SoftwarePlanId TINYINT
)
AS
BEGIN
	SELECT *
	FROM MenuSetting 
	WHERE SoftwarePlanId = @SoftwarePlanId
	AND CustomerId IS NULL
	AND CusomerFirmId IS NULL
	AND CustomerFirmBranchId IS NULL	
	AND CustomerUserId IS NULL
END
GO