USE [master]
GO
/****** Object:  Database [UBSAG]    Script Date: 05/04/2024 11:55:49 ******/
CREATE DATABASE [UBSAG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UBSAG', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.LENOVOLP50\MSSQL\DATA\UBSAG.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UBSAG_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.LENOVOLP50\MSSQL\DATA\UBSAG_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UBSAG] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UBSAG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UBSAG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UBSAG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UBSAG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UBSAG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UBSAG] SET ARITHABORT OFF 
GO
ALTER DATABASE [UBSAG] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UBSAG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UBSAG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UBSAG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UBSAG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UBSAG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UBSAG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UBSAG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UBSAG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UBSAG] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UBSAG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UBSAG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UBSAG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UBSAG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UBSAG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UBSAG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UBSAG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UBSAG] SET RECOVERY FULL 
GO
ALTER DATABASE [UBSAG] SET  MULTI_USER 
GO
ALTER DATABASE [UBSAG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UBSAG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UBSAG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UBSAG] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UBSAG] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UBSAG] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'UBSAG', N'ON'
GO
ALTER DATABASE [UBSAG] SET QUERY_STORE = OFF
GO

USE [UBSAG]
GO
/****** Object:  Table [dbo].[tbBankAccounts]    Script Date: 05/04/2024 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbBankAccounts](
	[BankAccountId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BankAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tbCategories]    Script Date: 05/04/2024 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCategories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tbCategoryRules]    Script Date: 05/04/2024 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCategoryRules](
	[CategoryId] [int] NOT NULL,
	[OperatorId] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[SectorId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[OperatorId] ASC,
	[SectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tbClients]    Script Date: 05/04/2024 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbClients](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[SectorId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tbOperators]    Script Date: 05/04/2024 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbOperators](
	[OperatorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OperatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tbProcessingTrades]    Script Date: 05/04/2024 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbProcessingTrades](
	[ProcessingTradeId] [int] IDENTITY(1,1) NOT NULL,
	[TradeId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ProcessingDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProcessingTradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tbSectors]    Script Date: 05/04/2024 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSectors](
	[SectorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tbTrades]    Script Date: 05/04/2024 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbTrades](
	[TradeId] [int] IDENTITY(1,1) NOT NULL,
	[BankAccountId] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[Processed] [bit] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ProcessingDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Constraints    Script Date: 05/04/2024 11:55:49 ******/
