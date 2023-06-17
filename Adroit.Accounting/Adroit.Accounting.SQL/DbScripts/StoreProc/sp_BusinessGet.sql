CREATE OR ALTER PROCEDURE [dbo].[sp_BusinessGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *, dbo.fn_GetBusinessSoftwareIds(Id) AS SoftwareIds
	FROM Business WHERE Id = @Id
END
GO