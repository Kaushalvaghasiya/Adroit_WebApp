CREATE OR ALTER PROCEDURE [dbo].[sp_DeliveryInvoiceCustomerAccounListWithGroup_Select]
(
	@FirmId INT,
	@BranchId INT,
	@PayTypeId INT,
	@LoginId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	SELECT DISTINCT [dbo].[fn_GetAccountMappingIdForDifferentBranch](CustomerAccountBranchMapping.Id, @BranchId) As [Value],
		CASE ISNULL(CustomerAccount.[PrintName], '') WHEN '' THEN CustomerAccount.[Name] ELSE CustomerAccount.[PrintName] 
		END + ' (' + [CustomerAccountGroup].Title + ' - ' + [CustomerAccountGroup].Code + ')' As Text 
	From CustomerAccount
	INNER JOIN CustomerAccountBranchMapping on CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
	INNER JOIN [CustomerAccountGroup] on CustomerAccount.AccountGroupId = [CustomerAccountGroup].Id 
	LEFT JOIN [Z-LRBooking-Z] AS LRBooking on CustomerAccountBranchMapping.Id = LRBooking.BillAccountBranchMappingId 
	WHERE LRBooking.Id IN (SELECT PurchaseBillDetail.LRBookingId 
					FROM [Z-PurchaseBillMaster-Z] AS PurchaseBillMaster 
					INNER JOIN [Z-PurchaseBillDetail-Z] as PurchaseBillDetail ON PurchaseBillMaster.Id = PurchaseBillDetail.PurchaseBillMasterId
					INNER JOIN [Z-ChalanReceive-Z] AS ChalanReceive on PurchaseBillMaster.Id = ChalanReceive.PurchaseBillMasterId 
					WHERE PurchaseBillMaster.[BranchIdTo] = @BranchId
					AND PurchaseBillMaster.YearId = @YearId
					AND PurchaseBillMaster.Deleted = 0
					AND PurchaseBillDetail.Deleted = 0
					AND ChalanReceive.Deleted = 0) 
		AND (@PayTypeId = '0' OR LRBooking.LRPayTypeId = @PayTypeId)
		AND CustomerAccount.CustomerId = @CustomerId 
		--AND CustomerAccountBranchMapping.BranchId = @BranchId 
		AND LRBooking.ID NOT IN (SELECT DISTINCT ISNULL([Z-SalesBillDetail-Z].LRBookingId, 0) 
						FROM [Z-SalesBillMaster-Z] 
						INNER JOIN [Z-SalesBillDetail-Z] ON [Z-SalesBillMaster-Z].Id = [Z-SalesBillDetail-Z].SalesBillMasterId
						WHERE [Z-SalesBillMaster-Z].[BranchId] = @BranchId 
						AND YearId = @YearId 
						AND [Z-SalesBillDetail-Z].Deleted = 0) 
		AND LRBooking.Deleted = 0 

	UNION

	SELECT DISTINCT CustomerAccountBranchMapping.Id As [Value],
		CASE ISNULL(CustomerAccount.[PrintName], '') WHEN '' THEN CustomerAccount.[Name] ELSE CustomerAccount.[PrintName] 
		END + ' (' + [CustomerAccountGroup].Title + ' - ' + [CustomerAccountGroup].Code + ')' As Text 
	From CustomerAccount
	INNER JOIN CustomerAccountBranchMapping on CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
	INNER JOIN [CustomerAccountGroup] on CustomerAccount.AccountGroupId = [CustomerAccountGroup].Id 
	LEFT JOIN [Z-ChalanReceiveAgencyDetail-Z] AS ChalanReceiveAgencyDetail ON CustomerAccountBranchMapping.Id = ChalanReceiveAgencyDetail.BillAccountBranchMappingId 
	LEFT JOIN [Z-ChalanReceiveAgencyMaster-Z] AS ChalanReceiveAgencyMaster ON ChalanReceiveAgencyDetail.ChalanReceiveAgencyMasterId = ChalanReceiveAgencyMaster.Id
	WHERE CustomerAccount.CustomerId = @CustomerId 
		AND CustomerAccountBranchMapping.BranchId = @BranchId 
		AND ChalanReceiveAgencyDetail.Id NOT IN (SELECT DISTINCT ISNULL([Z-SalesBillDetail-Z].AgencyLRBookingId, 0) FROM [Z-SalesBillDetail-Z] WHERE [Z-SalesBillDetail-Z].Deleted = 0) 
		AND ChalanReceiveAgencyDetail.Deleted = 0 
		and ChalanReceiveAgencyMaster.Deleted = 0 

	Order by CASE ISNULL(CustomerAccount.[PrintName], '') WHEN '' THEN CustomerAccount.[Name] ELSE CustomerAccount.[PrintName] 
		END + ' (' + [CustomerAccountGroup].Title + ' - ' + [CustomerAccountGroup].Code + ')' 
END
GO