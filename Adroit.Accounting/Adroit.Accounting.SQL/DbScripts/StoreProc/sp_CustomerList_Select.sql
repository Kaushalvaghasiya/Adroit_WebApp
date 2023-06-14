CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerList_Select]
AS
BEGIN
	SELECT Id As Value,[Name] As Text
	FROM [Customer]
	WHERE IsDeleted = 0 AND IsActive = 1
	ORDER BY [Name]
END
GO