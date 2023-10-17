CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountList_Select]
(
	@LoginId int, 
	@FirmId int
)
AS
BEGIN
	SELECT [CustomerAccount].Id As Value, [Name] As Text
	FROM [CustomerAccount] 
	WHERE Deleted = 0
	AND Active = 1
	ORDER BY [Name]
END
GO