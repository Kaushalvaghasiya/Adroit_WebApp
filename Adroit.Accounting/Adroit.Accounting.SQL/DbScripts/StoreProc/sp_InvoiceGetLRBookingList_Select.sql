CREATE OR ALTER PROCEDURE [dbo].[sp_InvoiceGetLRBookingList_Select]
(
	@LoginId INT,
	@FirmId INT,
	@BranchId AS INT
)
AS
BEGIN
	DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirm(@FirmId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	SELECT LRNumber AS [Text], Id As Value
	FROM [Z-LRBooking-Z]
	WHERE Id NOT IN (SELECT DISTINCT ISNULL([Z-SalesBillDetail-Z].LRBookingId, 0) 
						FROM [Z-SalesBillMaster-Z]
						INNER JOIN [Z-SalesBillDetail-Z] ON [Z-SalesBillMaster-Z].Id = [Z-SalesBillDetail-Z].SalesBillMasterId
						WHERE [BranchId] = @BranchId 
						AND EntryTypeId = 23
						AND [Z-SalesBillDetail-Z].Deleted = 0 ) 
		AND [BranchId] = @BranchId
		AND YearId = @YearId 
		AND Deleted = 0 
		AND LRPayTypeId IN ('2', '3') -- Paid & Tbb	    
	ORDER BY LRNumber
END
GO