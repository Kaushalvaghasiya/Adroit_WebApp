--EXEC [dbo].[sp_CityGet] 1
CREATE OR ALTER PROCEDURE [dbo].[sp_CityGet]
(
	@Id INT
)
AS
BEGIN
	SELECT 
		city.*,
			Taluka.Title as TalukaName
	FROM city
	INNER JOIN Taluka ON Taluka.Id = city.TalukaId 
	WHERE city.Id = @Id
END