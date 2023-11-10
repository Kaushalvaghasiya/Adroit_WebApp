CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchLRRateGet]
(
	@Id INT
)
AS
BEGIN
	SELECT 
		CustomerFirmBranchLRRate.*
	FROM CustomerFirmBranchLRRate 
	WHERE CustomerFirmBranchLRRate.Id = @Id
END
GO