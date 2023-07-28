CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountGet]
(
	@LoginId int = 0,
	@FirmId int = 0,
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM CustomerAccount 
	WHERE Id = @Id
END
GO