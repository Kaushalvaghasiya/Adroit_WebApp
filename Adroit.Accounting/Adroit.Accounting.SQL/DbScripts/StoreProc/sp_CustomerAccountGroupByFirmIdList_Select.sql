CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountGroupByFirmIdList_Select]
(
	@FirmId int
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirmId(@FirmId);
	
	SELECT [CustomerAccountGroup].Id As Value, [CustomerAccountGroup].Title + ' (' + [CustomerAccountGroup].Code + ')' As Text 
	FROM [CustomerAccountGroup] 
	WHERE Deleted = 0 
	AND Active = 1 
	AND [CustomerId] = @CustomerId 
	ORDER BY Title
END
GO