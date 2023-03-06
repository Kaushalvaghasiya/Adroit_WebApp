CREATE OR ALTER   PROCEDURE [dbo].[sp_BookAdminGet]
(
	@LoginId int = 0
	,@FirmId int = 0
	,@Id INT
)
AS
BEGIN
	SELECT *
	FROM BookAdmin
	WHERE Id = @Id
END
GO