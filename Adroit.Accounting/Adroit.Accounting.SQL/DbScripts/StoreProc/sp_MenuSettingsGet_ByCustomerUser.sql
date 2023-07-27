CREATE OR ALTER PROCEDURE [dbo].[sp_MenuSettingsGet_ByCustomerUser]
(
	@CustomerFirmBranchId INT,
	@CustomerUserId INT
)
AS
BEGIN
	SELECT *
	FROM MenuSetting 
	WHERE CustomerFirmBranchId = @CustomerFirmBranchId
	AND CustomerUserId = @CustomerUserId
END
GO