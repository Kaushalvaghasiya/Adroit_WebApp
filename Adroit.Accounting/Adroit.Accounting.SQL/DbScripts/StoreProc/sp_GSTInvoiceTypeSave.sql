CREATE OR ALTER PROCEDURE [dbo].[sp_GSTInvoiceTypeSave]
(
	 @Id tinyint,
	 @Title nvarchar(40),	
	 @TitleB2B nvarchar(40),	
	 @TitleEinvoice nvarchar(10),
	 @TitleCDNUR nvarchar(10),
	 @PayType nvarchar(10),
	 @OrderNumber tinyint,
	 @Active bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM GSTInvoiceType WHERE Id = @Id)
			BEGIN
				UPDATE  GSTInvoiceType SET
						Title = @Title,
						TitleB2B = @TitleB2B,
						TitleEinvoice = @TitleEinvoice,
						TitleCDNUR = @TitleCDNUR,
						PayType = @PayType,
						OrderNumber = @OrderNumber,
						Active = @active
					WHERE ID = @Id
			END		
		ELSE
			BEGIN
				INSERT INTO GSTInvoiceType
					(Title, TitleB2B, TitleEinvoice, TitleCDNUR, PayType, OrderNumber, Active)
				VALUES
					(@Title, @TitleB2B, @TitleEinvoice, @TitleCDNUR, @PayType, @OrderNumber, @Active)

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
			SET @message = 'Invoice type ''' + @Title + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO