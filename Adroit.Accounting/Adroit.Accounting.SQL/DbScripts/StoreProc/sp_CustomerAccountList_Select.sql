CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountList_Select]
(
	@LoginId int, 
	@FirmId int
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT [CustomerAccount].Id As Value, [Name] As Text
	FROM [CustomerAccount] 
	WHERE Deleted = 0
	AND Active = 1 AND [CustomerAccount].CustomerId = @CustomerId
	ORDER BY [Name]
END
GO