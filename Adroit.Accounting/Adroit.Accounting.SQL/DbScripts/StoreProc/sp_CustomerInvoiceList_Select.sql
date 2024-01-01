CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerInvoiceList_Select]
(
	@BranchId INT,
	@FirmId INT,
	@LoginId INT
)
AS
BEGIN

	DECLARE @YearId int = dbo.fn_GetYearId(@LoginId);

	DECLARE @message VARCHAR(4000);
	IF @YearId IS NULL
	BEGIN
		SET @message = 'Year Not Found!';
		RAISERROR ('%s', 16, 1, @message);
	END
	
	SELECT Id
	,BillNumber
	,BillDate
	,BillAmount	
	,creditDays	
	,ChalanDateTo	
	,PaidAmount	
	,UnPaidAmount	
	FROM [Z-SalesBillMaster-Z]
	WHERE YearId = @YearId AND BranchId = @BranchId AND FirmId = @FirmId AND Deleted = 0

END
GO