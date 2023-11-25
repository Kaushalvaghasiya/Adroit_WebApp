CREATE OR ALTER PROCEDURE [dbo].[sp_TransportLRBranchCityMappingSave]
(
	 @Id int,
	 @loginId int,
	 @firmId int,
	 @BranchId int,
	 @CityId int,
	 @Active bit,
	 @OrderNumber int
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY

		IF EXISTS (SELECT 1 FROM TransportLRBranchCityMapping WHERE Id = @Id)
			BEGIN
				UPDATE  TransportLRBranchCityMapping SET
						BranchId = @BranchId,
						CityId = @CityId,
						OrderNumber = @OrderNumber,
						Active = @active
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM TransportLRBranchCityMapping WHERE CityId = @CityId AND Deleted = 1)
			BEGIN
				UPDATE  TransportLRBranchCityMapping SET
						BranchId = @BranchId,
						CityId = @CityId,
						OrderNumber = @OrderNumber,
						Active = @Active,
						Deleted = 0
					WHERE OrderNumber = @OrderNumber

				SELECT @Id=Id FROM TransportLRBranchCityMapping WHERE CityId = @CityId
			END
		ELSE 
			BEGIN
				INSERT INTO TransportLRBranchCityMapping
					(OrderNumber,BranchId,CityId,Active,Deleted,AddedById,AddedOn)
				VALUES
					(@OrderNumber,@BranchId,@CityId,@Active,0,@loginId,GETUTCDATE())

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
			SET @message = 'TransportLRBranchCityMapping ''' + @OrderNumber + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END


