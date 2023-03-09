CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM Customer WHERE Id = @Id
END
GO