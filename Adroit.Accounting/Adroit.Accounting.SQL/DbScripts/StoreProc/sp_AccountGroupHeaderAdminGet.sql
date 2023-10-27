CREATE OR ALTER PROCEDURE [dbo].[sp_AccountGroupHeaderAdminGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM AccountGroupHeaderAdmin WHERE Id = @Id
END
GO