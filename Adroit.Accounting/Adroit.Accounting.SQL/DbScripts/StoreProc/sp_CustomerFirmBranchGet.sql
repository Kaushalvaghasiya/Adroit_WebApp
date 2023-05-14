CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM CustomerFirmBranch WHERE Id = @Id
END
GO