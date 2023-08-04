CREATE OR ALTER PROCEDURE [dbo].[sp_MenuSettingsGet_ByCustomerFirmBranch]
(
	@CustomerFirmBranchId INT
)
AS
BEGIN
	SELECT *
	FROM MenuSetting 
	WHERE CustomerFirmBranchId = @CustomerFirmBranchId
	AND CustomerUserId IS NULL
END
GO