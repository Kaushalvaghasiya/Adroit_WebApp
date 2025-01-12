CREATE OR ALTER PROCEDURE [dbo].[sp_TransportPackingSave]
(
	 @Id int,
	 @UserId int,
	 @Title VARCHAR(30),
	 @Active bit = 1,
	 @OrderNumber int,
	 @AddedById int = NULL,
	 @ModifiedById INT = NULL
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);

		IF EXISTS (SELECT 1 FROM TransportPacking WHERE Id = @Id)
			BEGIN
				UPDATE  TransportPacking SET
						Title = @Title,
						OrderNumber = @OrderNumber,
						CustomerId = @CustomerId,
						Active = @active,
						ModifiedById = @ModifiedById, 
						ModifiedOn = GETUTCDATE()
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM TransportPacking WHERE Title = @Title AND Deleted = 1)
			BEGIN
				UPDATE  TransportPacking SET
						OrderNumber = @OrderNumber,
						Active = @Active,
						CustomerId = @CustomerId,
						Deleted = 0,
						ModifiedById = @ModifiedById, 
						ModifiedOn = GETUTCDATE()
					WHERE Title = @Title

				SELECT @Id=Id FROM TransportPacking WHERE Title = @Title
			END
		ELSE 
			BEGIN
				INSERT INTO TransportPacking
					([Title], OrderNumber, Active,CustomerId,Deleted,AddedById,AddedOn)
				VALUES
					(@Title, @OrderNumber, @Active,@CustomerId,0,@AddedById,GETUTCDATE())

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
			SET @message = 'TransportPacking ''' + @Title + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END


