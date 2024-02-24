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

	SELECT LRNumber AS [Text]
	FROM [Z-LRBooking-Z]
	WHERE Id NOT IN (SELECT DISTINCT [Z-SalesBillDetail-Z].LRBookingId FROM [Z-SalesBillDetail-Z] WHERE [BranchId] = @BranchId AND [Z-SalesBillDetail-Z].Deleted = 0 ) 
		AND [BranchId] = @BranchId
		AND YearId = @YearId 
		AND Deleted = 0 
		AND LRPayTypeId IN ('2', '3')		    
	ORDER BY LRNumber
END
GO