CREATE OR ALTER Procedure [dbo].[sp_GSTInvoiceTypeList]
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
	SELECT * FROM
	(   
		SELECT ROW_NUMBER() over 
		(ORDER BY
			CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN GSTInvoiceType.[Title] END ASC,  
			CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN GSTInvoiceType.[Title] END DESC,
			CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN GSTInvoiceType.[TitleB2B] END ASC,  
			CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN GSTInvoiceType.[TitleB2B] END DESC,
			CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN GSTInvoiceType.[TitleEinvoice] END ASC,  
			CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN GSTInvoiceType.[TitleEinvoice] END DESC,
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN GSTInvoiceType.[TitleCDNUR] END ASC,  
			CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN GSTInvoiceType.[TitleCDNUR] END ASC,  
			CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN GSTInvoiceType.[PayType] END DESC,
			CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN GSTInvoiceType.[PayType] END ASC,  
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN GSTInvoiceType.[OrderNumber] END DESC,
			CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN GSTInvoiceType.[OrderNumber] END DESC,
			CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN GSTInvoiceType.[Active] END ASC,  
			CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN GSTInvoiceType.[Active] END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		GSTInvoiceType.*
		FROM GSTInvoiceType
		WHERE (Coalesce(@Search,'') = '' 
		OR GSTInvoiceType.[Title] like '%'+ @Search + '%' 
		OR GSTInvoiceType.[TitleB2B] like '%'+ @Search + '%' 
		OR GSTInvoiceType.[TitleEinvoice] like '%'+ @Search + '%' 
		OR GSTInvoiceType.[TitleCDNUR] like '%'+ @Search + '%' 
		OR GSTInvoiceType.[PayType] like '%'+ @Search + '%' 
		)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO