CREATE OR ALTER PROCEDURE [dbo].[sp_StateGet]
(
	@Id INT
)
AS
BEGIN
	SELECT 
		*
	FROM State
	WHERE Id = @Id
END