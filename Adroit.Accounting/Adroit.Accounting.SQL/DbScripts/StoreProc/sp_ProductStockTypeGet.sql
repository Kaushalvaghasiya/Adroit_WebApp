CREATE OR ALTER PROCEDURE [dbo].[sp_ProductStockTypeGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM ProductStockType
	WHERE Id = @Id
END
GO