CREATE OR ALTER PROCEDURE [dbo].[sp_InvoiceGetLRBookingList_Select]
(
	@LoginId INT,
	@FirmId INT,
	@BranchId AS INT,
	@LRPayTypeId AS INT
)
AS
BEGIN
	DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirm(@FirmId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	SELECT [Z-LRBooking-Z].LRNumber AS Text
	FROM [Z-LRBooking-Z]
	WHERE [Z-LRBooking-Z].Id NOT IN ( SELECT DISTINCT [Z-PurchaseBillDetail-Z].LRBookingId FROM [Z-PurchaseBillDetail-Z] WHERE [Z-PurchaseBillDetail-Z].Deleted = 0 )
		AND [Z-LRBooking-Z].Id NOT IN ( SELECT DISTINCT [Z-SalesBillDetail-Z].LRBookingId FROM [Z-SalesBillDetail-Z] WHERE [Z-SalesBillDetail-Z].Deleted = 0 ) 
		AND [Z-LRBooking-Z].[BranchId] = @BranchId
		AND [Z-LRBooking-Z].YearId = @YearId 
		AND [Z-LRBooking-Z].Deleted = 0 
		AND (@LRPayTypeId = '2' OR [Z-LRBooking-Z].LRPayTypeId = @LRPayTypeId)
END
GO