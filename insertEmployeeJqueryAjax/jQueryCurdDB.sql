USE [master]
GO
/****** Object:  Database [JQueryDB]    Script Date: 27/07/2019 6:43:12 PM ******/
CREATE DATABASE [JQueryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JQueryDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.CALLISTO\MSSQL\DATA\JQueryDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JQueryDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.CALLISTO\MSSQL\DATA\JQueryDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JQueryDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JQueryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JQueryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JQueryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JQueryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JQueryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JQueryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [JQueryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JQueryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JQueryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JQueryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JQueryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JQueryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JQueryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JQueryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JQueryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JQueryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JQueryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JQueryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JQueryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JQueryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JQueryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JQueryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JQueryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JQueryDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JQueryDB] SET  MULTI_USER 
GO
ALTER DATABASE [JQueryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JQueryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JQueryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JQueryDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [JQueryDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [JQueryDB]
GO
/****** Object:  Table [dbo].[tbl_AddNewEmployee]    Script Date: 27/07/2019 6:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AddNewEmployee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[Salary] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_AddNewEmployee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbl_AddNewEmployee] ON 

INSERT [dbo].[tbl_AddNewEmployee] ([ID], [Name], [Gender], [Phone], [Email], [Age], [Salary]) VALUES (1, N'Naushad Sayyed', N'Male', N'8446611769', N'naushad.ali@gmail.com', 30, N'12000')
INSERT [dbo].[tbl_AddNewEmployee] ([ID], [Name], [Gender], [Phone], [Email], [Age], [Salary]) VALUES (2, N'Naushad Sayyed', N'Male', N'8446611767', N'naushad.ali@gmail.com', 28, N'12000')
INSERT [dbo].[tbl_AddNewEmployee] ([ID], [Name], [Gender], [Phone], [Email], [Age], [Salary]) VALUES (3, N'Sumit Satpute', N'Male', N'8446423288', N'sumitsatpute21@gmail.com', 27, N'20000')
INSERT [dbo].[tbl_AddNewEmployee] ([ID], [Name], [Gender], [Phone], [Email], [Age], [Salary]) VALUES (4, N'Sumit Satputee', N'Male', N'8446423288', N'sumitsatpute21@gmail.com', 27, N'20000')
INSERT [dbo].[tbl_AddNewEmployee] ([ID], [Name], [Gender], [Phone], [Email], [Age], [Salary]) VALUES (5, N'Mayur Wanjari', N'Male', N'9766007784', N'mayur1984@gmail.com', 30, N'25000')
SET IDENTITY_INSERT [dbo].[tbl_AddNewEmployee] OFF
/****** Object:  StoredProcedure [dbo].[spAddNewEmployee]    Script Date: 27/07/2019 6:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddNewEmployee](@Name varchar(100),@Gender varchar(100),@Phone varchar(100),@Email varchar(100),@Age int,@Salary varchar(100))
AS 
BEGIN 

IF EXISTS(SELECT 'True' FROM tbl_AddNewEmployee WHERE Name = @Name and Phone = @Phone)
BEGIN
  --This means it exists, return it to ASP and tell us
  SELECT 'This record already exists!'
END
ELSE
	BEGIN
	INSERT INTO tbl_AddNewEmployee(Name,Gender,Phone,Email,Age,Salary) VALUES(@Name,@Gender,@Phone,@Email,@Age,@Salary) 
	END 
END

GO
USE [master]
GO
ALTER DATABASE [JQueryDB] SET  READ_WRITE 
GO
