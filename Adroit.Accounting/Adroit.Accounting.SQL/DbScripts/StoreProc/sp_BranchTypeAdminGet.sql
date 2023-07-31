CREATE OR ALTER PROCEDURE [dbo].[sp_BranchTypeAdminGet]
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