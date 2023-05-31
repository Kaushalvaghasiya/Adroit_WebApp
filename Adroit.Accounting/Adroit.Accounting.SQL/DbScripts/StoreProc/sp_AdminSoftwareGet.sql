CREATE OR ALTER PROCEDURE [dbo].[sp_AdminSoftwareGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM Software WHERE Id = @Id
END
GO