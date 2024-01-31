CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountList_Select]
(
	@LoginId int
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerId(@LoginId);

	SELECT [CustomerAccount].Id As Value
	,COALESCE(NULLIF([CustomerAccount].PrintName, ''), [CustomerAccount].[Name]) As Text
	FROM [CustomerAccount] 
	WHERE [CustomerAccount].CustomerId = @CustomerId
	AND Deleted = 0
	AND Active = 1 
	ORDER BY Text
END
GO