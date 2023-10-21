CREATE OR ALTER PROCEDURE [dbo].[sp_TransportLRChargesSave]
(
	 @Id TINYINT,
	 @Title VARCHAR(30),
	 @OrderNumber TINYINT,
	 @Active bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM TransportLRCharges WHERE Id = @Id)
			BEGIN
				UPDATE  TransportLRCharges SET
						Title = @Title,
						OrderNumber = @OrderNumber,
						Active = @active
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM TransportLRCharges WHERE Title = @Title AND Deleted = 1)
			BEGIN
				UPDATE  TransportLRCharges SET
						OrderNumber = @OrderNumber,
						Active = @active,
						Deleted = 0
					WHERE Title = @Title 

				SELECT @Id=Id FROM TransportLRCharges WHERE Title = @Title 
			END
		ELSE
			BEGIN
				INSERT INTO TransportLRCharges
					(Title, OrderNumber, Active)
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
			SET @message = 'LR Charge ''' + @Title + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO