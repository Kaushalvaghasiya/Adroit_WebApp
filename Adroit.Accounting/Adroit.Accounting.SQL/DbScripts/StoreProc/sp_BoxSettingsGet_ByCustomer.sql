CREATE OR ALTER PROCEDURE [dbo].[sp_BoxSettingsGet_ByCustomer]
(
	@CustomerId INT
)
AS
BEGIN
	SELECT *
	FROM BoxSetting 
	WHERE CustomerId = @CustomerId
	AND CusomerFirmId IS NULL
END
GO