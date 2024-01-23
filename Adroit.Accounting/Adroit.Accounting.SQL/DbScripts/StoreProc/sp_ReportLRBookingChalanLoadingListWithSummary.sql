CREATE OR ALTER Procedure [dbo].[sp_ReportLRBookingChalanLoadingListWithSummary]
   @LoginId INT,
   @FirmId INT,
   @SelectedView int,
   @BranchIds NVARCHAR(MAX),
   @DateFrom DATETIME,
   @DateTo DATETIME,
   @CityFromIds NVARCHAR(MAX),
   @CityToIds NVARCHAR(MAX),
   @ChalanFrom INT,
   @ChalanTo INT,
   @VehicleNumber NVARCHAR(MAX),
   @VehicleOwner NVARCHAR(MAX),
   @Agent NVARCHAR(MAX),
   @Search VARCHAR(100) = '',
   @PageStart INT = 0,
   @PageSize INT = 10,
   @SortColumn INT = 0,
   @SortOrder NVARCHAR(10) = 'ASC',
   @DateWise INT,
   @TruckWise INT
As
Begin
	Set Nocount on;
	DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirm(@FirmId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	WITH CTE AS (
        SELECT ROW_NUMBER() over 
		(ORDER BY
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN CASE WHEN @SelectedView = @DateWise THEN CAST(PBM.BillDate AS VARCHAR(100)) WHEN @SelectedView = @TruckWise THEN Vehilcle.VRN END END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN CASE WHEN @SelectedView = @DateWise THEN CAST(PBM.BillDate AS VARCHAR(100)) WHEN @SelectedView = @TruckWise THEN Vehilcle.VRN END END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN COUNT(*) END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN COUNT(*) END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN SUM(ZBD.TotalLR) END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN SUM(ZBD.TotalLR) END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN SUM(ZBD.ToPayAmount) END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN SUM(ZBD.ToPayAmount) END DESC,
            CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN SUM(ZBD.PaidAmount) END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN SUM(ZBD.PaidAmount) END DESC,
            CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN SUM(ZBD.TBBAmount) END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN SUM(ZBD.TBBAmount) END DESC,
            CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN SUM(Freight) END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN SUM(Freight) END DESC,
            --CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' THEN SUM(Rate) END ASC,  
			--CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' THEN SUM(Rate) END DESC,
			CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' THEN SUM(ZBD.InvoiceValue) END ASC,  
			CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' THEN SUM(ZBD.InvoiceValue) END DESC,
			CASE WHEN @SortColumn = 8 AND @SortOrder ='ASC' THEN MAX([ZBD].BranchName) END ASC,  
			CASE WHEN @SortColumn = 8 AND @SortOrder ='DESC' THEN MAX([ZBD].BranchName) END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount 
		,CASE WHEN @SelectedView = @DateWise THEN CAST(PBM.BillDate AS VARCHAR(100)) WHEN @SelectedView = @TruckWise THEN Vehilcle.VRN END As GroupingColumn
		,COUNT(*) As LRNumber
		,SUM(Parcel) As Parcel
		,SUM(ZBD.TotalLR) As TotalLR
        ,SUM(ZBD.ToPayAmount) As ToPayAmount
        ,SUM(ZBD.PaidAmount) As PaidAmount
        ,SUM(ZBD.TBBAmount) As TBBAmount
        ,SUM(Freight) AS Freight
		,SUM([ZBD].Rate) As Rate
		,SUM(ZBD.InvoiceValue) As InvoiceValue
		,MAX([ZBD].BranchName) As BranchName
		FROM [Z-PurchaseBillMaster-Z] As PBM
		INNER JOIN Vehilcle on Vehilcle.Id = PBM.VehicleId AND Vehilcle.CustomerId = @CustomerId
		INNER JOIN VehicleOwner on VehicleOwner.Id = Vehilcle.OwnerId AND VehicleOwner.CustomerId = @CustomerId
		LEFT JOIN(
			SELECT ZBD.PurchaseBillMasterId
			,COUNT(*) As TotalLR
			,SUM(LRB.Parcel) As Parcel
			,SUM(LRB.ChargeWeight) As ChargeWeight
			,SUM(CASE WHEN TLRType1.Title = 'To Pay' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) AS ToPayAmount
			,SUM(CASE WHEN TLRType2.Title = 'Paid' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) AS PaidAmount
			,SUM(CASE WHEN TLRType3.Title = 'TBB' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) AS TBBAmount
			,MAX([GSTRate].Rate) As Rate
			,MAX([CustomerFirmBranch].Title) As BranchName
			,SUM(LRB.Freight) As Freight
            ,SUM(LRB.InvoiceValue) As InvoiceValue
			FROM [Z-PurchaseBillDetail-Z] As ZBD
			INNER JOIN [Z-LRBooking-Z] As LRB on LRB.Id = ZBD.LRBookingId
			LEFT JOIN TransportLRPayType AS TLRType1 ON LRB.LRPayTypeId = TLRType1.Id AND TLRType1.Title = 'To Pay'
			LEFT JOIN TransportLRPayType AS TLRType2 ON LRB.LRPayTypeId = TLRType2.Id AND TLRType2.Title = 'Paid'
			LEFT JOIN TransportLRPayType AS TLRType3 ON LRB.LRPayTypeId = TLRType3.Id AND TLRType3.Title = 'TBB'
			INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds))
			INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
			INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales 
			INNER JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId 
			GROUP BY ZBD.PurchaseBillMasterId
		)ZBD on ZBD.PurchaseBillMasterId = PBM.Id
		WHERE PBM.YearId = @YearId 
		AND PBM.BranchId IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds))
		AND PBM.FirmId = @FirmId 
		AND (@DateFrom IS NULL OR CAST(PBM.BillDate AS DATE) >= @DateFrom)
		AND (@DateTo IS NULL OR CAST(PBM.BillDate AS DATE) <= @DateTo)
		AND (@CityFromIds = '0' OR PBM.CityIdFrom IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@CityFromIds)))
		AND (@CityToIds = '0' OR PBM.CityIdTo IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@CityToIds)))
		--AND (@ChalanFrom = '0' OR PBM.Id >= @ChalanFrom)
		--AND (@ChalanTo = '0' OR PBM.Id <= @ChalanTo)
		AND (ISNULL(@VehicleNumber,'') ='' OR Vehilcle.VRN = @VehicleNumber)
		AND (ISNULL(@VehicleOwner,'') ='' OR VehicleOwner.Name = @VehicleOwner)
        AND (ISNULL(@VehicleOwner,'') ='' OR VehicleOwner.Name = @VehicleOwner)
		--AND (ISNULL(@Agent,'') ='' OR VehicleOwner.Name = @Agent)

        GROUP BY CASE WHEN @SelectedView = @DateWise THEN CAST(PBM.BillDate AS VARCHAR(100)) WHEN @SelectedView = @TruckWise THEN Vehilcle.VRN END
    )

    SELECT * FROM CTE
    WHERE
        (Coalesce(@Search, '') = '' OR GroupingColumn LIKE '%' + @Search + '%'
                                --    OR Parcel LIKE '%' + @Search + '%'
                                --    OR ChargeWeight LIKE '%' + @Search + '%'
                                   OR Rate LIKE '%' + @Search + '%'
                                   OR InvoiceValue LIKE '%' + @Search + '%'
                                   OR BranchName LIKE '%' + @Search + '%')
	AND @PageSize = -1 OR (RowNum > @PageStart AND RowNum < (@PageStart + (@PageSize + 1)))
    ORDER BY RowNum;
End
Set Nocount off;
GO