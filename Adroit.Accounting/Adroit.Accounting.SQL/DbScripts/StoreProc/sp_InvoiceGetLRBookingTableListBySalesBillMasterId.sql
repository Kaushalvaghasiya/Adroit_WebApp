CREATE OR ALTER PROCEDURE [dbo].[sp_InvoiceGetLRBookingTableListBySalesBillMasterId]
  @LoginId int,
  @BranchId int,
  @SalesBillMasterId int
AS
BEGIN
	DECLARE @CustomerId int = dbo.fn_GetCustomerId(@LoginId);

	   SELECT  
			ROW_NUMBER() over (ORDER BY LRBooking.Id ASC) AS RowNum,
			Count(*) over () AS TotalCount, 
			SalesBillDetail.LRBookingId,
			LRBooking.LRNumber,
			LRBooking.LRDate,
			LRBooking.ChargeWeight,
			LRBooking.Parcel,

			SalesBillDetail.FreightAmount,
			SalesBillDetail.Charge1,
			SalesBillDetail.Charge2,
			SalesBillDetail.Charge3,
			SalesBillDetail.Charge4,
			SalesBillDetail.Charge5,
			SalesBillDetail.Charge6,
			SalesBillDetail.BasicAmount,

			SalesBillDetail.SGSTPercentage,
			SalesBillDetail.SGSTAmount,
			SalesBillDetail.CGSTPercentage,
			SalesBillDetail.CGSTAmount,
			SalesBillDetail.IGSTPercentage,
			SalesBillDetail.IGSTAmount,

			SalesBillDetail.GSTStateCessPercentage,
			SalesBillDetail.GSTStateCessAmount,
			SalesBillDetail.GSTCentralCessPercentage,
			SalesBillDetail.GSTCentralCessAmount,
			SalesBillDetail.GSTCentralCess,

			[GSTRate].Rate As GSTRate,
			[Product].GstCentralCess AS GstCentralCessRate,
			[Product].GstStateCess AS GstStateCessRate,
			CA3.GSTInvoiceTypeId
			
		FROM [Z-SalesBillDetail-Z] AS SalesBillDetail
		INNER JOIN [Z-LRBooking-Z] AS LRBooking ON SalesBillDetail.[LRBookingId] = LRBooking.Id
		INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = LRBooking.BranchId
		INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
		INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales
		INNER JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId
		LEFT JOIN [CustomerAccountBranchMapping] AS CAB3 on CAB3.Id = LRBooking.BillAccountBranchMappingId 
		LEFT JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId 

		WHERE SalesBillDetail.SalesBillMasterId = @SalesBillMasterId
			AND LRBooking.[BranchId] = @BranchId
END
GO