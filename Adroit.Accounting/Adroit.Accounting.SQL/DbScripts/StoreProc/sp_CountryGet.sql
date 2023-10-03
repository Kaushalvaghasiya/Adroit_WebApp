CREATE OR ALTER PROCEDURE [dbo].[sp_CountryGet]
(
	@Id INT
)
AS
BEGIN
	SELECT 
		*
	FROM Country
	WHERE Id = @Id
END