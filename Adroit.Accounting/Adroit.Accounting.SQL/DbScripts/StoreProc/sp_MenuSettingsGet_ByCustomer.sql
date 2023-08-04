CREATE OR ALTER PROCEDURE [dbo].[sp_MenuSettingsGet_ByCustomer]
(
	@CustomerId INT
)
AS
BEGIN
	SELECT *
	FROM MenuSetting 
	WHERE CustomerId = @CustomerId
	AND CusomerFirmId IS NULL
	AND CustomerFirmBranchId IS NULL	
	AND CustomerUserId IS NULL
END
GO