CREATE OR ALTER PROCEDURE [dbo].[sp_GSTRateSave]
(
	 @Id tinyint,
	 @Rate decimal(15, 3),
	 @OrderNumber tinyint,
	 @Active bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM GSTRate WHERE Id = @Id)
			BEGIN
				UPDATE  GSTRate SET
						Rate = @Rate,
						OrderNumber = @OrderNumber,
						Active = @active
					WHERE ID = @Id
			END		
		ELSE
			BEGIN
				INSERT INTO GSTRate
					(Rate, OrderNumber, Active)
				VALUES
					(@Rate, @OrderNumber, @Active)

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
			SET @message = 'Rate ''' + @Rate + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO