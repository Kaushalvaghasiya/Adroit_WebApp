CREATE OR ALTER Procedure [dbo].[sp_CustomerFirmBranchLRRateList]
  @LoginId int,
  @FirmId int,  
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
As
Set Nocount on;
Begin
	DECLARE @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT * FROM
	(   
		SELECT  
			ROW_NUMBER() over (ORDER BY
				CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [CustomerFirmBranch].[Title] END ASC,
				CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [CustomerFirmBranch].[Title] END DESC,
				CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [City].[Title] END ASC,
				CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [City].[Title] END DESC,
				CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN CustomerFirmBranchLRRate.RatePerKg END ASC,
				CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN CustomerFirmBranchLRRate.RatePerKg END DESC,
				CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN CustomerFirmBranchLRRate.RatePerParcel END ASC,
				CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN CustomerFirmBranchLRRate.RatePerParcel END DESC,
				CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN CustomerFirmBranchLRRate.IsCrossingChargeApply END ASC,
				CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN CustomerFirmBranchLRRate.IsCrossingChargeApply END DESC,
				CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN CustomerFirmBranchLRRate.CrossingChargePercentOnFreight END ASC,
				CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN CustomerFirmBranchLRRate.CrossingChargePercentOnFreight END DESC,
				CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN CustomerFirmBranchLRRate.CrossingChargePerKg END ASC,
				CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN CustomerFirmBranchLRRate.CrossingChargePerKg END DESC,
				CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' THEN CustomerFirmBranchLRRate.CrossingChargePerParcel END ASC,
				CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' THEN CustomerFirmBranchLRRate.CrossingChargePerParcel END DESC,
				CASE WHEN @SortColumn = 8 AND @SortOrder ='ASC' THEN CustomerFirmBranchLRRate.IsCommissionApply END ASC,
				CASE WHEN @SortColumn = 8 AND @SortOrder ='DESC' THEN CustomerFirmBranchLRRate.IsCommissionApply END DESC,
				CASE WHEN @SortColumn = 9 AND @SortOrder ='ASC' THEN CustomerFirmBranchLRRate.CommissionPercentOnFreight END ASC,
				CASE WHEN @SortColumn = 9 AND @SortOrder ='DESC' THEN CustomerFirmBranchLRRate.CommissionPercentOnFreight END DESC,
				CASE WHEN @SortColumn = 10 AND @SortOrder ='ASC' THEN CustomerFirmBranchLRRate.CommissionPerKg END ASC,
				CASE WHEN @SortColumn = 10 AND @SortOrder ='DESC' THEN CustomerFirmBranchLRRate.CommissionPerKg END DESC,
				CASE WHEN @SortColumn = 11 AND @SortOrder ='ASC' THEN CustomerFirmBranchLRRate.CommissionPerParcel END ASC,
				CASE WHEN @SortColumn = 11 AND @SortOrder ='DESC' THEN CustomerFirmBranchLRRate.CommissionPerParcel END DESC
			) AS RowNum,
			Count(*) over () AS TotalCount, 
			CustomerFirmBranchLRRate.*,
			[CustomerFirmBranch].Title as Branch, 
			[City].Title as City
		FROM Customer
		INNER JOIN CustomerFirm ON Customer.Id = CustomerFirm.CustomerId
		INNER JOIN CustomerFirmBranch ON CustomerFirm.Id = CustomerFirmBranch.FirmId
		INNER JOIN CustomerFirmBranchLRRate ON CustomerFirmBranch.Id = CustomerFirmBranchLRRate.BranchId
		LEFT JOIN City ON CustomerFirmBranchLRRate.CityId = City.Id
		WHERE CustomerFirm.Id = @FirmId
			AND ((Coalesce(@Search,'') = '' 
			OR CustomerFirmBranch.[Title] like '%'+ @Search + '%'
			OR City.[Title] like '%'+ @Search + '%'
			OR CustomerFirmBranchLRRate.RatePerKg like '%'+ @Search + '%'
			OR CustomerFirmBranchLRRate.RatePerParcel like '%'+ @Search + '%'
			OR CustomerFirmBranchLRRate.CrossingChargePercentOnFreight like '%'+ @Search + '%'
			OR CustomerFirmBranchLRRate.CrossingChargePerKg like '%'+ @Search + '%'
			OR CustomerFirmBranchLRRate.CrossingChargePerParcel like '%'+ @Search + '%'
			OR CustomerFirmBranchLRRate.CommissionPercentOnFreight like '%'+ @Search + '%'
			OR CustomerFirmBranchLRRate.CommissionPerKg like '%'+ @Search + '%'
			OR CustomerFirmBranchLRRate.CommissionPerParcel like '%'+ @Search + '%'
			))
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
GO