CREATE OR ALTER PROCEDURE [dbo].[sp_VehicleOwnerSave]
(
	 @Id smallint,
	 @UserId int,
	 @Name VARCHAR(70),
	 @Address NVARCHAR(150),
	 @CityId int,
	 @PinCode varchar(10),
	 @Mobile varchar(15),
	 @PAN varchar(12),
	 @AdharUID varchar(12),
	 @AccountId int,
	 @Active bit,
	 @AddedById int,
	 @ModifiedById int
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		
		Declare @CustomerId int = dbo.fn_GetCustomerId(@UserId);

		DECLARE @TalukaId INT
		SELECT @TalukaId = City.TalukaId from City WHERE City.Id = @CityId;

		DECLARE @DistrictId INT
		SELECT @DistrictId = Taluka.DistrictId from Taluka WHERE Taluka.Id = @TalukaId;

		DECLARE @StateId INT
		SELECT @StateId = District.StateId from District WHERE District.Id = @DistrictId;

		IF EXISTS (SELECT 1 FROM VehicleOwner WHERE Id = @Id And CustomerId = @CustomerId)
			BEGIN
				UPDATE  VehicleOwner SET
						[Name] = @Name,
						[Address] = @Address,
						CityId = @CityId,
						StateId = @StateId,
						PinCode = @PinCode,
						Mobile = @Mobile,
						PAN = @PAN,
						AdharUID = @AdharUID,
						AccountId = @AccountId,
						Active = @Active,
						ModifiedById = ModifiedById,
						ModifiedOn = GETUTCDATE()
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM VehicleOwner WHERE [Name] = @Name AND Deleted = 1 And CustomerId = @CustomerId)
			BEGIN
				UPDATE  VehicleOwner SET
						Active = @Active,
						Deleted = 0
					WHERE [Name] = @Name

				SELECT @Id=Id FROM VehicleOwner WHERE [Name] = @Name
			END
		ELSE 
			BEGIN
				INSERT INTO VehicleOwner
					(CustomerId,[Name],[Address],CityId,StateId,Pincode,Mobile,PAN,AccountId,AdharUID,Active, AddedById, AddedOn)
				VALUES
					(@CustomerId,@Name,@Address,@CityId,@StateId,@Pincode,@Mobile,@PAN,@AccountId,@AdharUID,@Active,@AddedById,GETUTCDATE())

				SET @Id = SCOPE_IDENTITY()
			END
		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN
		IF (@message LIKE '%Violation of UNIQUE KEY%')
		BEGIN
			SET @message = 'Vehicle owner ''' + @Name + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO