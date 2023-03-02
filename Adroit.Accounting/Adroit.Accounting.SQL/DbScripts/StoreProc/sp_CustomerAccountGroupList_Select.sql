CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountGroupList_Select]
	@LoginId int, 
	@FirmId int
AS
BEGIN
	SELECT Id,Title
	FROM [CustomerAccountGroup]
	WHERE IsDeleted = 0
	ORDER BY Title
END
GO