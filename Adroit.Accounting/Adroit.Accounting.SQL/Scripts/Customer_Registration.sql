/****** Object:  StoredProcedure [dbo].[sp_CityList_Select]    Script Date: 17-02-2023 14:00:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CityList_Select]
AS
BEGIN
	SELECT Id,Title
	FROM City
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CustomerDelete]    Script Date: 17-02-2023 14:00:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_CustomerDelete]
(
	@ID INT
)
AS
BEGIN
	UPDATE Customer 
	SET IsDeleted=1
	WHERE Id= @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CustomerGet]    Script Date: 17-02-2023 14:00:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CustomerGet]
(
	@ID INT
)
AS
BEGIN
	SELECT [Name],Address1,Address2,CityId,StateId,Pincode,ContactPersonName,Mobile,
			MobileAlternate,Phone,Email,BusinessId,Requirement,TotalFirm,CustomerType,
			AdharUID,TotalUsers,IsDeleted,IsActive
	FROM Customer WHERE Id = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CustomerGetByEmail]    Script Date: 17-02-2023 14:00:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CustomerGetByEmail]
(
	@Email varchar(50)
)
AS
BEGIN
	SELECT [Name],Address1,Address2,CityId,StateId,Pincode,ContactPersonName,Mobile,
			MobileAlternate,Phone,Email,BusinessId,Requirement,TotalFirm,CustomerType,
			AdharUID,TotalUsers,IsDeleted,IsActive
	FROM Customer WHERE Email = @Email
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CustomerList]    Script Date: 17-02-2023 14:00:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Exec [sp_CustomerList] '',1,10,0,'asc'
CREATE Procedure [dbo].[sp_CustomerList]
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
	  SELECT  
	   ROW_NUMBER() over (ORDER BY
	   CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN Customer.[Name] END ASC,  
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN Customer.[Name] END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN Customer.Email END ASC,  
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN Customer.Email END DESC  
		) AS RowNum,
	   Count(*) over () AS TotalRows, Customer.*, [State].Title as [State], [City].Title as [City]
	  FROM Customer
	  LEFT JOIN [State] on Customer.StateId = [State].Id
	  LEFT JOIN [City] on Customer.CityId = [City].Id
	  WHERE Customer.IsDeleted = 0
	  AND (Coalesce(@Search,'') = '' OR Customer.[Name] like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;


GO
/****** Object:  StoredProcedure [dbo].[sp_CustomerSave]    Script Date: 17-02-2023 14:00:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CustomerSave]
(
 @ID int
,@Name varchar(50)
,@Address1 varchar(200)
,@Address2 varchar(200)
,@Address3 varchar(200)
,@CityId int
,@StateId int
,@Pincode varchar(10)
,@ContactPersonName varchar(100)
,@Mobile varchar(15)
,@MobileAlternate varchar(15)
,@Phone varchar(20)
,@Email varchar(50)
,@BusinessId smallint
,@Requirement nvarchar(max)
,@TotalFirm smallint
,@CustomerType char(1)
,@AdharUID varchar(12)
,@TotalUsers smallint
,@IsDeleted bit
,@IsActive bit
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Customer WHERE Id = @ID)
		BEGIN
			UPDATE Customer SET
			[Name] = @Name
			,Address1 = @Address1
			,Address2 = @Address2
			,CityId = @CityId
			,StateId = @StateId
			,Pincode = @Pincode
			,ContactPersonName = @ContactPersonName
			,Mobile = @Mobile
			,MobileAlternate = @MobileAlternate
			,Phone = @Phone
			,Email = @Email
			,BusinessId = @BusinessId
			,Requirement = @Requirement
			,TotalFirm = @TotalFirm
			,CustomerType = @CustomerType
			,AdharUID = @AdharUID
			,TotalUsers = @TotalUsers
			,IsDeleted = @IsDeleted
			,IsActive = @IsActive
			WHERE ID = @ID
			SELECT @ID;
		END
	ELSE
		BEGIN
			INSERT INTO Customer
			([Name],Address1,Address2,CityId,StateId,Pincode,ContactPersonName,Mobile,MobileAlternate,Phone,Email,BusinessId,Requirement,TotalFirm,CustomerType,AdharUID,TotalUsers,IsDeleted,IsActive)
			VALUES
			(@Name,@Address1,@Address2,@CityId,@StateId,@Pincode,@ContactPersonName,@Mobile,@MobileAlternate,@Phone,@Email,@BusinessId,@Requirement,@TotalFirm,@CustomerType,@AdharUID,@TotalUsers,@IsDeleted,@IsActive)

			SET @ID = SCOPE_IDENTITY();
			SELECT @ID;
		END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_StateList_Select]    Script Date: 17-02-2023 14:00:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_StateList_Select]
AS
BEGIN
	SELECT Id,Title
	FROM [State]
END
GO
