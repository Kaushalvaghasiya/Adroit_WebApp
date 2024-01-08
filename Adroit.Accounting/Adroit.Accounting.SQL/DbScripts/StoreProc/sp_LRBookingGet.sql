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
			@BranchChalanNo VARCHAR(20)='', 
			@ChalanDate DATETIME= NULL,
			@BranchInvoiceNo VARCHAR(20)='', 
			@InvoiceDate DATETIME= NULL;

	SELECT TOP 1 @BranchChalanNo = CAST(BillNumberBranch AS VARCHAR) + ' | ' + BillNumberFirm, 
			     @ChalanDate = [Z-PurchaseBillMaster-Z].BillDate, 
				 @VehilcleNo = Vehilcle.VRN
	FROM [Z-PurchaseBillDetail-Z] 
		 INNER JOIN [Z-PurchaseBillMaster-Z] ON [Z-PurchaseBillDetail-Z].PurchaseBillMasterId = [Z-PurchaseBillMaster-Z].Id 
		 INNER JOIN Vehilcle ON Vehilcle.Id = [Z-PurchaseBillMaster-Z].VehicleId
	WHERE [Z-PurchaseBillDetail-Z].LRBookingId = @Id
	ORDER BY [Z-PurchaseBillDetail-Z].Id DESC 

	SELECT TOP 1 @BranchInvoiceNo = CAST(SerialNumberOfBranch AS VARCHAR) + ' | ' + CAST(BillNumber AS VARCHAR),  
			     @InvoiceDate = [Z-SalesBillMaster-Z].BillDate
	FROM [Z-SalesBillDetail-Z] 
		 INNER JOIN [Z-SalesBillMaster-Z] ON [Z-SalesBillDetail-Z].SalesBillMasterId = [Z-SalesBillMaster-Z].Id
	WHERE [Z-SalesBillDetail-Z].LRBookingId = @Id
	ORDER BY [Z-SalesBillDetail-Z].Id DESC 

	SELECT [Z-LRBooking-Z].*
	,[TransportDesc].Title As Description
	,[TransportPacking].Title As Packing
	,ISNULL(@BranchChalanNo,'') AS BranchChalanNo
	,ISNULL(@ChalanDate,'') AS ChalanDate
	,ISNULL(@VehilcleNo,'') AS VehilcleNo
	,ISNULL(@BranchInvoiceNo,'') AS BranchInvoiceNo
	,ISNULL(@InvoiceDate,'') AS InvoiceDate
	,City.Title AS CityFrom
	FROM [Z-LRBooking-Z]
	LEFT JOIN [TransportDesc] on [TransportDesc].Id = [Z-LRBooking-Z].DescriptionId AND [TransportDesc].CustomerId = @CustomerId AND [TransportDesc].Deleted = 0 AND [TransportDesc].Active = 1
	LEFT JOIN [TransportPacking] on [TransportPacking].Id = [Z-LRBooking-Z].PackingId AND [TransportPacking].CustomerId = @CustomerId AND [TransportPacking].Deleted = 0 AND [TransportPacking].Active = 1
	LEFT JOIN City ON [Z-LRBooking-Z].CityIdFrom = City.Id AND City.Active = 1 
	WHERE [Z-LRBooking-Z].Id = @Id AND [Z-LRBooking-Z].BranchId = @BranchId

END
GO