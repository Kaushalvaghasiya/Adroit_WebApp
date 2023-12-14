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
		[Z-LRBooking-Z].Id As Id,
		[Z-LRBooking-Z].LRNumber As LRNumber,
		[Z-LRBooking-Z].LRDate As LRDate,
		[Z-LRBooking-Z].ChargeWeight As ChargeWeight,
		[Z-LRBooking-Z].parcel As Parcel,
		[Z-SalesBillDetail-Z].BasicAmount As TaxableAmount,
		[Z-SalesBillDetail-Z].FreightAmount As Freight,
		[Z-SalesBillDetail-Z].Charge1 As Charges1,
		[Z-SalesBillDetail-Z].Charge2 As Charges2,
		[Z-SalesBillDetail-Z].Charge3 As Charges3,
		[Z-SalesBillDetail-Z].Charge4 As Charges4,
		[Z-SalesBillDetail-Z].Charge5 As Charges5,
		[Z-SalesBillDetail-Z].Charge6 As Charges6,
		[GSTRate].Rate As Rate
		FROM [Z-SalesBillDetail-Z]
			 INNER JOIN [Z-LRBooking-Z] ON [Z-LRBooking-Z].[Id] = [Z-SalesBillDetail-Z].[LRBookingId] AND [Z-LRBooking-Z].[BranchId] = @BranchId
			 INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = [Z-LRBooking-Z].BranchId AND [CustomerFirmBranch].Deleted = 0 AND [CustomerFirmBranch].Active = 1 
			 INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
			 INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales AND [Product].Deleted = 0 AND [Product].Active = 1
			 INNER JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId AND [GSTRate].Deleted = 0 AND [GSTRate].Active = 1
		WHERE [Z-LRBooking-Z].[BranchId] = @BranchId
			  AND [Z-LRBooking-Z].Deleted = 0
			  AND [Z-SalesBillDetail-Z].SalesBillMasterId = @SalesBillMasterId
			  AND [Z-SalesBillDetail-Z].Deleted = 0
END
GO