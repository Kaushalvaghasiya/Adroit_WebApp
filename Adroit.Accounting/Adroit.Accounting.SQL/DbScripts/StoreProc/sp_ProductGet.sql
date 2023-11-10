CREATE OR ALTER PROCEDURE [dbo].[sp_ProductGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM Product
	WHERE Product.Id = @Id
END
GO