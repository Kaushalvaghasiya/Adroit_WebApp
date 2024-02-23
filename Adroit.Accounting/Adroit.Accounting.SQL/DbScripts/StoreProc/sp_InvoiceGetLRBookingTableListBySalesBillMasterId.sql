CREATE OR ALTER PROCEDURE [dbo].[sp_InvoiceGetLRBookingTableListBySalesBillMasterId]
  @LoginId int,
  @BranchId int,
  @SalesBillMasterId int
AS
BEGIN
	DECLARE @CustomerId int = dbo.fn_GetCustomerId(@LoginId);

	   SELECT  
	    ROW_NUMBER() over (ORDER BY [Z-LRBooking-Z].Id ASC) AS RowNum,
		Count(*) over () AS TotalCount, 
		[Z-SalesBillDetail-Z].LRBookingId,
		[Z-LRBooking-Z].LRNumber,
		[Z-LRBooking-Z].LRDate,
		[Z-LRBooking-Z].ChargeWeight,
		[Z-LRBooking-Z].Parcel,
		[Z-SalesBillDetail-Z].BasicAmount,
		[Z-SalesBillDetail-Z].FreightAmount,
		[Z-SalesBillDetail-Z].Charge1,
		[Z-SalesBillDetail-Z].Charge2,
		[Z-SalesBillDetail-Z].Charge3,
		[Z-SalesBillDetail-Z].Charge4,
		[Z-SalesBillDetail-Z].Charge5,
		[Z-SalesBillDetail-Z].Charge6,
		[GSTRate].Rate As Rate
		FROM [Z-SalesBillDetail-Z]
		INNER JOIN [Z-LRBooking-Z] ON [Z-LRBooking-Z].[Id] = [Z-SalesBillDetail-Z].[LRBookingId]
		INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = [Z-LRBooking-Z].BranchId
		INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
		INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales
		INNER JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId
		WHERE [Z-SalesBillDetail-Z].SalesBillMasterId = @SalesBillMasterId
			AND [Z-LRBooking-Z].[BranchId] = @BranchId
			AND [Z-SalesBillDetail-Z].Deleted = 0
END
GO