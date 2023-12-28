CREATE OR ALTER Procedure [dbo].[sp_ReportLRBookingChalanLoadingList]
  @LoginId INT,
  @BranchId INT,
  @FirmId INT,
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
As
Set Nocount on;
Begin
	DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirm(@FirmId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	SELECT * FROM
	(   
		SELECT ROW_NUMBER() over 
		(ORDER BY
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN PBM.BillDate END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN PBM.BillDate END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN PBM.Id END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN PBM.Id END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN Vehilcle.VRN END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN Vehilcle.VRN END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN ZBD.TotalLR END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN ZBD.TotalLR END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN ZBD.Parcel END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN ZBD.Parcel END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN ZBD.ChargeWeight END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN ZBD.ChargeWeight END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN ZBD.ToPayAmount END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN ZBD.ToPayAmount END DESC,
			CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' THEN ZBD.PaidAmount END ASC,  
			CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' THEN ZBD.PaidAmount END DESC,
			CASE WHEN @SortColumn = 8 AND @SortOrder ='ASC' THEN ZBD.TBBAmount END ASC,  
			CASE WHEN @SortColumn = 8 AND @SortOrder ='DESC' THEN ZBD.TBBAmount END DESC,
			CASE WHEN @SortColumn = 9 AND @SortOrder ='ASC' THEN PBM.TaxableAmount END ASC,  
			CASE WHEN @SortColumn = 9 AND @SortOrder ='DESC' THEN PBM.TaxableAmount END DESC,
			CASE WHEN @SortColumn = 10 AND @SortOrder ='ASC' THEN PBM.TDSPercent END ASC,  
			CASE WHEN @SortColumn = 10 AND @SortOrder ='DESC' THEN PBM.TDSPercent END DESC,
			CASE WHEN @SortColumn = 11 AND @SortOrder ='ASC' THEN PBM.TDSAmount END ASC,  
			CASE WHEN @SortColumn = 11 AND @SortOrder ='DESC' THEN PBM.TDSAmount END DESC,
			CASE WHEN @SortColumn = 12 AND @SortOrder ='ASC' THEN ZBD.Rate END ASC,  
			CASE WHEN @SortColumn = 12 AND @SortOrder ='DESC' THEN ZBD.Rate END DESC,
			CASE WHEN @SortColumn = 13 AND @SortOrder ='ASC' THEN ZBD.GSTAmount END ASC,  
			CASE WHEN @SortColumn = 13 AND @SortOrder ='DESC' THEN ZBD.GSTAmount END DESC,
			CASE WHEN @SortColumn = 14 AND @SortOrder ='ASC' THEN PBM.AdvanceCash END ASC,  
			CASE WHEN @SortColumn = 14 AND @SortOrder ='DESC' THEN PBM.AdvanceCash END DESC,
			CASE WHEN @SortColumn = 15 AND @SortOrder ='ASC' THEN PBM.AdvanceNeft END ASC,  
			CASE WHEN @SortColumn = 15 AND @SortOrder ='DESC' THEN PBM.AdvanceNeft END DESC,
			CASE WHEN @SortColumn = 16 AND @SortOrder ='ASC' THEN PBM.ReceiveCash END ASC,  
			CASE WHEN @SortColumn = 16 AND @SortOrder ='DESC' THEN PBM.ReceiveCash END DESC,
			CASE WHEN @SortColumn = 17 AND @SortOrder ='ASC' THEN PBM.OtherPlus END ASC,  
			CASE WHEN @SortColumn = 17 AND @SortOrder ='DESC' THEN PBM.OtherPlus END DESC,
			CASE WHEN @SortColumn = 18 AND @SortOrder ='ASC' THEN ZBD.Freight END ASC,  
			CASE WHEN @SortColumn = 18 AND @SortOrder ='DESC' THEN ZBD.Freight END DESC,
			CASE WHEN @SortColumn = 19 AND @SortOrder ='ASC' THEN ZBD.BranchName END ASC,  
			CASE WHEN @SortColumn = 19 AND @SortOrder ='DESC' THEN ZBD.BranchName END DESC
		) AS RowNum
		,Count(*) over () AS TotalCount 
		,PBM.BillDate
		,PBM.Id
		,Vehilcle.VRN As VehicleVRN
		,ZBD.TotalLR
		,ZBD.Parcel
		,ZBD.ChargeWeight
		,ZBD.ToPayAmount
		,ZBD.PaidAmount
		,ZBD.TBBAmount
		,PBM.TaxableAmount
		,PBM.TDSPercent
		,PBM.TDSAmount
		,ZBD.Rate As Rate
		,ZBD.GSTAmount As GSTAmount
		,PBM.AdvanceCash
		,PBM.AdvanceNeft
		,PBM.ReceiveCash
		,PBM.OtherPlus
		,ZBD.Freight
		,ZBD.BranchName
		FROM [Z-PurchaseBillMaster-Z] As PBM
		INNER JOIN Vehilcle on Vehilcle.Id = PBM.VehicleId AND Vehilcle.CustomerId = @CustomerId
		LEFT JOIN(
			SELECT ZBD.PurchaseBillMasterId
			,COUNT(*) As TotalLR
			,SUM(LRB.Parcel) As Parcel
			,SUM(LRB.ChargeWeight) As ChargeWeight
			,SUM(CASE WHEN TLRType1.Title = 'To Pay' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) AS ToPayAmount
			,SUM(CASE WHEN TLRType2.Title = 'Paid' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) AS PaidAmount
			,SUM(CASE WHEN TLRType3.Title = 'TBB' THEN ISNULL(LRB.[Freight], 0) + ISNULL(LRB.[Charges1], 0) + ISNULL(LRB.[Charges2], 0) + ISNULL(LRB.[Charges3], 0) + ISNULL(LRB.[Charges4], 0) + ISNULL(LRB.[Charges5], 0) + ISNULL(LRB.[Charges6], 0) ELSE 0 END) AS TBBAmount
			,MAX([GSTRate].Rate) As Rate
			,MAX([GSTRate].Rate) As GSTAmount
			,MAX([CustomerFirmBranch].Title) As BranchName
			,SUM(LRB.Freight) As Freight
			FROM [Z-PurchaseBillDetail-Z] As ZBD
			INNER JOIN [Z-LRBooking-Z] As LRB on LRB.Id = ZBD.LRBookingId
			LEFT JOIN TransportLRPayType AS TLRType1 ON LRB.LRPayTypeId = TLRType1.Id AND TLRType1.Title = 'To Pay'
			LEFT JOIN TransportLRPayType AS TLRType2 ON LRB.LRPayTypeId = TLRType2.Id AND TLRType2.Title = 'Paid'
			LEFT JOIN TransportLRPayType AS TLRType3 ON LRB.LRPayTypeId = TLRType3.Id AND TLRType3.Title = 'TBB'
			INNER JOIN [CustomerFirmBranch] on [CustomerFirmBranch].Id = LRB.BranchId
			INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
			INNER JOIN [Product] on [Product].Id = [CustomerFirmTransportSetting].ProductIdForSales 
			INNER JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId 
			GROUP BY ZBD.PurchaseBillMasterId
		)ZBD on ZBD.PurchaseBillMasterId = PBM.Id
		WHERE PBM.YearId = @YearId AND PBM.BranchId = @BranchId AND PBM.FirmId = @FirmId 
		AND (Coalesce(@Search,'') = '' OR PBM.BillDate like '%'+ @Search + '%'
									   OR PBM.Id like '%'+ @Search + '%'
									   OR Vehilcle.VRN like '%'+ @Search + '%'
									   OR ZBD.TotalLR like '%'+ @Search + '%'
									   OR ZBD.Parcel like '%'+ @Search + '%'
									   OR ZBD.ChargeWeight like '%'+ @Search + '%'
									   OR ZBD.ToPayAmount like '%'+ @Search + '%'
									   OR ZBD.PaidAmount like '%'+ @Search + '%'
									   OR ZBD.TBBAmount like '%'+ @Search + '%'
									   OR PBM.TaxableAmount like '%'+ @Search + '%'
									   OR PBM.TDSPercent like '%'+ @Search + '%'
									   OR PBM.TDSAmount like '%'+ @Search + '%'
									   OR ZBD.Rate like '%'+ @Search + '%'
									   OR ZBD.GSTAmount like '%'+ @Search + '%'
									   OR PBM.AdvanceCash like '%'+ @Search + '%'
									   OR PBM.AdvanceNeft like '%'+ @Search + '%'
									   OR PBM.ReceiveCash like '%'+ @Search + '%'
									   OR PBM.OtherPlus like '%'+ @Search + '%'
									   OR ZBD.Freight like '%'+ @Search + '%'
									   OR ZBD.BranchName like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO

		