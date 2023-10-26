CREATE OR ALTER PROCEDURE [dbo].[sp_ProductSizeGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM ProductSize WHERE Id = @Id
END
GO