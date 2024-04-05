USE UBSAG
GO

/**** Validando categorização ****/
DECLARE
	 @CategoryId INT
	,@Value		DECIMAL(18,2) = 2000000
	,@Sector	INT = 1

EXEC dbo.spTradeCategoring @Value, @Sector, @CategoryId OUTPUT

SELECT Name FROM dbo.tbCategories WHERE CategoryId = @CategoryId
GO

/**** Validando processamento trades por banco ****/
DECLARE
	 @BankAccountId INT = 1

EXEC dbo.spTradeProcessing @BankAccountId
GO

/**** Validando criação e edição de categorias ****/
DECLARE
	 @CategoryName	VARCHAR(50)		= 'CUSTOMRISK'
	,@OperatorName	VARCHAR(50)		= 'LESS THAN'
	,@Amount		DECIMAL(18,2)	= 700000
	,@SectorName	VARCHAR(50)		= 'PRIVATE' 

EXEC dbo.spCategoryEditCreate @CategoryName, @OperatorName, @Amount, @SectorName
GO

/**** Validando exclusão de categorias ****/
DECLARE
	 @CategoryName	VARCHAR(50)		= 'CUSTOMRISK'

EXEC dbo.spCategoryDelete @CategoryName
GO

/*
SELECT * FROM dbo.tbSectors
GO

SELECT * FROM dbo.tbOperators
GO

SELECT * FROM dbo.tBCategories
GO

SELECT * FROM dbo.tBCategoryRules
GO

SELECT * FROM dbo.tbBankAccounts
GO

SELECT * FROM dbo.tbClients
GO

SELECT * FROM dbo.tbTrades
GO

SELECT * FROM dbo.tbProcessingTrades
GO

SELECT  cat.Name AS [Category]
	   ,opr.Name AS [Operator]
	   ,rls.Amount
	   ,sec.Name AS [Sector]
	   ,rls.Active
  FROM dbo.tbCategoryRules rls
  JOIN dbo.tbCategories cat ON rls.CategoryId = cat.CategoryId
  JOIN dbo.tbOperators opr ON rls.OperatorId = opr.OperatorId
  JOIN dbo.tbSectors sec ON rls.SectorId = sec.SectorId
 WHERE rls.Active = 1
GO
*/
