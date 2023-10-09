CREATE OR ALTER   PROCEDURE [dbo].[sp_DistrictGet]
(
	@Id INT
)
AS
BEGIN
	SELECT 
		District.*,
			[State].Title as StateName,
			Country.Id As CountryId
	FROM District
	INNER JOIN [State] ON State.Id = District.StateId
	INNER JOIN Country ON Country.Id = State.CountryId
	WHERE District.Id = @Id
END