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
	ISNULL(@VehilcleNo,'') AS ChalanVehilcleNo,
	ISNULL(@BranchInvoiceNo,'') AS BranchInvoiceNo,
	@InvoiceDate AS InvoiceDate,
	TransportLRRateOn.Title As LRRateOnTitle,
	ToCity.[Title] AS CityTo,
	FromCity.[Title] AS CityFrom,
	[TransportLRPayType].[Title] AS LRPayType,
	CA1.Name As Consignor,
	CA1.Mobile As ConsignorMobile,
	CA2.Mobile As ConsigneeMobile,
	CA2.Name As Consignee,
	CA3.Name As BillPartyName,
	CASE WHEN [Z-PurchaseBillDetail-Z].LRBookingId IS NULL AND [Z-SalesBillDetail-Z].LRBookingId IS NULL THEN 0 ELSE 1 END AS IsLRBookingPurchased,
	[Vehilcle].VRN AS BookingVehilcleNo
	FROM [Z-LRBooking-Z]
	INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = [Z-LRBooking-Z].AccountBranchMappingId 
	INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId 
	
	INNER JOIN [CustomerAccountBranchMapping] AS CAB2 on CAB2.Id = [Z-LRBooking-Z].DeliveryAccountBranchMappingId 
	INNER JOIN [CustomerAccount] AS CA2 on CA2.Id = CAB2.AccountId 
	
	INNER JOIN [CustomerAccountBranchMapping] AS CAB3 on CAB3.Id = [Z-LRBooking-Z].BillAccountBranchMappingId 
	INNER JOIN [CustomerAccount] AS CA3 on CA3.Id = CAB3.AccountId 
	
	LEFT JOIN [TransportDesc] on [TransportDesc].Id = [Z-LRBooking-Z].DescriptionId AND [TransportDesc].CustomerId = @CustomerId 
	LEFT JOIN [TransportPacking] on [TransportPacking].Id = [Z-LRBooking-Z].PackingId AND [TransportPacking].CustomerId = @CustomerId 
	LEFT JOIN City ON [Z-LRBooking-Z].CityIdFrom = City.Id 
	LEFT JOIN [Z-PurchaseBillDetail-Z] ON [Z-PurchaseBillDetail-Z].LRBookingId = [Z-LRBooking-Z].id AND [Z-PurchaseBillDetail-Z].Deleted = 0
	LEFT JOIN [Z-SalesBillDetail-Z] ON [Z-SalesBillDetail-Z].LRBookingId = [Z-LRBooking-Z].id AND [Z-SalesBillDetail-Z].Deleted = 0
	LEFT JOIN TransportLRRateOn ON [Z-LRBooking-Z].LRRateOnId = TransportLRRateOn.Id
	LEFT JOIN [City] ToCity ON [Z-LRBooking-Z].CityIdTo = ToCity.[Id] 
	LEFT JOIN [City] FromCity ON [Z-LRBooking-Z].CityIdFrom = FromCity.[Id] 
	LEFT JOIN [TransportLRPayType] ON [Z-LRBooking-Z].[LRPayTypeId] = [TransportLRPayType].[Id] 
	LEFT JOIN [Vehilcle] ON [Z-LRBooking-Z].VehicleId = [Vehilcle] .Id
	WHERE [Z-LRBooking-Z].Id = @Id AND [Z-LRBooking-Z].BranchId = @BranchId

END
GO