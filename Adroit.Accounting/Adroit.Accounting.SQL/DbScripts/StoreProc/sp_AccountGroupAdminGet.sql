CREATE OR ALTER PROCEDURE [dbo].[sp_AccountGroupAdminGet]
(
	@Id INT
)
AS
BEGIN
	SELECT 
		AccountGroupAdmin.*,
		AccountGroupHeaderAdmin.Title as AccountGroupHeaderAdminName
	FROM AccountGroupAdmin
	INNER JOIN AccountGroupHeaderAdmin ON AccountGroupHeaderAdmin.Id = AccountGroupAdmin.AccountGroupHeaderId 
	WHERE AccountGroupAdmin.Id = @Id
END
GO