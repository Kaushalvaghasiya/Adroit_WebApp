CREATE OR ALTER   PROCEDURE [dbo].[sp_CustomerInvoiceGet]
(
	 @LoginId INT
	,@BranchId INT
	,@Id INT
)
AS
BEGIN

	SELECT 
		SBM.*,
		(SELECT STUFF((SELECT ',' + CAST(t1.LRBookingId AS VARCHAR) FROM [Z-SalesBillDetail-Z] t1
						WHERE t1.SalesBillMasterId = t.SalesBillMasterId FOR XML PATH('')),1,1,'') Concats
			FROM  [Z-SalesBillDetail-Z] t
			WHERE t.SalesBillMasterId = @Id GROUP BY t.SalesBillMasterId) AS LRNumberId
	FROM [Z-SalesBillMaster-Z] SBM
	WHERE SBM.BranchId = @BranchId AND SBM.Id = @Id
	AND SBM.Deleted = 0

END
GO