CREATE OR ALTER Procedure [dbo].[sp_ChalanReceiveAgencyList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [Z-ChalanReceiveAgencyMaster-Z].BillNumberBranch END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [Z-ChalanReceiveAgencyMaster-Z].BillNumberBranch END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [Z-ChalanReceiveAgencyMaster-Z].ArrivalDate END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [Z-ChalanReceiveAgencyMaster-Z].ArrivalDate END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN [Z-ChalanReceiveAgencyMaster-Z].BillNumberFirm END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN [Z-ChalanReceiveAgencyMaster-Z].BillNumberFirm END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN [Z-ChalanReceiveAgencyMaster-Z].FirmChalanNumber END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN [Z-ChalanReceiveAgencyMaster-Z].FirmChalanNumber END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN [Z-ChalanReceiveAgencyMaster-Z].TaxableAmount END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN [Z-ChalanReceiveAgencyMaster-Z].TaxableAmount END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN [Z-ChalanReceiveAgencyMaster-Z].NetAmount END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN [Z-ChalanReceiveAgencyMaster-Z].NetAmount END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN City1.Title END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN City1.Title END DESC,
			CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' THEN City2.Title END ASC,  
			CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' THEN City2.Title END DESC,
			CASE WHEN @SortColumn = 8 AND @SortOrder ='ASC' THEN CA1.Name END ASC,  
			CASE WHEN @SortColumn = 8 AND @SortOrder ='DESC' THEN CA1.Name END DESC,
			CASE WHEN @SortColumn = 9 AND @SortOrder ='ASC' THEN CA2.Name END ASC,  
			CASE WHEN @SortColumn = 9 AND @SortOrder ='DESC' THEN CA2.Name END DESC,
			CASE WHEN @SortColumn = 10 AND @SortOrder ='ASC' THEN Vehilcle.VRN END ASC,  
			CASE WHEN @SortColumn = 10 AND @SortOrder ='DESC' THEN Vehilcle.VRN END DESC,
			CASE WHEN @SortColumn = 11 AND @SortOrder ='ASC' THEN [Z-ChalanReceiveAgencyMaster-Z].FirmChalanDate END ASC,  
			CASE WHEN @SortColumn = 11 AND @SortOrder ='DESC' THEN [Z-ChalanReceiveAgencyMaster-Z].FirmChalanDate END DESC
		)AS RowNum,
		Count(*) over () AS TotalCount 
		,[Z-ChalanReceiveAgencyMaster-Z].Id
		,[Z-ChalanReceiveAgencyMaster-Z].ArrivalDate
		,[Z-ChalanReceiveAgencyMaster-Z].BillNumberBranch
		,[Z-ChalanReceiveAgencyMaster-Z].BillNumberFirm
		,[Z-ChalanReceiveAgencyMaster-Z].FirmChalanNumber
		,[Z-ChalanReceiveAgencyMaster-Z].FirmChalanDate
		,[Z-ChalanReceiveAgencyMaster-Z].TaxableAmount
		,[Z-ChalanReceiveAgencyMaster-Z].NetAmount
		,City1.Title As CityFrom
		,City2.Title As CityTo
		,CA1.Name As SenderName
		,CA2.Name As BillPartyName
		,Vehilcle.VRN As VehicleVRN
		,(SELECT SUM(ISNULL(NetAmount,0)) FROM [Z-ChalanReceiveAgencyDetail-Z] 
			  INNER JOIN TransportLRPayType ON [Z-ChalanReceiveAgencyDetail-Z].LRPayTypeId = TransportLRPayType.Id 
			  AND UPPER(TransportLRPayType.Title) = 'TO PAY' AND TransportLRPayType.Active = 1 AND [Z-ChalanReceiveAgencyDetail-Z].Deleted = 0
			  AND [Z-ChalanReceiveAgencyDetail-Z].ChalanReceiveAgencyMasterId = [Z-ChalanReceiveAgencyMaster-Z].Id) AS ToPayLrSum
		,(SELECT COUNT(*) FROM [Z-ChalanReceiveAgencyDetail-Z] 
			  INNER JOIN TransportLRPayType ON [Z-ChalanReceiveAgencyDetail-Z].LRPayTypeId = TransportLRPayType.Id 
			  AND UPPER(TransportLRPayType.Title) = 'TO PAY' AND TransportLRPayType.Active = 1 AND [Z-ChalanReceiveAgencyDetail-Z].Deleted = 0
			  AND [Z-ChalanReceiveAgencyDetail-Z].ChalanReceiveAgencyMasterId = [Z-ChalanReceiveAgencyMaster-Z].Id) AS ToPayLr
		,(SELECT SUM(ISNULL(NetAmount,0)) FROM [Z-ChalanReceiveAgencyDetail-Z] 
			  INNER JOIN TransportLRPayType ON [Z-ChalanReceiveAgencyDetail-Z].LRPayTypeId = TransportLRPayType.Id 
			  AND UPPER(TransportLRPayType.Title) = 'PAID' AND TransportLRPayType.Active = 1 AND [Z-ChalanReceiveAgencyDetail-Z].Deleted = 0
			  AND [Z-ChalanReceiveAgencyDetail-Z].ChalanReceiveAgencyMasterId = [Z-ChalanReceiveAgencyMaster-Z].Id) AS PaidLrSum
		,(SELECT COUNT(*) FROM [Z-ChalanReceiveAgencyDetail-Z] 
			  INNER JOIN TransportLRPayType ON [Z-ChalanReceiveAgencyDetail-Z].LRPayTypeId = TransportLRPayType.Id 
			  AND UPPER(TransportLRPayType.Title) = 'PAID' AND TransportLRPayType.Active = 1 AND [Z-ChalanReceiveAgencyDetail-Z].Deleted = 0
			  AND [Z-ChalanReceiveAgencyDetail-Z].ChalanReceiveAgencyMasterId = [Z-ChalanReceiveAgencyMaster-Z].Id) AS PaidLr
		,(SELECT SUM(ISNULL(NetAmount,0)) FROM [Z-ChalanReceiveAgencyDetail-Z] 
			  INNER JOIN TransportLRPayType ON [Z-ChalanReceiveAgencyDetail-Z].LRPayTypeId = TransportLRPayType.Id 
			  AND UPPER(TransportLRPayType.Title) = 'TBB' AND TransportLRPayType.Active = 1 AND [Z-ChalanReceiveAgencyDetail-Z].Deleted = 0
			  AND [Z-ChalanReceiveAgencyDetail-Z].ChalanReceiveAgencyMasterId = [Z-ChalanReceiveAgencyMaster-Z].Id) AS TbbLRSum
		,(SELECT COUNT(*) FROM [Z-ChalanReceiveAgencyDetail-Z] 
			  INNER JOIN TransportLRPayType ON [Z-ChalanReceiveAgencyDetail-Z].LRPayTypeId = TransportLRPayType.Id 
			  AND UPPER(TransportLRPayType.Title) = 'TBB' AND TransportLRPayType.Active = 1 AND [Z-ChalanReceiveAgencyDetail-Z].Deleted = 0
			  AND [Z-ChalanReceiveAgencyDetail-Z].ChalanReceiveAgencyMasterId = [Z-ChalanReceiveAgencyMaster-Z].Id) AS TbbLR
		FROM [Z-ChalanReceiveAgencyMaster-Z]
		INNER JOIN [City] as City1 on City1.Id = [Z-ChalanReceiveAgencyMaster-Z].CityIdFrom AND City1.Active = 1
		INNER JOIN [City] as City2 on City2.Id = [Z-ChalanReceiveAgencyMaster-Z].CityIdTo AND City2.Active = 1
		INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = [Z-ChalanReceiveAgencyMaster-Z].SenderBranchAccountMappingid AND CAB1.Deleted = 0
		INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId AND CA1.CustomerId = @CustomerId AND CA1.Deleted = 0 AND CA1.Active = 1
		LEFT JOIN Vehilcle on Vehilcle.Id = [Z-ChalanReceiveAgencyMaster-Z].VehicleId AND Vehilcle.Active = 1
		LEFT JOIN [CustomerAccountBranchMapping] AS CAB2 on CAB2.Id = [Z-ChalanReceiveAgencyMaster-Z].BillAccountBranchMappingId AND CAB2.Deleted = 0
		LEFT JOIN [CustomerAccount] AS CA2 on CA2.Id = CAB2.AccountId AND CA2.CustomerId = @CustomerId AND CA2.Deleted = 0 AND CA2.Active = 1
		WHERE [Z-ChalanReceiveAgencyMaster-Z].BranchId = @BranchId 
			AND [Z-ChalanReceiveAgencyMaster-Z].FirmId = @FirmId
			AND [Z-ChalanReceiveAgencyMaster-Z].YearId = @YearId	
			AND [Z-ChalanReceiveAgencyMaster-Z].Deleted = 0 
		AND (Coalesce(@Search,'') = '' OR [Z-ChalanReceiveAgencyMaster-Z].ArrivalDate like '%'+ @Search + '%'
									   OR [Z-ChalanReceiveAgencyMaster-Z].BillNumberBranch like '%'+ @Search + '%'
									   OR [Z-ChalanReceiveAgencyMaster-Z].BillNumberFirm like '%'+ @Search + '%'
									   OR [Z-ChalanReceiveAgencyMaster-Z].FirmChalanNumber like '%'+ @Search + '%'
									   OR [Z-ChalanReceiveAgencyMaster-Z].FirmChalanDate like '%'+ @Search + '%'
									   OR [Z-ChalanReceiveAgencyMaster-Z].TaxableAmount like '%'+ @Search + '%'
									   OR [Z-ChalanReceiveAgencyMaster-Z].NetAmount like '%'+ @Search + '%'
									   OR City1.Title like '%'+ @Search + '%'
									   OR City2.Title like '%'+ @Search + '%'
									   OR CA1.Name like '%'+ @Search + '%'
									   OR CA2.Name like '%'+ @Search + '%'
									   OR Vehilcle.VRN like '%'+ @Search + '%'
			)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO