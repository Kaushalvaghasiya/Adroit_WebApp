CREATE OR ALTER PROCEDURE [dbo].[sp_GetCitiesByName]
(
	@Cities NVARCHAR(50)
)
AS
BEGIN
	SELECT 
		City.*
	FROM City
	WHERE City.Title LIKE '%' + @Cities + '%' 
	AND City.Active = 1
END