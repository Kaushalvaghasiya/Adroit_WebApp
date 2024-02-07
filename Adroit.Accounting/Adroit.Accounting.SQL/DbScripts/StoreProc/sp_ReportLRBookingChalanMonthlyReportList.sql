CREATE OR ALTER Procedure [dbo].[sp_ReportLRBookingChalanMonthlyReportList]
  @LoginId INT,
  @BranchIds varchar(max),
  @FirmId INT,
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
As
Begin
	DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirm(@FirmId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

    DECLARE @YearRange VARCHAR(MAX);
    SELECT @YearRange = dbo.[FinanceYear].Title from dbo.[FinanceYear] where [FinanceYear].Id = @YearId;

    DECLARE @AllMonths TABLE (MonthName VARCHAR(20), [Order] tinyint);
    
    INSERT INTO @AllMonths (MonthName, [Order]) 
		VALUES (FORMAT(CAST(SUBSTRING(@YearRange, 1, 4) + '-04-01' AS DATE), 'MMMM'), 1), 
			(FORMAT(CAST(SUBSTRING(@YearRange, 1, 4) + '-05-01' AS DATE), 'MMMM'), 2), 
			(FORMAT(CAST(SUBSTRING(@YearRange, 1, 4) + '-06-01' AS DATE), 'MMMM'), 3), 
			(FORMAT(CAST(SUBSTRING(@YearRange, 1, 4) + '-07-01' AS DATE), 'MMMM'), 4), 
			(FORMAT(CAST(SUBSTRING(@YearRange, 1, 4) + '-08-01' AS DATE), 'MMMM'), 5), 
			(FORMAT(CAST(SUBSTRING(@YearRange, 1, 4) + '-09-01' AS DATE), 'MMMM'), 6), 
			(FORMAT(CAST(SUBSTRING(@YearRange, 1, 4) + '-10-01' AS DATE), 'MMMM'), 7), 
			(FORMAT(CAST(SUBSTRING(@YearRange, 1, 4) + '-11-01' AS DATE), 'MMMM'), 8), 
			(FORMAT(CAST(SUBSTRING(@YearRange, 1, 4) + '-12-01' AS DATE), 'MMMM'), 9), 
			(FORMAT(CAST(SUBSTRING(@YearRange, 6, 4) + '-01-01' AS DATE), 'MMMM'), 10), 
			(FORMAT(CAST(SUBSTRING(@YearRange, 6, 4) + '-02-01' AS DATE), 'MMMM'), 11), 
			(FORMAT(CAST(SUBSTRING(@YearRange, 6, 4) + '-03-01' AS DATE), 'MMMM'), 12);

	SELECT distinct(M.[Order]), M.MonthName 
	INTO #MONTHS 
	FROM @AllMonths AS M
	LEFT JOIN CustomerFirmBranch on Id IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds));

	SELECT
        FORMAT(PBM.BillDate, 'MMMM') AS BillDate
		,SUM(ZBD.TotalLR) As TotalLR
		,SUM(Freight) AS Freight
		,SUM(IGSTTotal) AS IGSTTotal
		,SUM(CGSTTotal) AS CGSTTotal
		,SUM(SGSTTotal) AS SGSTTotal
		,SUM(OtherPlus) As OtherPlus
		,SUM(ZBD.InvoiceValue) As InvoiceValue
	INTO #DATA
    FROM [Z-PurchaseBillMaster-Z] As PBM
		INNER JOIN Vehilcle on Vehilcle.Id = PBM.VehicleId AND Vehilcle.CustomerId = @CustomerId
		INNER JOIN VehicleOwner on VehicleOwner.Id = Vehilcle.OwnerId AND VehicleOwner.CustomerId = @CustomerId
		INNER JOIN CustomerAccount on CustomerAccount.Id = VehicleOwner.AccountId AND CustomerAccount.CustomerId = @CustomerId
		LEFT JOIN(
			SELECT ZBD.PurchaseBillMasterId
			,COUNT(*) As TotalLR
			,SUM(LRB.ChargeWeight) As ChargeWeight
			,SUM(LRB.Freight) As Freight
            ,SUM(LRB.InvoiceValue) As InvoiceValue
			FROM [Z-PurchaseBillDetail-Z] As ZBD
			INNER JOIN [Z-LRBooking-Z] As LRB on LRB.Id = ZBD.LRBookingId			
			INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds))
			INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
			INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales 
			GROUP BY ZBD.PurchaseBillMasterId
		)ZBD on ZBD.PurchaseBillMasterId = PBM.Id
		WHERE PBM.YearId = @YearId 
		AND PBM.BranchId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds))
		AND PBM.FirmId = @FirmId 
	GROUP BY FORMAT(PBM.BillDate, 'MMMM')

	SELECT	
		M.*,
		M.MonthName as BillMonth
		,D.TotalLR
		,D.Freight
		,D.IGSTTotal
		,D.CGSTTotal
		,D.SGSTTotal
		,D.OtherPlus
		,D.InvoiceValue      
	FROM #MONTHS AS M
	LEFT JOIN #DATA AS D ON M.MonthName = D.BillDate

	drop table #MONTHS 
	drop table #DATA
End
GO
