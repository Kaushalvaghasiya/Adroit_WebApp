CREATE OR ALTER Procedure [dbo].[sp_ChalanList]
  @LoginId INT,
  @FirmId INT,
  @BranchId INT,
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [Z-PurchaseBillMaster-Z].BillNumberBranch END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [Z-PurchaseBillMaster-Z].BillNumberBranch END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [Z-PurchaseBillMaster-Z].BillDate END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [Z-PurchaseBillMaster-Z].BillDate END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN Vehilcle.VRN END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN Vehilcle.VRN END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN [Z-PurchaseBillMaster-Z].TaxableAmount END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN [Z-PurchaseBillMaster-Z].TaxableAmount END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN CT1.Title END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN CT1.Title END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN CT2.Title END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN CT2.Title END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder = 'ASC' THEN
				ISNULL([Z-PurchaseBillMaster-Z].TaxableAmount,0) - 
				(ISNULL([Z-PurchaseBillMaster-Z].TDSAmount,0) + ISNULL([Z-PurchaseBillMaster-Z].AdvanceCash,0) + ISNULL([Z-PurchaseBillMaster-Z].AdvanceNeft,0) + ISNULL([Z-PurchaseBillMaster-Z].OtherLess,0))
				+ (ISNULL([Z-PurchaseBillMaster-Z].ReceiveCash,0) + ISNULL([Z-PurchaseBillMaster-Z].OtherPlus,0))
			END ASC,
			CASE WHEN @SortColumn = 6 AND @SortOrder = 'DESC' THEN
				ISNULL([Z-PurchaseBillMaster-Z].TaxableAmount,0) - 
				(ISNULL([Z-PurchaseBillMaster-Z].TDSAmount,0) + ISNULL([Z-PurchaseBillMaster-Z].AdvanceCash,0) + ISNULL([Z-PurchaseBillMaster-Z].AdvanceNeft,0) + ISNULL([Z-PurchaseBillMaster-Z].OtherLess,0))
				+ (ISNULL([Z-PurchaseBillMaster-Z].ReceiveCash,0) + ISNULL([Z-PurchaseBillMaster-Z].OtherPlus,0))
			END DESC,
			CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' THEN CA.Name END ASC,  
			CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' THEN CA.Name END DESC,
			CASE WHEN @SortColumn = 8 AND @SortOrder ='ASC' THEN Driver.Name END ASC,  
			CASE WHEN @SortColumn = 8 AND @SortOrder ='DESC' THEN Driver.Name END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount 
		,[Z-PurchaseBillMaster-Z].*
		,Vehilcle.VRN As Vehicle
		,CT1.Title As CityFrom
		,CT2.Title As CityTo
		,CA.Name As BillPartyName
		,Driver.Name As Driver
		,ISNULL([Z-PurchaseBillMaster-Z].TaxableAmount,0) - 
		(ISNULL([Z-PurchaseBillMaster-Z].TDSAmount,0) + ISNULL([Z-PurchaseBillMaster-Z].AdvanceCash,0) + ISNULL([Z-PurchaseBillMaster-Z].AdvanceNeft,0) + ISNULL([Z-PurchaseBillMaster-Z].OtherLess,0))
		+ (ISNULL([Z-PurchaseBillMaster-Z].ReceiveCash,0) + ISNULL([Z-PurchaseBillMaster-Z].OtherPlus,0)) AS NetAmount 
		FROM [Z-PurchaseBillMaster-Z]
		INNER JOIN Vehilcle on Vehilcle.Id = [Z-PurchaseBillMaster-Z].VehicleId AND Vehilcle.Active = 1
		INNER JOIN Driver on Driver.Id = [Z-PurchaseBillMaster-Z].DriverId AND Driver.Active = 1
		LEFT JOIN [CustomerAccountBranchMapping] AS CAB on CAB.Id = [Z-PurchaseBillMaster-Z].AccountBranchMappingId AND CAB.Deleted = 0
		LEFT JOIN [CustomerAccount] AS CA on CA.Id = CAB.AccountId AND CA.CustomerId = @CustomerId AND CA.Deleted = 0 AND CA.Active = 1
		LEFT JOIN [City] AS CT1 on CT1.Id = [Z-PurchaseBillMaster-Z].CityIdFrom AND CT1.Active = 1
		LEFT JOIN [City] AS CT2 on CT2.Id = [Z-PurchaseBillMaster-Z].CityIdTo AND CT2.Active = 1
		WHERE [Z-PurchaseBillMaster-Z].Deleted = 0 
			AND [Z-PurchaseBillMaster-Z].FirmId = @FirmId
			AND [Z-PurchaseBillMaster-Z].BranchId = @BranchId
			AND [Z-PurchaseBillMaster-Z].YearId = @YearId			  
		AND [Z-PurchaseBillMaster-Z].BranchId = @BranchId
		AND (Coalesce(@Search,'') = '' OR [Z-PurchaseBillMaster-Z].BillNumberBranch like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO
