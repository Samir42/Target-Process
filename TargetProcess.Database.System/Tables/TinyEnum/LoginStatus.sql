CREATE TABLE [TinyEnum].[LoginStatus]
(
	ID TINYINT PRIMARY KEY,	
	[Name] VARCHAR(128) NOT NULL,
	[Description] NVARCHAR(512) DEFAULT NULL,
	CONSTRAINT c_LoginStatus_Name_Unique UNIQUE ([Name])
)
