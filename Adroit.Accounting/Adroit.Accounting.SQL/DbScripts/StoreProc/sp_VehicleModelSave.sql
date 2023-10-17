CREATE OR ALTER PROCEDURE [dbo].[sp_VehicleModelSave]
(
	 @Id smallint,
	 @Title VARCHAR(100),
	 @Active bit,
	 @OrderNumber smallint,
	 @AddedById int,
	 @AddedByOn datetime,
	 @ModifiedById int,
	 @ModifiedOn datetime
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM VehicleModel WHERE Id = @Id)
			BEGIN
				UPDATE  VehicleModel SET
						Title = @Title,
						OrderNumber = @OrderNumber,
						Active = @active
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM VehicleModel WHERE Title = @Title AND Deleted = 1)
			BEGIN
				UPDATE  VehicleModel SET
						OrderNumber = @OrderNumber,
						Active = @Active,
						Deleted = 0
					WHERE Title = @Title

				SELECT @Id=Id FROM VehicleModel WHERE Title = @Title
			END
		ELSE 
			BEGIN
				INSERT INTO VehicleModel
					([Title], OrderNumber, Active)
				VALUES
					(@Title, @OrderNumber, @Active)

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
			SET @message = 'Vehicle model ''' + @Title + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO