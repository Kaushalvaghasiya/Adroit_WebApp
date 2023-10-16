CREATE OR ALTER PROCEDURE [dbo].[sp_CityGet]
(
	@Id INT
)
AS
BEGIN
	SELECT 
		City.*,
			Taluka.Title AS TalukaName,
			District.Id AS DistrictId,
			State.Id AS StateId,
			Country.Id As CountryId
	FROM City
	INNER JOIN Taluka ON Taluka.Id = City.TalukaId 
	INNER JOIN District ON District.Id = Taluka.DistrictId
	INNER JOIN State ON State.Id = District.StateId
	INNER JOIN Country ON Country.Id = State.CountryId
	WHERE City.Id = @Id
END