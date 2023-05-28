CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerList_Select]
AS
BEGIN
	SELECT Id,[name]
	FROM [Customer]
	ORDER BY [Customer].[name]
END
GO