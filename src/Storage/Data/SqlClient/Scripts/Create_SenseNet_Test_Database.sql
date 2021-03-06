USE [master]
GO

/****** DROP DATABASE: [SenseNetContentRepository_test] ******/
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'SenseNetContentRepository_test')
BEGIN
	/****** Restricts access to this database to only one user at a time  ******/
	ALTER DATABASE [SenseNetContentRepository_test] SET SINGLE_USER WITH ROLLBACK IMMEDIATE 
	ALTER DATABASE [SenseNetContentRepository_test] SET MULTI_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE [SenseNetContentRepository_test]
END 
go
/****** CREATE DATABASE: [SenseNetContentRepository_test] ******/
CREATE DATABASE [SenseNetContentRepository_test] ON  PRIMARY 
( NAME = N'SenseNetContentRepository_test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\SenseNetContentRepository_test.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SenseNetContentRepository_test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\SenseNetContentRepository_test_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
EXEC dbo.sp_dbcmptlevel @dbname=N'SenseNetContentRepository_test', @new_cmptlevel=90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SenseNetContentRepository_test].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
EXEC sp_fulltext_database enable
GO
ALTER DATABASE [SenseNetContentRepository_test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET ARITHABORT OFF 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET  READ_WRITE 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET RECOVERY FULL 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET  MULTI_USER 
GO
ALTER DATABASE [SenseNetContentRepository_test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SenseNetContentRepository_test] SET DB_CHAINING OFF