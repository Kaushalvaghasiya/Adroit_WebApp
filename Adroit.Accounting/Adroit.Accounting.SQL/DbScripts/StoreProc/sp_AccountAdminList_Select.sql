CREATE OR ALTER   PROCEDURE [dbo].[sp_AccountAdminList_Select]
	@LoginId int, 
	@FirmId int
AS
BEGIN
	SELECT Id, [Name], PrintName
	FROM AccountAdmin 
	WHERE IsDeleted = 0 and IsActive = 1
	ORDER BY [Name], PrintName
END
GO