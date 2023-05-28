CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM CustomerFirm WHERE Id = @Id
END
GO