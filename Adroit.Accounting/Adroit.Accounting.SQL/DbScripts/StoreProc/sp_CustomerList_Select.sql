CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerList_Select]
AS
BEGIN
	SELECT Id As Value,[Name] As Text
	FROM [Customer]
	WHERE Deleted = 0
	AND Active = 1
	ORDER BY [Name]
END
GO