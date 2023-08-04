CREATE OR ALTER PROCEDURE [dbo].[sp_MenuSettingsGet_ByCustomerFirm]
(
	@CusomerFirmId INT
)
AS
BEGIN
	SELECT *
	FROM MenuSetting 
	WHERE CusomerFirmId = @CusomerFirmId
	AND CustomerFirmBranchId IS NULL	
	AND CustomerUserId IS NULL
END
GO