CREATE OR ALTER PROCEDURE [dbo].[sp_ProductQualityTypeGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM ProductQualityType
	WHERE Id = @Id
END
GO