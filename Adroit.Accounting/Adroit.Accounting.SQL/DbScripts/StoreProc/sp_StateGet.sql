CREATE OR ALTER PROCEDURE [dbo].[sp_StateGet]
(
	@Id INT
)
AS
BEGIN
	SELECT 
		State.*
	FROM State
	INNER JOIN Country ON Country.Id = State.CountryId
	WHERE State.Id = @Id
END