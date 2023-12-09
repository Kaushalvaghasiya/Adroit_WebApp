CREATE OR ALTER Procedure [dbo].[sp_CustomerFirmTransportSettingList]
  @LoginId INT,
  @FirmId INT,
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
As
Set Nocount on;
Begin
	
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT * FROM
	(   
		SELECT ROW_NUMBER() over 
		(ORDER BY
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [CustomerFirm].Title END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [CustomerFirm].Title END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [Product].Title END ASC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [Product].Title END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN [CustomerFirmTransportSetting].IsWeightRoundOff END ASC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN [CustomerFirmTransportSetting].IsWeightRoundOff END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN [CustomerFirmTransportSetting].IsPartyAndCityRateFromLastLR END ASC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN [CustomerFirmTransportSetting].IsPartyAndCityRateFromLastLR END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN [CustomerFirmTransportSetting].ReverseChargeApplyForURDParty END ASC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN [CustomerFirmTransportSetting].ReverseChargeApplyForURDParty END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN [CustomerFirmTransportSetting].ReverseChargeLimitForSalesGST END ASC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN [CustomerFirmTransportSetting].ReverseChargeLimitForSalesGST END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		CustomerFirmTransportSetting.*,
		[CustomerFirm].Title as Firm,
		[Product].Title as Service
		FROM CustomerFirmTransportSetting
		INNER JOIN [CustomerFirm] on CustomerFirm.Id = [CustomerFirmTransportSetting].FirmId AND [CustomerFirm].CustomerId = @CustomerId
		INNER JOIN [Product] on Product.Id = [CustomerFirmTransportSetting].ProductIdForSales AND [Product].CustomerId = @CustomerId
		WHERE [CustomerFirm].Deleted = 0 AND [CustomerFirm].Active = 1
		AND [Product].Deleted = 0 AND [Product].Active = 1
		AND CustomerFirmTransportSetting.FirmId = @FirmId
		AND (Coalesce(@Search,'') = '' OR CustomerFirm.[Title] like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO