CREATE OR ALTER PROCEDURE [dbo].[sp_ProductQualityTypeSave]
(
	 @Id int,
	 @Title VARCHAR(50),
	 @OrderNumber int,
	 @Active bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM ProductQualityType WHERE Id = @Id)
			BEGIN
				UPDATE  ProductQualityType SET
						Title = @Title,
						OrderNumber = @OrderNumber,
						Active = @active
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM ProductQualityType WHERE Title = @Title AND IsDeleted = 1)
			BEGIN
				UPDATE  ProductQualityType SET
						OrderNumber = @OrderNumber,
						Active = @active,
						IsDeleted = 0
					WHERE Title = @Title 

				SELECT @Id=Id FROM ProductQualityType WHERE Title = @Title 
			END
		ELSE
			BEGIN
				INSERT INTO ProductQualityType
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
			SET @message = 'Quality type ''' + @Title + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO