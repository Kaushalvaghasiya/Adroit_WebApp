CREATE OR ALTER PROCEDURE [dbo].[sp_GSTCollectionGetByGSTNumber]
(
	@GSTNumber VARCHAR(15)
)
AS
BEGIN
	SELECT TOP 1 
		GSTCollection.*,
		City.Id As CityId,  
		Taluka.Id As TalukaId,
		District.Id As DistrictId,
		State.Id As StateId,
		Country.Id As CountryId
	FROM GSTCollection
	LEFT JOIN City ON GSTCollection.City = City.Title
	LEFT JOIN Taluka ON City.TalukaId = Taluka.Id
	LEFT JOIN District ON Taluka.DistrictId = District.Id
	LEFT JOIN State ON District.StateId = State.Id
	LEFT JOIN Country ON State.CountryId = Country.Id
	WHERE GSTNumber = @GSTNumber
	AND GSTCollection.Active = 1
END
GO