ALTER TABLE [dbo].[tbCategoryRules]  WITH CHECK ADD  CONSTRAINT [FK_tbCategoryRules_tbCategories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[tbCategories] ([CategoryId])
GO
ALTER TABLE [dbo].[tbCategoryRules] CHECK CONSTRAINT [FK_tbCategoryRules_tbCategories]
GO
ALTER TABLE [dbo].[tbCategoryRules]  WITH CHECK ADD  CONSTRAINT [FK_tbCategoryRules_tbOperators] FOREIGN KEY([OperatorId])
REFERENCES [dbo].[tbOperators] ([OperatorId])
GO
ALTER TABLE [dbo].[tbCategoryRules] CHECK CONSTRAINT [FK_tbCategoryRules_tbOperators]
GO
ALTER TABLE [dbo].[tbCategoryRules]  WITH CHECK ADD  CONSTRAINT [FK_tbCategoryRules_tbSectors] FOREIGN KEY([SectorId])
REFERENCES [dbo].[tbSectors] ([SectorId])
GO
ALTER TABLE [dbo].[tbCategoryRules] CHECK CONSTRAINT [FK_tbCategoryRules_tbSectors]
GO
ALTER TABLE [dbo].[tbClients]  WITH CHECK ADD  CONSTRAINT [FK_tbClients_tbSectors] FOREIGN KEY([SectorId])
REFERENCES [dbo].[tbSectors] ([SectorId])
GO
ALTER TABLE [dbo].[tbClients] CHECK CONSTRAINT [FK_tbClients_tbSectors]
GO
ALTER TABLE [dbo].[tbProcessingTrades]  WITH CHECK ADD  CONSTRAINT [FK_tbProcessingTrades_tbCategories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[tbCategories] ([CategoryId])
GO
ALTER TABLE [dbo].[tbProcessingTrades] CHECK CONSTRAINT [FK_tbProcessingTrades_tbCategories]
GO
ALTER TABLE [dbo].[tbProcessingTrades]  WITH CHECK ADD  CONSTRAINT [FK_tbProcessingTrades_tbTrades] FOREIGN KEY([TradeId])
REFERENCES [dbo].[tbTrades] ([TradeId])
GO
ALTER TABLE [dbo].[tbProcessingTrades] CHECK CONSTRAINT [FK_tbProcessingTrades_tbTrades]
GO
ALTER TABLE [dbo].[tbTrades]  WITH CHECK ADD  CONSTRAINT [FK_tbTrades_tbBankAccounts] FOREIGN KEY([BankAccountId])
REFERENCES [dbo].[tbBankAccounts] ([BankAccountId])
GO
ALTER TABLE [dbo].[tbTrades] CHECK CONSTRAINT [FK_tbTrades_tbBankAccounts]
GO

/****** Object:  Inserts [dbo].[tbSectors]    Script Date: 05/04/2024 11:55:49 ******/
INSERT INTO [dbo].[tbSectors] ([Name],[Active],[CreationDate],[ChangeDate])
     VALUES ('Private',1,GETDATE(),GETDATE())
GO
INSERT INTO [dbo].[tbSectors] ([Name],[Active],[CreationDate],[ChangeDate])
     VALUES ('Public',1,GETDATE(),GETDATE())
GO

/****** Object:  Inserts [dbo].[tbCategories]    Script Date: 05/04/2024 11:55:49 ******/
INSERT INTO [dbo].[tbCategories] ([Name],[Active],[CreationDate],[ChangeDate])
     VALUES ('LOWRISK',1,GETDATE(),GETDATE())
GO
INSERT INTO [dbo].[tbCategories] ([Name],[Active],[CreationDate],[ChangeDate])
     VALUES ('MEDIUMRISK',1,GETDATE(),GETDATE())
GO
INSERT INTO [dbo].[tbCategories] ([Name],[Active],[CreationDate],[ChangeDate])
     VALUES ('HIGHRISK',1,GETDATE(),GETDATE())
GO

/****** Object:  Inserts [dbo].[tbOperators]    Script Date: 05/04/2024 11:55:49 ******/
INSERT INTO [dbo].[tbOperators] ([Name],[Active],[CreationDate],[ChangeDate])
     VALUES ('GREATER THAN',1,GETDATE(),GETDATE())
GO
INSERT INTO [dbo].[tbOperators] ([Name],[Active],[CreationDate],[ChangeDate])
     VALUES ('LESS THAN',1,GETDATE(),GETDATE())
GO

/****** Object:  Inserts [dbo].[tbCategoryRules]    Script Date: 05/04/2024 11:55:49 ******/
INSERT INTO [dbo].[tbCategoryRules] ([CategoryId],[OperatorId],[Amount],[SectorId],[Active],[CreationDate],[ChangeDate])
     VALUES (1,2,1000000,2,1,GETDATE(),GETDATE())
GO
INSERT INTO [dbo].[tbCategoryRules] ([CategoryId],[OperatorId],[Amount],[SectorId],[Active],[CreationDate],[ChangeDate])
     VALUES (2,1,1000000,2,1,GETDATE(),GETDATE())
GO
INSERT INTO [dbo].[tbCategoryRules] ([CategoryId],[OperatorId],[Amount],[SectorId],[Active],[CreationDate],[ChangeDate])
     VALUES (3,1,1000000,1,1,GETDATE(),GETDATE())
GO

/****** Object:  Inserts [dbo].[tbBankAccounts]    Script Date: 05/04/2024 11:55:49 ******/
INSERT INTO [dbo].[tbBankAccounts] ([Name],[Active],[CreationDate],[ChangeDate])
     VALUES ('BANK BOSTON',1,GETDATE(),GETDATE())
GO
INSERT INTO [dbo].[tbBankAccounts] ([Name],[Active],[CreationDate],[ChangeDate])
     VALUES ('BANK OF AMERICA',1,GETDATE(),GETDATE())
GO
INSERT INTO [dbo].[tbBankAccounts] ([Name],[Active],[CreationDate],[ChangeDate])
     VALUES ('CITIBANK',1,GETDATE(),GETDATE())
GO
INSERT INTO [dbo].[tbBankAccounts] ([Name],[Active],[CreationDate],[ChangeDate])
     VALUES ('DEUTSCHE BANK',1,GETDATE(),GETDATE())
GO

/****** Object:  Inserts [dbo].[tbClients]    Script Date: 05/04/2024 11:55:49 ******/
INSERT INTO [dbo].[tbClients] ([Name],[SectorId],[Active],[CreationDate],[ChangeDate])
     VALUES ('GOLDMAN SACKS CORP',1,1,GETDATE(),GETDATE())
GO
INSERT INTO [dbo].[tbClients] ([Name],[SectorId],[Active],[CreationDate],[ChangeDate])
     VALUES ('GOOGLE INC',1,1,GETDATE(),GETDATE())
GO
INSERT INTO [dbo].[tbClients] ([Name],[SectorId],[Active],[CreationDate],[ChangeDate])
     VALUES ('UDEMY CORP',1,1,GETDATE(),GETDATE())
GO
INSERT INTO [dbo].[tbClients] ([Name],[SectorId],[Active],[CreationDate],[ChangeDate])
     VALUES ('SHELL COMPANY',1,1,GETDATE(),GETDATE())
GO
INSERT INTO [dbo].[tbClients] ([Name],[SectorId],[Active],[CreationDate],[ChangeDate])
     VALUES ('GENERAL MOTORS INDUSTRIES',1,1,GETDATE(),GETDATE())
GO
INSERT INTO [dbo].[tbClients] ([Name],[SectorId],[Active],[CreationDate],[ChangeDate])
     VALUES ('MICHIGAN COUNTY',2,1,GETDATE(),GETDATE())
GO
INSERT INTO [dbo].[tbClients] ([Name],[SectorId],[Active],[CreationDate],[ChangeDate])
     VALUES ('NEW YORK COUNTY',2,1,GETDATE(),GETDATE())
GO
INSERT INTO [dbo].[tbClients] ([Name],[SectorId],[Active],[CreationDate],[ChangeDate])
     VALUES ('SAN DIEGO COUNTY',2,1,GETDATE(),GETDATE())
GO
INSERT INTO [dbo].[tbClients] ([Name],[SectorId],[Active],[CreationDate],[ChangeDate])
     VALUES ('LOS ANGELES COUNTY',2,1,GETDATE(),GETDATE())
GO
INSERT INTO [dbo].[tbClients] ([Name],[SectorId],[Active],[CreationDate],[ChangeDate])
     VALUES ('CONNECTICUT COUNTY',2,1,GETDATE(),GETDATE())
GO

/****** Object:  Inserts [dbo].[tbTrades]    Script Date: 05/04/2024 11:55:49 ******/
INSERT INTO [dbo].[tbTrades] ([BankAccountId],[ClientId],[Value],[Processed],[CreationDate])
     VALUES (1,1,2000000,0,GETDATE())
GO
INSERT INTO [dbo].[tbTrades] ([BankAccountId],[ClientId],[Value],[Processed],[CreationDate])
     VALUES (1,2,4000000,0,GETDATE())
GO
INSERT INTO [dbo].[tbTrades] ([BankAccountId],[ClientId],[Value],[Processed],[CreationDate])
     VALUES (1,7,5000000,0,GETDATE())
GO
INSERT INTO [dbo].[tbTrades] ([BankAccountId],[ClientId],[Value],[Processed],[CreationDate])
     VALUES (1,10,30000000,0,GETDATE())
GO
INSERT INTO [dbo].[tbTrades] ([BankAccountId],[ClientId],[Value],[Processed],[CreationDate])
     VALUES (1,5,8000000,0,GETDATE())
GO
INSERT INTO [dbo].[tbTrades] ([BankAccountId],[ClientId],[Value],[Processed],[CreationDate])
     VALUES (1,4,10000000,0,GETDATE())
GO
INSERT INTO [dbo].[tbTrades] ([BankAccountId],[ClientId],[Value],[Processed],[CreationDate])
     VALUES (1,1,2000000,0,GETDATE())
GO
INSERT INTO [dbo].[tbTrades] ([BankAccountId],[ClientId],[Value],[Processed],[CreationDate])
     VALUES (3,1,12000000,0,GETDATE())
GO
INSERT INTO [dbo].[tbTrades] ([BankAccountId],[ClientId],[Value],[Processed],[CreationDate])
     VALUES (3,3,500000,0,GETDATE())
GO
INSERT INTO [dbo].[tbTrades] ([BankAccountId],[ClientId],[Value],[Processed],[CreationDate])
     VALUES (2,10,300000,0,GETDATE())
GO
INSERT INTO [dbo].[tbTrades] ([BankAccountId],[ClientId],[Value],[Processed],[CreationDate])
     VALUES (2,3,8500000,0,GETDATE())
GO
INSERT INTO [dbo].[tbTrades] ([BankAccountId],[ClientId],[Value],[Processed],[CreationDate])
     VALUES (4,8,19000000,0,GETDATE())
GO

/****** Object:  StoredProcedure [dbo].[spCategoryDelete]    Script Date: 05/04/2024 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[spCategoryDelete]
    @CategoryName VARCHAR(50)
AS
BEGIN
	/****************************************************************************************************************
	SISTEMA    : TRADE
	SUBROTINA  : EXCLUSAO DE REGRAS DE CATEGORIZACAO
	DB         : UBSAG
	AUTOR      : ALEXANDER ANDRADE
	DATA       : 05/04/2024
	DESCRIÇÃO  : EXCLUI UMA REGRA DE CATEGORIZACAO DE TRADE
	*****************************************************************************************************************/
	DECLARE @CategoryId INT

	SELECT @CategoryId = CategoryId FROM dbo.tbCategories WHERE Active = 1 AND Name = @CategoryName

	IF @CategoryId IS NOT NULL
	BEGIN
		UPDATE dbo.tbCategories
		SET Active = 0,
			ChangeDate = GETDATE()
		WHERE CategoryId = @CategoryId

		UPDATE dbo.tbCategoryRules
		SET Active = 0,
			ChangeDate = GETDATE()
		WHERE CategoryId = @CategoryId
	END

	SELECT * FROM dbo.tBCategories WHERE Active = 1
END
GO

/****** Object:  StoredProcedure [dbo].[spCategoryEditCreate]    Script Date: 05/04/2024 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[spCategoryEditCreate]
    @CategoryName VARCHAR(50),
    @OperatorName VARCHAR(50),
    @Amount DECIMAL(18,2),
    @SectorName VARCHAR(50)
AS

	/****************************************************************************************************************
	SISTEMA    : TRADE
	SUBROTINA  : ALTERACAO OU CRIACAO DE REGRAS DE CATEGORIZACAO
	DB         : UBSAG
	AUTOR      : ALEXANDER ANDRADE
	DATA       : 05/04/2024
	DESCRIÇÃO  : ALTERA OU CRIA UMA REGRA DE CATEGORIZACAO DE TRADE
	*****************************************************************************************************************/
    DECLARE @CategoryId INT, @OperatorId INT, @SectorId INT;

    SELECT @CategoryId = CategoryId FROM dbo.tbCategories WHERE Name = @CategoryName;

	BEGIN TRAN

    IF @CategoryId IS NULL
    BEGIN
        INSERT INTO dbo.tbCategories (Name, Active, CreationDate, ChangeDate)
        VALUES (@CategoryName, 1, GETDATE(), GETDATE());
        SET @CategoryId = SCOPE_IDENTITY();
    END

    SELECT @OperatorId = OperatorId FROM dbo.tbOperators WHERE Name = @OperatorName;
	
	IF @OperatorId IS NULL
	    BEGIN
        RAISERROR('Operador inexistente.', 16, 1);
		ROLLBACK TRAN  
		RETURN  
    END

    SELECT @SectorId = SectorId FROM dbo.tbSectors WHERE Name = @SectorName;
	IF @SectorId IS NULL
	    BEGIN
        RAISERROR('Setor inexistente.', 16, 1);
		ROLLBACK TRAN  
		RETURN  
    END

    IF EXISTS (
        SELECT * FROM dbo.tbCategoryRules
        WHERE CategoryId = @CategoryId
    )
    BEGIN
	    IF EXISTS (
        SELECT * FROM dbo.tbCategoryRules
        WHERE CategoryId = @CategoryId
		AND OperatorId = @OperatorId
		AND SectorId = @SectorId
		)
		BEGIN
			UPDATE dbo.tbCategoryRules
			SET Amount = @Amount,
				ChangeDate = GETDATE()
			WHERE CategoryId = @CategoryId;
		END
		ELSE
		BEGIN
			UPDATE dbo.tbCategoryRules
			SET OperatorId = @OperatorId,
				SectorId = @SectorId,
				Amount = @Amount,
				ChangeDate = GETDATE()
			WHERE CategoryId = @CategoryId;
		END
    END
    ELSE
    BEGIN
        INSERT INTO dbo.tbCategoryRules (CategoryId, OperatorId, Amount, SectorId, Active, CreationDate, ChangeDate)
        VALUES (@CategoryId, @OperatorId, @Amount, @SectorId, 1, GETDATE(), GETDATE());
    END

	IF @@ERROR <> 0  
	BEGIN  
		ROLLBACK TRAN  
		RETURN  
	END  
  
	COMMIT TRAN

	SELECT  cat.Name AS [Category]
		   ,opr.Name AS [Operator]
		   ,rls.Amount
		   ,sec.Name AS [Sector]
		   ,rls.Active
	  FROM dbo.tbCategoryRules rls
	  JOIN dbo.tbCategories cat ON (rls.CategoryId = cat.CategoryId AND cat.Active = 1)
	  JOIN dbo.tbOperators opr ON rls.OperatorId = opr.OperatorId
	  JOIN dbo.tbSectors sec ON rls.SectorId = sec.SectorId
	 
RETURN
GO

/****** Object:  StoredProcedure [dbo].[spTradeCategoring]    Script Date: 05/04/2024 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[spTradeCategoring] (
	@Value		DECIMAL(18,2),
	@SectorId		INT,
	@CategoryOut	INT OUTPUT
	) AS

	/****************************************************************************************************************
	SISTEMA    : TRADE
	SUBROTINA  : CATEGORIZACAO TRADE
	DB         : UBSAG
	AUTOR      : ALEXANDER ANDRADE
	DATA       : 04/04/2024
	DESCRIÇÃO  : CATEGORIZAR AS OPERACOES DE TRADE
	*****************************************************************************************************************/
	SET @CategoryOut = 0

	DECLARE
	@CategoryId	INT,
	@OperatorId INT,
	@Amount DECIMAL(18,2)

	DECLARE rules_cursor CURSOR FOR
	SELECT CategoryId, OperatorId, Amount
	  FROM dbo.tbCategoryRules
	 WHERE SectorId = @SectorId

	OPEN rules_cursor

	FETCH NEXT FROM rules_cursor
	INTO @CategoryId, @OperatorId, @Amount

	WHILE @@FETCH_STATUS = 0  
	BEGIN
		IF(@OperatorId = 1 AND @Value > @Amount)
		BEGIN
			SET @CategoryOut = @CategoryId
		END
		ELSE IF(@OperatorId = 2 AND @Value < @Amount)
		BEGIN
			SET @CategoryOut = @CategoryId
		END

		FETCH NEXT FROM rules_cursor
		INTO @CategoryId, @OperatorId, @Amount
	END   

	CLOSE rules_cursor;
	DEALLOCATE rules_cursor;

RETURN
GO

/****** Object:  StoredProcedure [dbo].[spTradeProcessing]    Script Date: 05/04/2024 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[spTradeProcessing] (
	@BankAccountId	INT = 0
	) AS

	/****************************************************************************************************************
	SISTEMA    : TRADE
	SUBROTINA  : PROCESSAMENTO TRADES POR BANCO
	DB         : UBSAG
	AUTOR      : ALEXANDER ANDRADE
	DATA       : 04/04/2024
	DESCRIÇÃO  : PROCESSR TODAS AS OPERACOES DE TRADE POR BANCO, QUANDO INFORMADO OU TODAS QUANDO NÃO FOR INFORMADO
	*****************************************************************************************************************/

	DECLARE
	@TradeId INT,
	@SectorId INT,
	@CategoryId INT,
	@Value DECIMAL(18,2)

	IF(@BankAccountId = 0)
	BEGIN
		DECLARE process_cursor CURSOR FOR
		SELECT trd.TradeId, cli.SectorId, trd.Value
		  FROM dbo.tbTrades trd
		  JOIN dbo.tbClients cli ON trd.ClientId = cli.ClientId
		 WHERE trd.Processed = 0
	END
	ELSE
	BEGIN
		DECLARE process_cursor CURSOR FOR
		SELECT trd.TradeId, cli.SectorId, trd.Value
		  FROM dbo.tbTrades trd
		  JOIN dbo.tbClients cli ON trd.ClientId = cli.ClientId
		 WHERE trd.Processed = 0
		   AND trd.BankAccountId = @BankAccountId
	END

	OPEN process_cursor

	FETCH NEXT FROM process_cursor
	INTO @TradeId, @SectorId, @Value

	BEGIN TRAN

	WHILE @@FETCH_STATUS = 0  
	BEGIN
		EXEC dbo.spTradeCategoring @Value, @SectorId, @CategoryId OUTPUT

		INSERT INTO [dbo].[tbProcessingTrades] ([TradeId], [CategoryId], [ProcessingDate])
			 VALUES (@TradeId, @CategoryId, GETDATE())

		UPDATE dbo.tbTrades
		   SET Processed = 1, ProcessingDate = GETDATE()
		 WHERE TradeId = @TradeId

		FETCH NEXT FROM process_cursor
		INTO @TradeId, @SectorId, @Value
	END   

	CLOSE process_cursor;
	DEALLOCATE process_cursor;

	IF @@ERROR <> 0  
	BEGIN  
		ROLLBACK TRAN  
		RETURN  
	END  
  
	COMMIT TRAN  

	IF(@BankAccountId = 0)
	BEGIN
		SELECT prc.ProcessingTradeId, trd.TradeId, bnk.Name AS [Bank], trd.Value, sec.Name AS [Sector], cat.Name AS [Category], prc.ProcessingDate
		  FROM dbo.tbProcessingTrades prc
		  JOIN dbo.tbTrades trd ON prc.TradeId = trd.TradeId
		  JOIN dbo.tbCategories cat ON prc.CategoryId = cat.CategoryId
		  JOIN dbo.tbBankAccounts bnk ON trd.BankAccountId = bnk.BankAccountId
		  JOIN dbo.tbClients cli ON trd.ClientId = cli.ClientId
		  JOIN dbo.tbSectors sec ON cli.SectorId = sec.SectorId
	END
	BEGIN
		SELECT prc.ProcessingTradeId, trd.TradeId, bnk.Name AS [Bank], trd.Value, sec.Name AS [Sector], cat.Name AS [Category], prc.ProcessingDate
		  FROM dbo.tbProcessingTrades prc
		  JOIN dbo.tbTrades trd ON prc.TradeId = trd.TradeId
		  JOIN dbo.tbCategories cat ON prc.CategoryId = cat.CategoryId
		  JOIN dbo.tbBankAccounts bnk ON trd.BankAccountId = bnk.BankAccountId
		  JOIN dbo.tbClients cli ON trd.ClientId = cli.ClientId
		  JOIN dbo.tbSectors sec ON cli.SectorId = sec.SectorId
		 WHERE trd.BankAccountId = @BankAccountId
	END

RETURN
GO
USE [master]
GO
ALTER DATABASE [UBSAG] SET  READ_WRITE 
GO
