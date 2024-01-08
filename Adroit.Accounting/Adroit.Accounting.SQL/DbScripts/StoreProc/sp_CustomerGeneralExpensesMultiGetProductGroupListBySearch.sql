CREATE OR ALTER Procedure [dbo].[sp_CustomerGeneralExpensesMultiGetProductGroupListBySearch]
  @BranchId INT,
  @FirmId INT,
  @Search VARCHAR(100) = ''
As
Set Nocount on;
Begin
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);
	
	SELECT Product.*, ProductGroup.Title AS GroupName,
			ProductDesignNumber.Title AS ProductDesignNumber,
			ProductColor.Title AS ColorName,
			ProductSize.Title AS SizeName,
			ProductBranchMapping.Id AS ProductBranchMappingId
	FROM Product 
		 INNER JOIN ProductBranchMapping ON Product.Id = ProductBranchMapping.ProductId AND ProductBranchMapping.BranchId = 22 AND Product.CustomerId = 14
		 LEFT JOIN ProductGroup ON Product.GroupId = ProductGroup.Id AND ProductGroup.Active = 1 AND ProductGroup.Deleted = 0
		 LEFT JOIN ProductDesignNumber ON Product.DesignNumberId = ProductDesignNumber.Id AND ProductDesignNumber.Active = 1 AND ProductDesignNumber.Deleted = 0
		 LEFT JOIN ProductColor ON Product.ColourId = ProductColor.Id AND ProductColor.Active = 1 AND ProductColor.Deleted = 0
		 LEFT JOIN ProductSize ON Product.SizeId = ProductSize.Id AND ProductSize.Active = 1 AND ProductSize.Deleted = 0 
	WHERE (Coalesce(@Search,'') = '' OR ProductGroup.Title like '%'+ @Search + '%' 
									 OR ProductDesignNumber.Title like '%'+ @Search + '%'
									 OR ProductColor.Title like '%'+ @Search + '%'
									 OR ProductSize.Title like '%'+ @Search + '%'
									 OR Product.Code like '%'+ @Search + '%'
									 OR Product.PrintName like '%'+ @Search + '%'
									 OR Product.TitleAlternate like '%'+ @Search + '%'
									 OR Product.HSNCode like '%'+ @Search + '%'
		  )
	 ORDER BY ProductGroup.Title, ProductDesignNumber.Title, ProductColor.Title, ProductSize.Title, Product.Code, Product.PrintName, Product.TitleAlternate, Product.HSNCode
End
Set Nocount off;
GO
