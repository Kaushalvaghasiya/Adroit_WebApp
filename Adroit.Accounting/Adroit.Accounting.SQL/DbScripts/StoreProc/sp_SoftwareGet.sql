CREATE OR ALTER PROCEDURE [dbo].[sp_SoftwareGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM Software WHERE Id = @Id
END
GO