CREATE OR ALTER PROCEDURE [dbo].[sp_BusinessGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM FirmBranchTypeAdmin 
	WHERE Id = @Id
END
GO