CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountOpeningBalanceGet]
(
	@Id INT
)
AS
BEGIN
	SELECT CustomerAccountOpeningBalance.*
		 --  (SELECT STUFF((SELECT ',' + CAST(t1.BranchId AS VARCHAR) FROM CustomerAccountBranchMapping t1
			--		WHERE t1.AccountId = t.AccountId FOR XML PATH('')),1,1,'') Concats
			--FROM  CustomerAccountBranchMapping t
			--WHERE t.AccountId = @Id GROUP BY t.AccountId) AS CustomerAccountBranchIds,
		   
		 --  YearId
	FROM CustomerAccountOpeningBalance
	WHERE CustomerAccountOpeningBalance.Id = @Id
END
GO