ALTER TABLE SoftwarePlan ADD CONSTRAINT UC_SoftwareId_Title UNIQUE ([SoftwareId], [Title]);
GO
ALTER TABLE SoftwarePlan ADD CONSTRAINT UC_Code UNIQUE ([Code]);
GO