CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountGroupByLoginIdList_Select]
(
	@LoginId int
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerId(@LoginId);
	
	SELECT [CustomerAccountGroup].Id As Value, [CustomerAccountGroup].Title + ' (' + [CustomerAccountGroup].Code + ')' As Text 
	FROM [CustomerAccountGroup] 
	WHERE Deleted = 0 
	AND Active = 1 
	AND [CustomerId] = @CustomerId 
	ORDER BY Title
END
GO