CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *, CONVERT(VARCHAR(10), CustomerFirmBranch.RenewalDate, 101) as RenewalDateStr,
	   CONVERT(VARCHAR(10), CustomerFirmBranch.AddedOn, 101) as AddedOnStr
	FROM CustomerFirmBranch WHERE Id = @Id
END
GO