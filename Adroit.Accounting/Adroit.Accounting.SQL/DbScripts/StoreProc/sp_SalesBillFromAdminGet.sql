CREATE OR ALTER PROCEDURE [dbo].[sp_SalesBillFromAdminGet]
(
	@Id CHAR(1)
)
AS
BEGIN
	SELECT *
	FROM SalesBillFromAdmin
	WHERE Id = @Id
END
GO