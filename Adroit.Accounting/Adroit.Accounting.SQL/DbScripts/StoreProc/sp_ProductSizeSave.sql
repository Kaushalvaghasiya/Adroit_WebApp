CREATE OR ALTER PROCEDURE [dbo].[sp_ProductSizeSave]
(
	 @Id int,
	 @UserId int,
	 @Title VARCHAR(100),
	 @OrderNumber tinyint,
	 @AddedById int,
	 @ModifiedById int,
	 @Active bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);

		IF EXISTS (SELECT 1 FROM ProductSize WHERE Id = @Id And CustomerId = @CustomerId)
			BEGIN
				UPDATE  ProductSize SET
						Title = @Title,
						OrderNumber = @OrderNumber,
						ModifiedById = @ModifiedById, 
						ModifiedOn = GETUTCDATE(),
						Active = @active
					WHERE ID = @Id And CustomerId = @CustomerId
			END
		ELSE If EXISTS (SELECT 1 FROM ProductSize WHERE [Title] = @Title AND Deleted = 1 And CustomerId = @CustomerId)
			BEGIN
				UPDATE  ProductSize SET
						Active = @Active,
						Deleted = 0
					WHERE Title = @Title

				SELECT @Id=Id FROM ProductSize WHERE [Title] = @Title
			END
		ELSE
			BEGIN
				INSERT INTO ProductSize
					(CustomerId, Title, OrderNumber, Active, AddedById, AddedOn)
				VALUES
					(@CustomerId, @Title, @OrderNumber, @Active, @AddedById, GETUTCDATE())

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
			SET @message = 'Product size ''' + @Title + ''' already exist!';
		END
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END