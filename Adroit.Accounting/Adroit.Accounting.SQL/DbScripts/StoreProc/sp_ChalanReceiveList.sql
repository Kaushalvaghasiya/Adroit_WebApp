CREATE OR ALTER Procedure [dbo].[sp_ChalanReceiveList]
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
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN CR.BillNumberBranch END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN CR.BillNumberBranch END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN CR.BillNumberFirm END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN CR.BillNumberFirm END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN CR.ReceiveDate END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN CR.ReceiveDate END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN Vehilcle.VRN END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN Vehilcle.VRN END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN CustomerFirmBranch.Title END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN CustomerFirmBranch.Title END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN PBM.BillNumberBranch END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN PBM.BillNumberBranch END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN PBM.BillDate END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN PBM.BillDate END DESC,
			CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' THEN LRFreight.Freight END ASC,  
			CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' THEN LRFreight.Freight END DESC,
			CASE WHEN @SortColumn = 8 AND @SortOrder ='ASC' THEN CT1.Title END ASC,  
			CASE WHEN @SortColumn = 8 AND @SortOrder ='DESC' THEN CT1.Title END DESC,
			CASE WHEN @SortColumn = 9 AND @SortOrder ='ASC' THEN CT2.Title END ASC,  
			CASE WHEN @SortColumn = 9 AND @SortOrder ='DESC' THEN CT2.Title END DESC,
			CASE WHEN @SortColumn = 10 AND @SortOrder = 'ASC' THEN ISNULL(PBM.TaxableAmount,0) - (ISNULL(PBM.TDSAmount,0) + ISNULL(PBM.AdvanceCash,0) + ISNULL(PBM.AdvanceNeft,0) + ISNULL(PBM.OtherLess,0)) + (ISNULL(PBM.ReceiveCash,0) + ISNULL(PBM.OtherPlus,0)) END ASC,
			CASE WHEN @SortColumn = 10 AND @SortOrder = 'DESC' THEN ISNULL(PBM.TaxableAmount,0) - (ISNULL(PBM.TDSAmount,0) + ISNULL(PBM.AdvanceCash,0) + ISNULL(PBM.AdvanceNeft,0) + ISNULL(PBM.OtherLess,0)) + (ISNULL(PBM.ReceiveCash,0) + ISNULL(PBM.OtherPlus,0)) END DESC,
			CASE WHEN @SortColumn = 11 AND @SortOrder ='ASC' THEN CASE WHEN CustomerAccount.PrintName = '' THEN CustomerAccount.Name ELSE CustomerAccount.PrintName END END ASC,  
			CASE WHEN @SortColumn = 11 AND @SortOrder ='DESC' THEN CASE WHEN CustomerAccount.PrintName = '' THEN CustomerAccount.Name ELSE CustomerAccount.PrintName END END DESC,
			CASE WHEN @SortColumn = 12 AND @SortOrder ='ASC' THEN ToPayLRDetails.ToPayLR END ASC,  
			CASE WHEN @SortColumn = 12 AND @SortOrder ='DESC' THEN ToPayLRDetails.ToPayLR END DESC,
			CASE WHEN @SortColumn = 13 AND @SortOrder ='ASC' THEN ToPayLRDetails.ToPayLRAmount END ASC,  
			CASE WHEN @SortColumn = 13 AND @SortOrder ='DESC' THEN ToPayLRDetails.ToPayLRAmount END DESC,
			CASE WHEN @SortColumn = 14 AND @SortOrder ='ASC' THEN PaidLRDetails.PaidLR END ASC,  
			CASE WHEN @SortColumn = 14 AND @SortOrder ='DESC' THEN PaidLRDetails.PaidLR END DESC,
			CASE WHEN @SortColumn = 15 AND @SortOrder ='ASC' THEN PaidLRDetails.PaidLRAmount END ASC,  
			CASE WHEN @SortColumn = 15 AND @SortOrder ='DESC' THEN PaidLRDetails.PaidLRAmount END DESC,
			CASE WHEN @SortColumn = 16 AND @SortOrder ='ASC' THEN TBBLRDetails.TBBLR END ASC,  
			CASE WHEN @SortColumn = 16 AND @SortOrder ='DESC' THEN TBBLRDetails.TBBLR END DESC,
			CASE WHEN @SortColumn = 17 AND @SortOrder ='ASC' THEN TBBLRDetails.TBBLRAmount END ASC,  
			CASE WHEN @SortColumn = 17 AND @SortOrder ='DESC' THEN TBBLRDetails.TBBLRAmount END DESC
		) AS RowNum
		,Count(*) over () AS TotalCount 
		,CR.Id
		,CR.BillNumberBranch
		,CR.BillNumberFirm
		,CR.ReceiveDate 
		,Vehilcle.VRN As VehilcleNumber
		,CustomerFirmBranch.Title As SenderName
		,PBM.BillNumberBranch As ChalanNumber
		,PBM.BillDate As ChalanDate
		,LRFreight.Freight As Freight
		,CT1.Title  As CityFrom
		,CT2.Title As CityTo
		,CASE WHEN CustomerAccount.PrintName = '' THEN CustomerAccount.Name ELSE CustomerAccount.PrintName END As BillParty
		,ToPayLRDetails.ToPayLR As ToPayLR
		,ToPayLRDetails.ToPayLRAmount As ToPayLRAmount
		,PaidLRDetails.PaidLR As PaidLR
		,PaidLRDetails.PaidLRAmount As PaidLRAmount
		,TBBLRDetails.TBBLR As TBBLR
		,TBBLRDetails.TBBLRAmount As TBBLRAmount
		,ISNULL(PBM.TaxableAmount,0) - (ISNULL(PBM.TDSAmount,0) + ISNULL(PBM.AdvanceCash,0) + ISNULL(PBM.AdvanceNeft,0) + ISNULL(PBM.OtherLess,0)) + (ISNULL(PBM.ReceiveCash,0) + ISNULL(PBM.OtherPlus,0)) AS NetAmount 
		FROM [Z-ChalanReceive-Z] As CR
		INNER JOIN [Z-PurchaseBillMaster-Z] As PBM on PBM.Id = CR.PurchaseBillMasterId 
		INNER JOIN Vehilcle on Vehilcle.Id = PBM.VehicleId AND Vehilcle.CustomerId = @CustomerId 
		INNER JOIN CustomerFirmBranch on CustomerFirmBranch.Id = PBM.BranchId 
		INNER JOIN CustomerAccountBranchMapping on CustomerAccountBranchMapping.Id = PBM.AccountBranchMappingId 
		INNER JOIN CustomerAccount on CustomerAccount.Id = CustomerAccountBranchMapping.AccountId AND CustomerAccount.CustomerId = @CustomerId
		LEFT JOIN [City] As CT1 on CT1.Id = PBM.CityIdFrom
		LEFT JOIN [City] As CT2 on CT2.Id = PBM.CityIdTo
		LEFT JOIN(
			SELECT PBD.PurchaseBillMasterId,SUM(LRB.Freight) As Freight
			FROM [Z-PurchaseBillDetail-Z] As PBD
			LEFT JOIN [Z-LRBooking-Z] As LRB on LRB.Id = PBD.LRBookingId
			GROUP BY PBD.PurchaseBillMasterId
		)LRFreight ON LRFreight.PurchaseBillMasterId = PBM.Id
		LEFT JOIN (
			SELECT PBM.Id,
				COUNT(*) AS ToPayLR,
				SUM(ISNULL(PBM.TaxableAmount, 0) - (ISNULL(PBM.TDSAmount, 0) + ISNULL(PBM.AdvanceCash, 0) + ISNULL(PBM.AdvanceNeft, 0) + ISNULL(PBM.OtherLess, 0)) + (ISNULL(PBM.ReceiveCash, 0) + ISNULL(PBM.OtherPlus, 0))) AS ToPayLRAmount
			FROM [Z-PurchaseBillMaster-Z] AS PBM
				INNER JOIN [Z-PurchaseBillDetail-Z] AS PBD ON PBM.Id = PBD.PurchaseBillMasterId
				INNER JOIN [Z-LRBooking-Z] AS LRB ON LRB.Id = PBD.LRBookingId
				INNER JOIN TransportLRPayType ON LRB.LRPayTypeId = TransportLRPayType.Id
			WHERE UPPER(TransportLRPayType.Title) = 'TO PAY' AND TransportLRPayType.Active = 1 AND LRB.Deleted = 0 
			GROUP BY PBM.Id
		)ToPayLRDetails ON ToPayLRDetails.Id = CR.PurchaseBillMasterId
		LEFT JOIN (
			SELECT PBM.Id,
				COUNT(*) AS PaidLR,
				SUM(ISNULL(PBM.TaxableAmount, 0) - (ISNULL(PBM.TDSAmount, 0) + ISNULL(PBM.AdvanceCash, 0) + ISNULL(PBM.AdvanceNeft, 0) + ISNULL(PBM.OtherLess, 0)) + (ISNULL(PBM.ReceiveCash, 0) + ISNULL(PBM.OtherPlus, 0))) AS PaidLRAmount
			FROM [Z-PurchaseBillMaster-Z] AS PBM
				INNER JOIN [Z-PurchaseBillDetail-Z] AS PBD ON PBM.Id = PBD.PurchaseBillMasterId
				INNER JOIN [Z-LRBooking-Z] AS LRB ON LRB.Id = PBD.LRBookingId
				INNER JOIN TransportLRPayType ON LRB.LRPayTypeId = TransportLRPayType.Id
			WHERE UPPER(TransportLRPayType.Title) = 'PAID' AND TransportLRPayType.Active = 1 AND LRB.Deleted = 0 
			GROUP BY PBM.Id
		)PaidLRDetails ON PaidLRDetails.Id = CR.PurchaseBillMasterId
		LEFT JOIN (
			SELECT PBM.Id,
				COUNT(*) AS TBBLR,
				SUM(ISNULL(PBM.TaxableAmount, 0) - (ISNULL(PBM.TDSAmount, 0) + ISNULL(PBM.AdvanceCash, 0) + ISNULL(PBM.AdvanceNeft, 0) + ISNULL(PBM.OtherLess, 0)) + (ISNULL(PBM.ReceiveCash, 0) + ISNULL(PBM.OtherPlus, 0))) AS TBBLRAmount
			FROM [Z-PurchaseBillMaster-Z] AS PBM
				INNER JOIN [Z-PurchaseBillDetail-Z] AS PBD ON PBM.Id = PBD.PurchaseBillMasterId
				INNER JOIN [Z-LRBooking-Z] AS LRB ON LRB.Id = PBD.LRBookingId
				INNER JOIN TransportLRPayType ON LRB.LRPayTypeId = TransportLRPayType.Id
			WHERE UPPER(TransportLRPayType.Title) = 'TBB' AND TransportLRPayType.Active = 1 AND LRB.Deleted = 0 
			GROUP BY PBM.Id
		)TBBLRDetails ON TBBLRDetails.Id = CR.PurchaseBillMasterId
		WHERE CR.BranchId = @BranchId 
			AND CR.FirmId = @FirmId
			AND CR.YearId = @YearId	
			AND CR.Deleted = 0 
		AND (Coalesce(@Search,'') = '' OR CR.BillNumberBranch like '%'+ @Search + '%'
									   OR CR.BillNumberFirm like '%'+ @Search + '%'
									   OR CR.ReceiveDate like '%'+ @Search + '%'
									   OR Vehilcle.VRN like '%'+ @Search + '%'
									   OR CustomerFirmBranch.Title like '%'+ @Search + '%'
									   OR PBM.BillNumberBranch like '%'+ @Search + '%'
									   OR PBM.BillDate like '%'+ @Search + '%'
									   OR LRFreight.Freight like '%'+ @Search + '%'
									   OR CT1.Title like '%'+ @Search + '%'
									   OR CT2.Title like '%'+ @Search + '%'
									   OR CustomerAccount.PrintName like '%'+ @Search + '%'
									   OR CustomerAccount.Name like '%'+ @Search + '%'
									   OR ToPayLRDetails.ToPayLR like '%'+ @Search + '%'
									   OR ToPayLRDetails.ToPayLRAmount like '%'+ @Search + '%'
									   OR PaidLRDetails.PaidLR like '%'+ @Search + '%'
									   OR PaidLRDetails.PaidLR like '%'+ @Search + '%'
									   OR TBBLRDetails.TBBLR like '%'+ @Search + '%'
									   OR TBBLRDetails.TBBLRAmount like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO
