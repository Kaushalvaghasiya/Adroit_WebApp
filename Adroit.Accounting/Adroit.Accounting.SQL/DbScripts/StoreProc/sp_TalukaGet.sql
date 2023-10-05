CREATE OR ALTER PROCEDURE [dbo].[sp_TalukaGet]
(
	@Id INT
)
AS
BEGIN
	SELECT 
		Taluka.*,
			District.Title as DistrictName,
			District.Id AS DistrictId,
			State.Id AS StateId,
			Country.Id As CountryId
	FROM Taluka
	INNER JOIN District ON District.Id = Taluka.DistrictId 
	INNER JOIN State ON State.Id = District.StateId
	INNER JOIN Country ON Country.Id = State.CountryId
	WHERE Taluka.Id = @Id
END