CREATE OR ALTER PROCEDURE [dbo].[sp_ProductSizeAdminGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM ProductSizeAdmin WHERE Id = @Id
END
GO