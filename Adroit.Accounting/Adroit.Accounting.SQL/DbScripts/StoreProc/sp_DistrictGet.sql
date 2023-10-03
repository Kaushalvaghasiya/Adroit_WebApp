CREATE OR ALTER   PROCEDURE [dbo].[sp_DistrictGet]
(
	@Id INT
)
AS
BEGIN
	SELECT 
		District.*,
			[State].Title as StateName
	FROM District
	INNER JOIN [State] ON State.Id = District.StateId 
	WHERE District.Id = @Id
END