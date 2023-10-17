CREATE OR ALTER PROCEDURE [dbo].[sp_TransportDescSave]
(
	 @Id int,
	 @CustomerId int,
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
		IF EXISTS (SELECT 1 FROM TransportDesc WHERE Id = @Id)
			BEGIN
				UPDATE  TransportDesc SET
						CustomerId = @CustomerId,
						Title = @Title,
						OrderNumber = @OrderNumber,
						ModifiedById = @ModifiedById, 
						ModifiedOn = GETUTCDATE(),
						Active = @active
					WHERE ID = @Id
			END
		ELSE
			BEGIN
				INSERT INTO TransportDesc
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
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END