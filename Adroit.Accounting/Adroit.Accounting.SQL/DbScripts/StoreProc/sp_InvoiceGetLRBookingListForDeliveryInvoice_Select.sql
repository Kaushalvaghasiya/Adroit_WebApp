CREATE OR ALTER PROCEDURE [dbo].[sp_InvoiceGetLRBookingListForDeliveryInvoice_Select]
(
	@LoginId INT,
	@FirmId INT,
	@BranchId AS INT
)
AS
BEGIN
	DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirm(@FirmId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	SELECT 
		CAST(LRNumber AS VARCHAR) AS [Text], 
		Id As [Value]
	FROM [Z-LRBooking-Z]
	WHERE Id IN (SELECT ISNULL(PurchaseBillDetail.LRBookingId, 0)
					FROM [Z-PurchaseBillMaster-Z] AS PurchaseBillMaster 
					INNER JOIN [Z-PurchaseBillDetail-Z] as PurchaseBillDetail ON PurchaseBillMaster.Id = PurchaseBillDetail.PurchaseBillMasterId
					INNER JOIN [Z-ChalanReceive-Z] AS ChalanReceive on PurchaseBillMaster.Id = ChalanReceive.PurchaseBillMasterId 
					WHERE PurchaseBillMaster.[BranchIdTo] = @BranchId
					AND PurchaseBillMaster.YearId = @YearId
					AND PurchaseBillMaster.Deleted = 0
					AND PurchaseBillDetail.Deleted = 0
					AND ChalanReceive.Deleted = 0)
		AND Id NOT IN (SELECT DISTINCT ISNULL([Z-SalesBillDetail-Z].LRBookingId, 0) 
						FROM [Z-SalesBillMaster-Z] 
						INNER JOIN [Z-SalesBillDetail-Z] ON [Z-SalesBillMaster-Z].Id = [Z-SalesBillDetail-Z].SalesBillMasterId
						WHERE [Z-SalesBillMaster-Z].[BranchId] = @BranchId 
						AND YearId = @YearId 
						AND ([Z-SalesBillMaster-Z].EntryTypeId = 24 OR [Z-SalesBillMaster-Z].EntryTypeId = 25)
						AND [Z-SalesBillDetail-Z].Deleted = 0) 
		AND Deleted = 0 

	UNION ALL

	SELECT 
		(LRNumber + ' | ' + ISNULL(City.Title, '') + ' | ' + dbo.fn_GetAccountName(AgencyMaster.SenderBranchAccountMappingid)) AS [Text] ,
		AgencyDetail.Id As [Value]
	FROM [Z-ChalanReceiveAgencyMaster-Z] AS AgencyMaster 
	INNER JOIN [Z-ChalanReceiveAgencyDetail-Z] AS AgencyDetail ON AgencyMaster.Id = AgencyDetail.ChalanReceiveAgencyMasterId
	LEFT JOIN City ON AgencyMaster.CityIdFrom = City.Id
	WHERE AgencyMaster.[BranchId] = @BranchId
		AND AgencyDetail.Id NOT IN (SELECT DISTINCT ISNULL([Z-SalesBillDetail-Z].AgencyLRBookingId, 0) 
									FROM [Z-SalesBillMaster-Z]
									INNER JOIN [Z-SalesBillDetail-Z] ON [Z-SalesBillMaster-Z].Id = [Z-SalesBillDetail-Z].SalesBillMasterId
									WHERE ([Z-SalesBillMaster-Z].EntryTypeId = 24 OR [Z-SalesBillMaster-Z].EntryTypeId = 25)
									AND [Z-SalesBillDetail-Z].Deleted = 0) 
		AND AgencyMaster.Deleted = 0 
		AND AgencyDetail.Deleted = 0 

	ORDER BY [Text]
END
GO