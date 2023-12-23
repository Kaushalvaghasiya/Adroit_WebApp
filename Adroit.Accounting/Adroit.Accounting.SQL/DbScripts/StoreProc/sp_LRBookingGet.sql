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
			@ChalanDate VARCHAR(20)='';

	SELECT TOP 1 @BranchChalanNo = [Z-PurchaseBillMaster-Z].BillNumberBranch, 
			     @ChalanDate = [Z-PurchaseBillMaster-Z].BillDate, 
				 @VehilcleNo = Vehilcle.VRN
	FROM [Z-PurchaseBillDetail-Z] 
		 INNER JOIN [Z-PurchaseBillMaster-Z] ON [Z-PurchaseBillDetail-Z].PurchaseBillMasterId = [Z-PurchaseBillMaster-Z].Id AND [Z-PurchaseBillDetail-Z].LRBookingId = 2
		 INNER JOIN Vehilcle ON Vehilcle.Id = [Z-PurchaseBillMaster-Z].VehicleId AND Vehilcle.Active = 1
	ORDER BY [Z-PurchaseBillDetail-Z].Id DESC 

	SELECT [Z-LRBooking-Z].*
	,[TransportDesc].Title As Description
	,[TransportPacking].Title As Packing
	,ISNULL(@BranchChalanNo,'') AS BranchChalanNo
	,ISNULL(@ChalanDate,'') AS ChalanDate
	,ISNULL(@VehilcleNo,'') AS VehilcleNo
	FROM [Z-LRBooking-Z]
	LEFT JOIN [TransportDesc] on [TransportDesc].Id = [Z-LRBooking-Z].DescriptionId AND [TransportDesc].CustomerId = @CustomerId AND [TransportDesc].Deleted = 0 AND [TransportDesc].Active = 1
	LEFT JOIN [TransportPacking] on [TransportPacking].Id = [Z-LRBooking-Z].PackingId AND [TransportPacking].CustomerId = @CustomerId AND [TransportPacking].Deleted = 0 AND [TransportPacking].Active = 1
	WHERE [Z-LRBooking-Z].Id = @Id AND [Z-LRBooking-Z].BranchId = @BranchId

END
GO