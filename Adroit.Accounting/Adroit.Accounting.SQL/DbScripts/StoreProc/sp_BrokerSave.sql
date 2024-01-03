CREATE OR ALTER PROCEDURE [dbo].[sp_BrokerSave]
(
	@Id					INT,
	@UserId				INT,
	@Name				NVARCHAR(50),
	@Address			NVARCHAR(150),
	@CityId				INT,
	@Pincode			VARCHAR(10),
	@ContactPersonName	NVARCHAR (50),
	@Mobile				VARCHAR (15),
	@MobileAlternate	VARCHAR (15),
    @Email				VARCHAR (50),
	@Brokerage			DECIMAL (16, 2),
	@OwnerBranchId		INT,
	@AdharUID			VARCHAR (12),
	@Active				BIT,
	@AddedById			INT,
	@ModifiedById		INT,
	@CustomerBrokerBranchIds NVARCHAR(MAX)
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);
		
		IF EXISTS (SELECT 1 FROM [Broker] WHERE Id = @Id And CustomerId = @CustomerId)
			BEGIN
					UPDATE [Broker] SET
					CustomerId = @CustomerId,
					Name = @Name,
					Address = @Address,
					CityId = @CityId,
					Pincode = @Pincode,
					ContactPersonName = @ContactPersonName,
					Mobile =@Mobile,
					MobileAlternate =@MobileAlternate,
					Email = @Email,
					Brokerage = @Brokerage,
					OwnerBranchId = @OwnerBranchId,
					AdharUID = @AdharUID,
					Active = @Active, 
					ModifiedById = @ModifiedById, 
					ModifiedOn = GETUTCDATE()
					WHERE Id = @Id And CustomerId = @CustomerId

					UPDATE  CustomerBrokerBranchMapping SET
						DeletedById = @UserId,
						DeletedOn = GETUTCDATE(),
						Deleted = 1
					WHERE BrokerId = @Id AND [BranchId] NOT IN ( SELECT Id FROM dbo.[fnStringToIntArray](@CustomerBrokerBranchIds))

					UPDATE  CustomerBrokerBranchMapping SET
							DeletedById = NULL,
							DeletedOn = NULL,
							Deleted = 0
					WHERE BrokerId = @Id AND [BranchId] IN ( SELECT Id FROM dbo.[fnStringToIntArray](@CustomerBrokerBranchIds))
			END
		ELSE
			BEGIN
				INSERT INTO [Broker] (
					CustomerId,[Name],[Address],CityId,Pincode,ContactPersonName,Mobile,MobileAlternate,Email,Brokerage,AddedById,AddedOn,
					OwnerBranchId,AdharUID,Active)
				VALUES (
					@CustomerId,@Name,@Address,@CityId,@Pincode,@ContactPersonName,@Mobile,@MobileAlternate,@Email,@Brokerage,@AddedById,GETUTCDATE(),
					@OwnerBranchId,@AdharUID,@Active)

				SET @Id = SCOPE_IDENTITY();
			END
		INSERT INTO [CustomerBrokerBranchMapping] (BrokerId,BranchId,AddedById,AddedOn)
		SELECT @Id,Id,@UserId,GETUTCDATE()
		FROM dbo.[fnStringToIntArray](@CustomerBrokerBranchIds)
		EXCEPT
		SELECT BrokerId,BranchId,@UserId,GETUTCDATE() 
		FROM [dbo].[CustomerBrokerBranchMapping]
		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN
		IF (@message LIKE '%IX_Broker%')
		BEGIN
			SET @message = 'Broker name ''' + @Name + ''' already exist!';
		END

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END


GO


