CREATE OR ALTER PROCEDURE [dbo].[sp_BusinessGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM Business WHERE Id = @Id
END
GO