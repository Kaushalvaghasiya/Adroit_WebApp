CREATE OR ALTER PROCEDURE [dbo].[sp_BookTypeAdminGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM BookTypeAdmin
	WHERE Id = @Id
END
GO