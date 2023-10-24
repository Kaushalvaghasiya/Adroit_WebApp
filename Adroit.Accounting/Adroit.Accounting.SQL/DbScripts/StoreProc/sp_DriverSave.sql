CREATE OR ALTER PROCEDURE [dbo].[sp_DriverSave]
(
	 @Id int,
	 @UserId int,
	 @Name		 nvarchar(100),
	 @Address	 nvarchar(100),
	 @CityId	 int,
	 @StateId    int,
	 @Pincode    varchar(10),
	 @LicenceIssuePlaceId int,
	 @LicenceNumber	varchar(20),
	 @AdharUID		varchar(12),
	 @Mobile		varchar(15),
	 @LicenceExpiry	DateTime,
	 @DriverTypeId	tinyint,
	 @Active bit = 1,
	 @AddedById int = NULL,
	 @ModifiedById INT = NULL
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);
		IF EXISTS (SELECT 1 FROM Driver WHERE Id = @Id And CustomerId = @CustomerId)
			BEGIN
					UPDATE Driver SET
					CustomerId = @CustomerId,				
					Name = @Name,
					Address = @Address,
					CityId = @CityId,
					StateId = @StateId ,
					Pincode = @Pincode,
					LicenceIssuePlaceId = @LicenceIssuePlaceId,
					LicenceNumber =@LicenceNumber,
					AdharUID = @AdharUID,
					Mobile =@Mobile,
					LicenceExpiry =@LicenceExpiry,
					DriverTypeId =@DriverTypeId,
					Active = @Active, 
					ModifiedById = @ModifiedById, 
					ModifiedOn = GETUTCDATE()
					WHERE ID = @Id And CustomerId = @CustomerId

			END
		ELSE
			BEGIN
				INSERT INTO [Driver] 
					(CustomerId,Name,Address,CityId,StateId,Pincode,LicenceIssuePlaceId,LicenceNumber,AdharUID,Mobile,LicenceExpiry,DriverTypeId,Deleted,AddedById,AddedOn)
				VALUES (@CustomerId,@Name,@Address,@CityId,@StateId,@Pincode,@LicenceIssuePlaceId,@LicenceNumber,@AdharUID,@Mobile,@LicenceExpiry,@DriverTypeId,0,@AddedById,GETUTCDATE())

				SET @Id = SCOPE_IDENTITY();
			END
		
		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END


GO


