CREATE OR ALTER PROCEDURE [dbo].[sp_StateList_Select]
	@CountryId int = 0
AS
BEGIN
	SELECT Id As Value,Title As Text
	FROM [State]
	WHERE (@CountryId = 0 OR CountryId = @CountryId)
	AND Active = 1
	ORDER BY Title
END
GO
