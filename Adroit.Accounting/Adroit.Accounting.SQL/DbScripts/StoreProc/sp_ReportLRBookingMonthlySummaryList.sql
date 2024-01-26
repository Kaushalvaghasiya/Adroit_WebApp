CREATE OR ALTER Procedure [dbo].[sp_ReportLRBookingMonthlySummaryList]
  @LoginId INT,
  @BranchIds varchar(max),
  @LRStatusId INT,
  @FirmId INT,
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
As
Begin
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

	SELECT CustomerFirmBranch.Title AS BranchName, M.* 
	INTO #MONTHS 
	FROM @AllMonths AS M
	CROSS JOIN CustomerFirmBranch WHERE Id IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds));

	SELECT
        FORMAT(LRB.LRDate, 'MMMM') AS LRDate
        , COUNT(*) AS TotalLR
        , SUM(LRB.Parcel) AS Parcel
        , SUM(LRB.ChargeWeight) AS ChargeWeight
        , SUM(CASE WHEN TLRType1.Title = 'To Pay' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) AS ToPayAmount
        , SUM(CASE WHEN TLRType2.Title = 'Paid' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) AS PaidAmount
        , SUM(CASE WHEN TLRType3.Title = 'TBB' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) AS TBBAmount            
        , [CustomerFirmBranch].Title AS BranchName
        ,LRB.Deleted
	INTO #DATA
    FROM [Z-LRBooking-Z] AS LRB
    INNER JOIN [CustomerFirmBranch] ON [CustomerFirmBranch].Id = LRB.BranchId
    INNER JOIN [CustomerFirmTransportSetting] ON [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
    INNER JOIN [Product] ON [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales 
    LEFT JOIN TransportLRPayType AS TLRType1 ON LRB.LRPayTypeId = TLRType1.Id AND TLRType1.Title = 'To Pay'
    LEFT JOIN TransportLRPayType AS TLRType2 ON LRB.LRPayTypeId = TLRType2.Id AND TLRType2.Title = 'Paid'
    LEFT JOIN TransportLRPayType AS TLRType3 ON LRB.LRPayTypeId = TLRType3.Id AND TLRType3.Title = 'TBB'
    WHERE LRB.BranchId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds))
    AND LRB.YearId = @YearId
    AND (
			@LRStatusId = '0'
			OR (@LRStatusId = '1' AND LRB.Deleted = 0)
			OR (@LRStatusId = '2' AND LRB.Deleted = 1)
		)
	GROUP BY FORMAT(LRB.LRDate, 'MMMM'), [CustomerFirmBranch].Title, LRB.Deleted

	SELECT	
		M.*,
		M.MonthName as LRMonth,
		D.TotalLR,
        D.Parcel,
        D.ChargeWeight,
        D.ToPayAmount,
        D.PaidAmount,
        D.TBBAmount,          
        D.Deleted
	FROM #MONTHS AS M
	LEFT JOIN #DATA AS D ON M.BranchName = D.BranchName AND M.MonthName = D.LRDate

	drop table #MONTHS 
	drop table #DATA
End
GO
