CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchTransportSettingGet]
(
	@LoginId INT,
	@BranchId INT
)
AS
BEGIN	
	IF (@LoginId > 0)
	BEGIN
		SELECT @BranchId = DBO.fn_GetLoggedInBranchId(@LoginId)
	END
	SELECT 
		[CustomerFirmBranchTransportSetting].*,
		dbo.fn_GetBookName(PurcahseBookBranchMappingId) AS PurchaseBookName,
		dbo.fn_GetBookName(BookingSalesBookBranchMappingId) AS BookingSalesBookName,
		dbo.fn_GetBookName(DeliverySalesBookBranchMappingId) AS DeliverySalesBookName,
		dbo.fn_GetAccountName(ToPayAccountBranchMappingId) AS ToPayAccountName,
		dbo.fn_GetAccountName(CrossingAmountAccountBranchMappingId) AS CrossingAmountAccountName,
		dbo.fn_GetAccountName(CrossingCommissionAccountBranchMappingId) AS CrossingCommissionAccountName,
		dbo.fn_GetAccountName(CrossingHamaliAccountBranchMappingId) AS CrossingHamaliAccountName,
		dbo.fn_GetAccountName(CrossingDeliveryChargeAccountBranchMappingId) AS CrossingDeliveryChargeAccountName,
		dbo.fn_GetAccountName(SalesAccountBranchMappingId) AS SalesAccountName
	FROM  [dbo].[CustomerFirmBranchTransportSetting]
	WHERE [BranchId] = @BranchId
END
GO