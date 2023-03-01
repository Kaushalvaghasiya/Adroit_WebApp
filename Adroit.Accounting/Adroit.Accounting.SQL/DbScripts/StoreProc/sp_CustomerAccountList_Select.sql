CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountList_Select]
	@LoginId int, 
	@FirmId int
AS
BEGIN
	SELECT [CustomerAccount].Id, [Name]
	FROM [CustomerAccount] 
	WHERE IsDeleted = 0 and IsActive = 1
	ORDER BY [Name]
END
GO