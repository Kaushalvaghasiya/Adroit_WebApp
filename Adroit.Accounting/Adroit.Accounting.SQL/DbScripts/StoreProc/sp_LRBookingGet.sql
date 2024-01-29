CREATE OR ALTER PROCEDURE [dbo].[sp_LRBookingGet]
(
	@Id INT,
	@LoginId INT,
	@FirmId INT,
	@BranchId INT
)
AS
BEGIN
	DECLARE @CustomerId INT = dbo.fn_GetCustomerId(@LoginId), 
		    @VehilcleNo VARCHAR(25)='', 
			@BranchChalanNo VARCHAR(250)='', 
			@ChalanDate DATETIME= NULL,
			@BranchInvoiceNo VARCHAR(250)='', 
			@InvoiceDate DATETIME= NULL;

	SELECT TOP 1 @BranchChalanNo = CAST(BillNumberBranch AS VARCHAR) + ' (' + CustomerFirmBranch.Title + ') ' + ' | ' + BillNumberFirm + ' (' + CustomerFirm.Title + ')', 
			     @ChalanDate = [Z-PurchaseBillMaster-Z].BillDate, 
				 @VehilcleNo = Vehilcle.VRN
	FROM [Z-PurchaseBillDetail-Z] 
		 INNER JOIN [Z-PurchaseBillMaster-Z] ON [Z-PurchaseBillDetail-Z].PurchaseBillMasterId = [Z-PurchaseBillMaster-Z].Id 
		 INNER JOIN Vehilcle ON Vehilcle.Id = [Z-PurchaseBillMaster-Z].VehicleId
		 INNER JOIN CustomerFirm on [Z-PurchaseBillMaster-Z].FirmId = CustomerFirm.Id
		 INNER JOIN CustomerFirmBranch ON [Z-PurchaseBillMaster-Z].BranchId = CustomerFirmBranch .Id
	WHERE [Z-PurchaseBillDetail-Z].LRBookingId = @Id
	ORDER BY [Z-PurchaseBillDetail-Z].Id DESC 

	SELECT TOP 1 @BranchInvoiceNo = CAST(SerialNumberOfBranch AS VARCHAR) + ' (' + CustomerFirmBranch.Title + ') ' + ' | ' + CAST(BillNumber AS VARCHAR) + ' (' + CustomerFirm.Title + ')', 
			     @InvoiceDate = [Z-SalesBillMaster-Z].BillDate
	FROM [Z-SalesBillDetail-Z] 
		 INNER JOIN [Z-SalesBillMaster-Z] ON [Z-SalesBillDetail-Z].SalesBillMasterId = [Z-SalesBillMaster-Z].Id
		 INNER JOIN CustomerFirm on [Z-SalesBillMaster-Z].FirmId = CustomerFirm.Id
		 INNER JOIN CustomerFirmBranch ON [Z-SalesBillMaster-Z].BranchId = CustomerFirmBranch .Id
	WHERE [Z-SalesBillDetail-Z].LRBookingId = @Id
	ORDER BY [Z-SalesBillDetail-Z].Id DESC 

	SELECT [Z-LRBooking-Z].*,
	[TransportDesc].Title As Description,
	[TransportPacking].Title As Packing,
	ISNULL(@BranchChalanNo,'') AS BranchChalanNo,
	@ChalanDate AS ChalanDate,
	ISNULL(@VehilcleNo,'') AS VehilcleNo,
	ISNULL(@BranchInvoiceNo,'') AS BranchInvoiceNo,
	@InvoiceDate AS InvoiceDate,
	City.Title AS CityFrom,
	TransportLRRateOn.Title As LRRateOnTitle,
	CASE WHEN [Z-PurchaseBillDetail-Z].LRBookingId IS NULL AND [Z-SalesBillDetail-Z].LRBookingId IS NULL THEN 0 ELSE 1 END AS IsLRBookingPurchased
	FROM [Z-LRBooking-Z]
	LEFT JOIN [TransportDesc] on [TransportDesc].Id = [Z-LRBooking-Z].DescriptionId AND [TransportDesc].CustomerId = @CustomerId AND [TransportDesc].Deleted = 0 AND [TransportDesc].Active = 1
	LEFT JOIN [TransportPacking] on [TransportPacking].Id = [Z-LRBooking-Z].PackingId AND [TransportPacking].CustomerId = @CustomerId AND [TransportPacking].Deleted = 0 AND [TransportPacking].Active = 1
	LEFT JOIN City ON [Z-LRBooking-Z].CityIdFrom = City.Id AND City.Active = 1 
	LEFT JOIN [Z-PurchaseBillDetail-Z] ON [Z-PurchaseBillDetail-Z].LRBookingId = [Z-LRBooking-Z].id AND [Z-PurchaseBillDetail-Z].Deleted = 0
	LEFT JOIN [Z-SalesBillDetail-Z] ON [Z-SalesBillDetail-Z].LRBookingId = [Z-LRBooking-Z].id AND [Z-SalesBillDetail-Z].Deleted = 0
	LEFT JOIN TransportLRRateOn ON [Z-LRBooking-Z].LRRateOnId = TransportLRRateOn.Id
	WHERE [Z-LRBooking-Z].Id = @Id AND [Z-LRBooking-Z].BranchId = @BranchId

END
GO