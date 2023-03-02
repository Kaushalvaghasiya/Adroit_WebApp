CREATE OR ALTER PROCEDURE [dbo].[sp_StateList_Select]
	@CountryId int = 0
AS
BEGIN
	IF @CountryId > 0
	BEGIN
		SELECT Id,Title
		FROM [State]
		WHERE CountryId = @CountryId
	END
	ELSE
	BEGIN
		SELECT Id,Title
		FROM [State]
	END	
END
GO
