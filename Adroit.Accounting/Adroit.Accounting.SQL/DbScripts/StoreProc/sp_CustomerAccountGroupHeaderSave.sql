CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountGroupHeaderSave]
(
	 @Id tinyint,
	 @UserId	INT,
	 @Title NVARCHAR(50),
	 @Active bit,
	 @OrderNumber tinyint
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		Declare @CustomerId int = dbo.fn_GetCustomerId(@UserId);

		IF EXISTS (SELECT 1 FROM CustomerAccountGroupHeader WHERE Id = @Id AND CustomerId = @CustomerId)
			BEGIN
				UPDATE  CustomerAccountGroupHeader SET
						Title = @Title,
						OrderNumber = @OrderNumber,
						Active = @active
					WHERE ID = @Id AND CustomerId = @CustomerId
			END
		ELSE If EXISTS (SELECT 1 FROM CustomerAccountGroupHeader WHERE Title = @Title AND Deleted = 1 AND CustomerId = @CustomerId)
			BEGIN
				UPDATE  CustomerAccountGroupHeader SET
						OrderNumber = @OrderNumber,
						Active = @Active,
						Deleted = 0
					WHERE Title = @Title  AND CustomerId = @CustomerId

				SELECT @Id=Id FROM CustomerAccountGroupHeader WHERE Title = @Title AND CustomerId = @CustomerId
			END
		ELSE 
			BEGIN
				INSERT INTO CustomerAccountGroupHeader
					([Title],[CustomerId], OrderNumber, Active)
				VALUES
					(@Title, @CustomerId, @OrderNumber, @Active)

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
			SET @message = 'Customer account group header ''' + @Title + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO