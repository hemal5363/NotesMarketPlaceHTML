USE [master]
GO
/****** Object:  Database [Notes-MarketPlace]    Script Date: 01-04-2021 06:16:47 PM ******/
CREATE DATABASE [Notes-MarketPlace]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Notes-MarketPlace', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Notes-MarketPlace.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Notes-MarketPlace_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Notes-MarketPlace_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Notes-MarketPlace] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Notes-MarketPlace].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Notes-MarketPlace] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET ARITHABORT OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Notes-MarketPlace] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Notes-MarketPlace] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Notes-MarketPlace] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Notes-MarketPlace] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET RECOVERY FULL 
GO
ALTER DATABASE [Notes-MarketPlace] SET  MULTI_USER 
GO
ALTER DATABASE [Notes-MarketPlace] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Notes-MarketPlace] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Notes-MarketPlace] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Notes-MarketPlace] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Notes-MarketPlace', N'ON'
GO
ALTER DATABASE [Notes-MarketPlace] SET QUERY_STORE = OFF
GO
USE [Notes-MarketPlace]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[CountryCode] [varchar](100) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Downloads]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Downloads](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NoteID] [int] NOT NULL,
	[Seller] [int] NOT NULL,
	[Downloader] [int] NOT NULL,
	[IsSellerHasAllowedDownload] [bit] NOT NULL,
	[AttachmentPath] [varchar](max) NULL,
	[IsAttachmentDownloaded] [bit] NOT NULL,
	[AttachmentDownloadedDate] [datetime] NULL,
	[IsPaid] [bit] NOT NULL,
	[PurchasedPrice] [decimal](18, 2) NULL,
	[NoteTitle] [varchar](100) NOT NULL,
	[NoteCategory] [varchar](100) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_Downloads] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoteCategory]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoteCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_NoteCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoteType]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoteType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_NoteTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReferenceData]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferenceData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](100) NOT NULL,
	[Datavalue] [varchar](100) NOT NULL,
	[RefCategory] [varchar](100) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ReferenceData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerNotes]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerNotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SellerID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[ActionedBy] [int] NULL,
	[AdminRemarks] [varchar](max) NULL,
	[PublishedDate] [datetime] NULL,
	[Title] [varchar](100) NOT NULL,
	[Category] [int] NOT NULL,
	[DisplayPicture] [varchar](500) NULL,
	[NoteType] [int] NULL,
	[NumberofPages] [int] NULL,
	[Description] [varchar](max) NOT NULL,
	[UniversityName] [varchar](200) NULL,
	[Country] [int] NULL,
	[Course] [varchar](100) NULL,
	[CourseCode] [varchar](100) NULL,
	[Professor] [varchar](100) NULL,
	[IsPaid] [bit] NOT NULL,
	[SellingPrice] [decimal](18, 2) NULL,
	[NotesPreview] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_SellerNotes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerNotesAttachements]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerNotesAttachements](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NoteID] [int] NOT NULL,
	[FileName] [varchar](100) NOT NULL,
	[FilePath] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_SellerNotesAttachements] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerNotesReportedIssues]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerNotesReportedIssues](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NoteID] [int] NOT NULL,
	[ReportedByID] [int] NOT NULL,
	[AgainstDownloadsID] [int] NOT NULL,
	[Remarks] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_SellerNotesReportedIssues] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerNotesReviews]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerNotesReviews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NoteID] [int] NOT NULL,
	[ReviewedByID] [int] NOT NULL,
	[AgainstDownloadsID] [int] NOT NULL,
	[Ratings] [decimal](2, 1) NOT NULL,
	[Comments] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_SellerNotesReviews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfigurations]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfigurations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Key] [varchar](100) NOT NULL,
	[Value] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_SystemConfigurations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[DOB] [date] NULL,
	[Gender] [int] NULL,
	[SecondaryEmailAddress] [varchar](100) NULL,
	[PhoneNumber-CountryCode] [varchar](5) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[ProfilePicture] [varchar](500) NULL,
	[AddressLine1] [varchar](100) NULL,
	[AddressLine2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[University] [varchar](100) NULL,
	[College] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[EmailID] [varchar](100) NOT NULL,
	[Password] [varchar](24) NOT NULL,
	[IsEmailVerified] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'India', N'91', CAST(N'2021-02-09T18:40:33.290' AS DateTime), 1, CAST(N'2021-02-09T18:40:33.290' AS DateTime), 1, 1)
INSERT [dbo].[Country] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, N'Australia', N'24', CAST(N'2021-02-09T18:40:33.290' AS DateTime), 1, CAST(N'2021-02-09T18:40:33.290' AS DateTime), 1, 1)
INSERT [dbo].[Country] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'USA', N'04', CAST(N'2021-02-09T18:40:33.290' AS DateTime), 1, CAST(N'2021-02-09T18:40:33.290' AS DateTime), 1, 1)
INSERT [dbo].[Country] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, N'United Kingdom', N'12', CAST(N'2021-02-09T18:40:33.290' AS DateTime), 1, CAST(N'2021-02-09T18:40:33.290' AS DateTime), 1, 1)
INSERT [dbo].[Country] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, N'Canada', N'13', CAST(N'2021-02-09T18:40:33.290' AS DateTime), 1, CAST(N'2021-03-18T11:04:40.947' AS DateTime), 1, 1)
INSERT [dbo].[Country] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (6, N'UK', N'67', CAST(N'2021-03-18T11:04:13.277' AS DateTime), 1, CAST(N'2021-03-18T11:04:31.447' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Downloads] ON 

INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, 2, 4, 1, N'/Members/2/1/Attachements/1_12-59-28.pdf', 1, CAST(N'2021-03-30T13:06:58.507' AS DateTime), 1, CAST(12.00 AS Decimal(18, 2)), N'First Note', N'History', CAST(N'2021-03-30T13:03:46.003' AS DateTime), 4, CAST(N'2021-03-30T13:06:58.507' AS DateTime), 2)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 2, 7, 5, 1, N'/Members/7/2/Attachements/2_05-07-40.pdf', 1, CAST(N'2021-03-30T17:11:45.613' AS DateTime), 0, CAST(0.00 AS Decimal(18, 2)), N'Computer Science', N'Computer', CAST(N'2021-03-30T17:11:45.617' AS DateTime), 5, CAST(N'2021-03-30T17:11:45.617' AS DateTime), 5)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 2, 7, 4, 1, N'/Members/7/2/Attachements/2_05-07-40.pdf', 1, CAST(N'2021-03-30T17:19:11.463' AS DateTime), 0, CAST(0.00 AS Decimal(18, 2)), N'Computer Science', N'Computer', CAST(N'2021-03-30T17:19:11.463' AS DateTime), 4, CAST(N'2021-03-30T17:19:11.463' AS DateTime), 4)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 3, 4, 2, 0, NULL, 0, NULL, 1, CAST(56.00 AS Decimal(18, 2)), N'Basic Computer Engineering', N'IT', CAST(N'2021-03-30T17:29:41.897' AS DateTime), 2, CAST(N'2021-03-30T17:29:41.897' AS DateTime), 2)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, 4, 2, 5, 1, N'/Members/2/4/Attachements/4_05-33-49.pdf', 1, CAST(N'2021-03-30T17:40:16.553' AS DateTime), 0, CAST(0.00 AS Decimal(18, 2)), N'Computer Hardware', N'Science', CAST(N'2021-03-30T17:40:16.553' AS DateTime), 5, CAST(N'2021-03-30T17:40:16.553' AS DateTime), 5)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 6, 5, 8, 0, NULL, 0, NULL, 1, CAST(186.00 AS Decimal(18, 2)), N'Computer Science Illuminated', N'Maths', CAST(N'2021-03-30T17:52:01.793' AS DateTime), 8, CAST(N'2021-03-30T17:52:01.793' AS DateTime), 8)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, 8, 4, 2, 1, N'/Members/4/8/Attachements/8_11-55-23.pdf', 1, CAST(N'2021-03-31T11:58:38.933' AS DateTime), 1, CAST(487.00 AS Decimal(18, 2)), N'The Computer Book', N'Computer', CAST(N'2021-03-31T11:57:59.057' AS DateTime), 2, CAST(N'2021-03-31T11:58:38.933' AS DateTime), 4)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, 10, 8, 5, 1, N'/Members/8/10/Attachements/10_12-07-41.pdf', 1, CAST(N'2021-03-31T12:08:55.213' AS DateTime), 0, CAST(0.00 AS Decimal(18, 2)), N'Stephen king', N'History', CAST(N'2021-03-31T12:08:55.213' AS DateTime), 5, CAST(N'2021-03-31T12:08:55.213' AS DateTime), 5)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, 9, 2, 4, 0, NULL, 0, NULL, 1, CAST(75.00 AS Decimal(18, 2)), N'Miraculous Health', N'Science', CAST(N'2021-03-31T12:50:32.267' AS DateTime), 4, CAST(N'2021-03-31T12:50:32.267' AS DateTime), 4)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, 5, 2, 4, 1, N'/Members/2/5/Attachements/5_05-36-21.pdf', 1, CAST(N'2021-03-31T12:53:12.390' AS DateTime), 1, CAST(105.00 AS Decimal(18, 2)), N'The Bookseller of Florence', N'Maths', CAST(N'2021-03-31T12:50:47.133' AS DateTime), 4, CAST(N'2021-03-31T12:53:12.390' AS DateTime), 2)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, 4, 2, 9, 1, N'/Members/2/4/Attachements/4_05-33-49.pdf', 1, CAST(N'2021-03-31T12:52:03.060' AS DateTime), 0, CAST(0.00 AS Decimal(18, 2)), N'Computer Hardware', N'Science', CAST(N'2021-03-31T12:52:03.060' AS DateTime), 9, CAST(N'2021-03-31T12:52:03.060' AS DateTime), 9)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, 1, 2, 9, 0, NULL, 0, NULL, 1, CAST(12.00 AS Decimal(18, 2)), N'First Note', N'History', CAST(N'2021-03-31T12:52:11.867' AS DateTime), 9, CAST(N'2021-03-31T12:52:11.867' AS DateTime), 9)
SET IDENTITY_INSERT [dbo].[Downloads] OFF
GO
SET IDENTITY_INSERT [dbo].[NoteCategory] ON 

INSERT [dbo].[NoteCategory] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'IT', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:45:22.000' AS DateTime), 1, CAST(N'2021-02-09T18:45:22.000' AS DateTime), 1, 1)
INSERT [dbo].[NoteCategory] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, N'Computer', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:45:22.000' AS DateTime), 1, CAST(N'2021-02-09T18:45:22.000' AS DateTime), 1, 1)
INSERT [dbo].[NoteCategory] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'Science', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:45:22.000' AS DateTime), 1, CAST(N'2021-02-09T18:45:22.000' AS DateTime), 1, 1)
INSERT [dbo].[NoteCategory] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, N'History', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:45:22.000' AS DateTime), 1, CAST(N'2021-02-09T18:45:22.000' AS DateTime), 1, 1)
INSERT [dbo].[NoteCategory] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, N'Account', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:45:22.000' AS DateTime), 1, CAST(N'2021-02-09T18:45:22.000' AS DateTime), 1, 1)
INSERT [dbo].[NoteCategory] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (6, N'Maths', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:45:22.000' AS DateTime), 1, CAST(N'2021-02-09T18:45:22.000' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[NoteCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[NoteType] ON 

INSERT [dbo].[NoteType] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'Val 1', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:48:53.000' AS DateTime), 1, CAST(N'2021-02-09T18:48:53.000' AS DateTime), 1, 1)
INSERT [dbo].[NoteType] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, N'Val 2', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:48:53.000' AS DateTime), 1, CAST(N'2021-03-29T12:40:15.590' AS DateTime), 1, 1)
INSERT [dbo].[NoteType] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'Val 3', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:48:53.000' AS DateTime), 1, CAST(N'2021-02-09T18:48:53.000' AS DateTime), 1, 1)
INSERT [dbo].[NoteType] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, N'Val 4', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:48:53.000' AS DateTime), 1, CAST(N'2021-02-09T18:48:53.000' AS DateTime), 1, 1)
INSERT [dbo].[NoteType] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, N'Val 5', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:48:53.000' AS DateTime), 1, CAST(N'2021-02-09T18:48:53.000' AS DateTime), 1, 1)
INSERT [dbo].[NoteType] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (6, N'Val 6', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:48:53.000' AS DateTime), 1, CAST(N'2021-02-09T18:48:53.000' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[NoteType] OFF
GO
SET IDENTITY_INSERT [dbo].[ReferenceData] ON 

INSERT [dbo].[ReferenceData] ([ID], [Value], [Datavalue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'Male', N'M', N'Gender', CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [Datavalue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, N'Female', N'Fe', N'Gender', CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [Datavalue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'Unknow', N'U', N'Gender', CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, 0)
INSERT [dbo].[ReferenceData] ([ID], [Value], [Datavalue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, N'Paid', N'P', N'Selling Mode', CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [Datavalue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, N'Free', N'F', N'Selling Mode', CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [Datavalue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (6, N'Draft', N'Draft', N'Notes Status', CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [Datavalue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (7, N'Submitted For Review', N'Submitted For Review', N'Notes Status', CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [Datavalue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (8, N'In Review', N'In Review', N'Notes Status', CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [Datavalue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (9, N'Published', N'Published', N'Notes Status', CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [Datavalue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (10, N'Rejected', N'Rejected', N'Notes Status', CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [Datavalue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (11, N'Removed', N'Removed', N'Notes Status', CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, CAST(N'2021-02-09T17:52:51.480' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[ReferenceData] OFF
GO
SET IDENTITY_INSERT [dbo].[SellerNotes] ON 

INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, 2, 9, 1, NULL, CAST(N'2021-03-30T13:02:02.917' AS DateTime), N'First Note', 4, N'/Members/2/1/DP_12-59-28.jpg', 1, 49, N'This is a First Note Book for this web site.', N'BVM', 1, N'FN', N'CP462', N'DGT', 1, CAST(12.00 AS Decimal(18, 2)), N'/Members/2/1/Preview_12-59-28.pdf', CAST(N'2021-03-30T12:59:28.233' AS DateTime), 2, CAST(N'2021-03-30T13:02:02.917' AS DateTime), 1, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, 7, 9, 10, NULL, CAST(N'2021-03-30T17:10:32.827' AS DateTime), N'Computer Science', 2, N'/Members/7/2/DP_05-07-40.jpg', NULL, 38, N'This is computer science book.', N'MSU', 4, N'CS', N'CP206', N'NMP', 0, CAST(0.00 AS Decimal(18, 2)), NULL, CAST(N'2021-03-30T17:07:40.360' AS DateTime), 7, CAST(N'2021-03-30T17:10:32.827' AS DateTime), 10, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, 4, 9, 3, N'Notes details is not proper', CAST(N'2021-03-30T17:29:12.200' AS DateTime), N'Basic Computer Engineering', 1, N'/Members/4/3/DP_05-28-06.jpg', NULL, NULL, N'This is Basic Computer Engineering Book.', N'LD', 5, N'BCE', N'CP107', N'MMV', 1, CAST(56.00 AS Decimal(18, 2)), N'/Members/4/3/Preview_05-28-06.pdf', CAST(N'2021-03-30T17:22:02.170' AS DateTime), 4, CAST(N'2021-03-30T17:29:12.200' AS DateTime), 3, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, 2, 9, 1, N'This book is spam contains.', CAST(N'2021-03-30T17:58:32.920' AS DateTime), N'Computer Hardware', 3, N'/Members/2/4/DP_05-57-52.jpg', 4, 53, N'This is Computer Hardware book.', NULL, 2, NULL, NULL, NULL, 0, CAST(0.00 AS Decimal(18, 2)), NULL, CAST(N'2021-03-30T17:33:49.407' AS DateTime), 2, CAST(N'2021-03-30T17:58:32.920' AS DateTime), 1, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, 2, 9, 3, NULL, CAST(N'2021-03-31T12:14:47.257' AS DateTime), N'The Bookseller of Florence', 6, N'/Members/2/5/DP_05-36-21.jpg', NULL, 209, N'This is The Bookseller of Florence book.', NULL, NULL, N'TBF', N'CP780', NULL, 1, CAST(105.00 AS Decimal(18, 2)), N'/Members/2/5/Preview_05-36-21.pdf', CAST(N'2021-03-30T17:36:21.637' AS DateTime), 2, CAST(N'2021-03-31T12:14:47.257' AS DateTime), 3, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (6, 5, 9, 10, NULL, CAST(N'2021-03-30T17:47:29.687' AS DateTime), N'Computer Science Illuminated', 6, N'/Members/5/6/DP_05-42-15.jpg', NULL, 121, N'This is Computer Science Illuminated book.', NULL, NULL, NULL, NULL, NULL, 1, CAST(186.00 AS Decimal(18, 2)), N'/Members/5/6/Preview_05-42-15.pdf', CAST(N'2021-03-30T17:42:15.333' AS DateTime), 5, CAST(N'2021-03-30T17:47:29.687' AS DateTime), 10, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (7, 5, 9, 3, NULL, CAST(N'2021-03-31T12:14:51.670' AS DateTime), N'Dongri To Dubai', 4, N'/Members/5/7/DP_05-46-21.jpg', 5, NULL, N'This is Dongri To Dubai book.', N'DTD', 4, NULL, NULL, N'FSC', 0, CAST(0.00 AS Decimal(18, 2)), NULL, CAST(N'2021-03-30T17:46:21.843' AS DateTime), 5, CAST(N'2021-03-31T12:14:51.670' AS DateTime), 3, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (8, 4, 9, 1, NULL, CAST(N'2021-03-31T11:56:29.370' AS DateTime), N'The Computer Book', 2, N'/Members/4/8/DP_11-55-23.jpg', 1, 1921, N'This is a big book.', N'BVM', 1, N'CS', N'CP304', N'JEL', 1, CAST(487.00 AS Decimal(18, 2)), N'/Members/4/8/Preview_11-55-23.pdf', CAST(N'2021-03-31T11:55:23.933' AS DateTime), 4, CAST(N'2021-03-31T11:56:29.370' AS DateTime), 1, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (9, 2, 9, 3, NULL, CAST(N'2021-03-31T12:04:03.450' AS DateTime), N'Miraculous Health', 3, N'/Members/2/9/DP_12-03-07.jpg', 3, 75, N'This is Miraculous Health book', N'MSU', 5, N'MH', N'CP780', NULL, 1, CAST(75.00 AS Decimal(18, 2)), N'/Members/2/9/Preview_12-03-07.pdf', CAST(N'2021-03-31T12:03:07.023' AS DateTime), 2, CAST(N'2021-03-31T12:04:03.450' AS DateTime), 3, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (10, 8, 9, 10, NULL, CAST(N'2021-03-31T12:08:28.050' AS DateTime), N'Stephen king', 4, N'/Members/8/10/DP_12-07-41.jpg', 2, 186, N'This is Stephen king book.', NULL, 4, N'SK', N'CP107', N'MMV', 0, CAST(0.00 AS Decimal(18, 2)), NULL, CAST(N'2021-03-31T12:07:41.393' AS DateTime), 8, CAST(N'2021-03-31T12:08:28.050' AS DateTime), 10, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (11, 2, 7, NULL, NULL, NULL, N'Under The Home', 5, N'/Members/2/11/DP_12-34-45.jpg', 3, 356, N'this is notes.', N'LD', 2, N'BCE', N'CP206', N'JEL', 0, CAST(0.00 AS Decimal(18, 2)), NULL, CAST(N'2021-03-31T12:34:45.600' AS DateTime), 2, CAST(N'2021-03-31T12:34:45.600' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (12, 2, 6, NULL, NULL, NULL, N'THE GREAT GATSBY', 3, NULL, 4, 987, N'This is incomplete book.', NULL, 3, N'FN', N'CP107', N'NMP', 0, CAST(0.00 AS Decimal(18, 2)), NULL, CAST(N'2021-03-31T12:36:09.040' AS DateTime), 2, CAST(N'2021-03-31T12:36:09.040' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (13, 2, 8, 1, NULL, CAST(N'2021-03-31T12:46:00.737' AS DateTime), N'London', 4, N'/Members/2/13/DP_12-44-55.jpg', 4, 784, N'This is London Book.', N'MSU', 4, N'OS', N'CP304', N'DGT', 1, CAST(98.00 AS Decimal(18, 2)), N'/Members/2/13/Preview_12-44-55.pdf', CAST(N'2021-03-31T12:44:55.160' AS DateTime), 2, CAST(N'2021-03-31T12:46:00.737' AS DateTime), 1, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (14, 2, 10, 3, N'This is fack book.', CAST(N'2021-03-31T12:48:18.853' AS DateTime), N'BRAVE NEW WORLD', 5, NULL, NULL, NULL, N'This is BRAVE NEW WORLD Book.', NULL, NULL, NULL, NULL, NULL, 0, CAST(0.00 AS Decimal(18, 2)), NULL, CAST(N'2021-03-31T12:47:13.633' AS DateTime), 2, CAST(N'2021-03-31T12:48:18.853' AS DateTime), 3, 1)
SET IDENTITY_INSERT [dbo].[SellerNotes] OFF
GO
SET IDENTITY_INSERT [dbo].[SellerNotesAttachements] ON 

INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, 1, N'1_12-59-28.pdf', N'/Members/2/1/Attachements/1_12-59-28.pdf', CAST(N'2021-03-30T12:59:28.233' AS DateTime), 2, CAST(N'2021-03-30T12:59:28.233' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, 2, N'2_05-07-40.pdf', N'/Members/7/2/Attachements/2_05-07-40.pdf', CAST(N'2021-03-30T17:07:40.360' AS DateTime), 7, CAST(N'2021-03-30T17:07:40.360' AS DateTime), 7, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, 3, N'3_05-22-02.pdf', N'/Members/4/3/Attachements/3_05-22-02.pdf', CAST(N'2021-03-30T17:22:02.170' AS DateTime), 4, CAST(N'2021-03-30T17:28:06.770' AS DateTime), 4, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, 4, N'4_05-33-49.pdf', N'/Members/2/4/Attachements/4_05-33-49.pdf', CAST(N'2021-03-30T17:33:49.407' AS DateTime), 2, CAST(N'2021-03-30T17:57:52.530' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, 5, N'5_05-36-21.pdf', N'/Members/2/5/Attachements/5_05-36-21.pdf', CAST(N'2021-03-30T17:36:21.637' AS DateTime), 2, CAST(N'2021-03-30T17:36:21.637' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (6, 6, N'6_05-42-15.pdf', N'/Members/5/6/Attachements/6_05-42-15.pdf', CAST(N'2021-03-30T17:42:15.333' AS DateTime), 5, CAST(N'2021-03-30T17:42:15.333' AS DateTime), 5, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (7, 7, N'7_05-46-21.pdf', N'/Members/5/7/Attachements/7_05-46-21.pdf', CAST(N'2021-03-30T17:46:21.843' AS DateTime), 5, CAST(N'2021-03-30T17:46:21.843' AS DateTime), 5, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (8, 8, N'8_11-55-23.pdf', N'/Members/4/8/Attachements/8_11-55-23.pdf', CAST(N'2021-03-31T11:55:23.933' AS DateTime), 4, CAST(N'2021-03-31T11:55:23.933' AS DateTime), 4, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (9, 9, N'9_12-03-07.pdf', N'/Members/2/9/Attachements/9_12-03-07.pdf', CAST(N'2021-03-31T12:03:07.023' AS DateTime), 2, CAST(N'2021-03-31T12:03:07.023' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (10, 10, N'10_12-07-41.pdf', N'/Members/8/10/Attachements/10_12-07-41.pdf', CAST(N'2021-03-31T12:07:41.393' AS DateTime), 8, CAST(N'2021-03-31T12:07:41.393' AS DateTime), 8, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (11, 11, N'11_12-34-45.pdf', N'/Members/2/11/Attachements/11_12-34-45.pdf', CAST(N'2021-03-31T12:34:45.600' AS DateTime), 2, CAST(N'2021-03-31T12:34:45.600' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (12, 12, N'12_12-36-09.pdf', N'/Members/2/12/Attachements/12_12-36-09.pdf', CAST(N'2021-03-31T12:36:09.040' AS DateTime), 2, CAST(N'2021-03-31T12:36:09.040' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (13, 13, N'13_12-44-55.pdf', N'/Members/2/13/Attachements/13_12-44-55.pdf', CAST(N'2021-03-31T12:44:55.160' AS DateTime), 2, CAST(N'2021-03-31T12:44:55.160' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (14, 14, N'14_12-47-13.pdf', N'/Members/2/14/Attachements/14_12-47-13.pdf', CAST(N'2021-03-31T12:47:13.633' AS DateTime), 2, CAST(N'2021-03-31T12:47:13.633' AS DateTime), 2, 1)
SET IDENTITY_INSERT [dbo].[SellerNotesAttachements] OFF
GO
SET IDENTITY_INSERT [dbo].[SellerNotesReportedIssues] ON 

INSERT [dbo].[SellerNotesReportedIssues] ([ID], [NoteID], [ReportedByID], [AgainstDownloadsID], [Remarks], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 2, 5, 2, N'This book is not proper.', CAST(N'2021-03-30T17:13:04.067' AS DateTime), 5, CAST(N'2021-03-30T17:14:36.013' AS DateTime), 5)
INSERT [dbo].[SellerNotesReportedIssues] ([ID], [NoteID], [ReportedByID], [AgainstDownloadsID], [Remarks], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 4, 9, 11, N'I am not satisfied.', CAST(N'2021-04-01T17:36:05.987' AS DateTime), 9, CAST(N'2021-04-01T17:36:05.987' AS DateTime), 9)
SET IDENTITY_INSERT [dbo].[SellerNotesReportedIssues] OFF
GO
SET IDENTITY_INSERT [dbo].[SellerNotesReviews] ON 

INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, 1, 4, 1, CAST(4.0 AS Decimal(2, 1)), N'This is a good book.', CAST(N'2021-03-30T13:08:31.273' AS DateTime), 4, CAST(N'2021-03-30T13:08:31.273' AS DateTime), 4, 1)
INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, 2, 5, 2, CAST(5.0 AS Decimal(2, 1)), N'Usefull Book.', CAST(N'2021-03-30T17:16:26.110' AS DateTime), 5, CAST(N'2021-04-01T17:37:42.010' AS DateTime), 5, 1)
INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, 2, 4, 3, CAST(4.0 AS Decimal(2, 1)), N'No comments', CAST(N'2021-03-30T17:20:07.420' AS DateTime), 4, CAST(N'2021-04-01T17:47:21.520' AS DateTime), 4, 1)
INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, 8, 2, 7, CAST(5.0 AS Decimal(2, 1)), N'Complete book', CAST(N'2021-04-01T17:30:59.620' AS DateTime), 2, CAST(N'2021-04-01T17:30:59.620' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, 4, 9, 11, CAST(1.0 AS Decimal(2, 1)), N'This is spam note.', CAST(N'2021-04-01T17:35:17.260' AS DateTime), 9, CAST(N'2021-04-01T17:35:17.260' AS DateTime), 9, 1)
INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (6, 10, 5, 8, CAST(4.0 AS Decimal(2, 1)), N'Knowledgeable contain  ', CAST(N'2021-04-01T17:38:42.827' AS DateTime), 5, CAST(N'2021-04-01T17:38:42.827' AS DateTime), 5, 1)
INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (7, 4, 5, 5, CAST(5.0 AS Decimal(2, 1)), N'All type of information are their.', CAST(N'2021-04-01T17:45:05.830' AS DateTime), 5, CAST(N'2021-04-01T17:45:05.830' AS DateTime), 5, 1)
INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (8, 5, 4, 10, CAST(3.0 AS Decimal(2, 1)), N'No comments', CAST(N'2021-04-01T17:48:18.163' AS DateTime), 4, CAST(N'2021-04-01T17:48:18.163' AS DateTime), 4, 1)
SET IDENTITY_INSERT [dbo].[SellerNotesReviews] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemConfigurations] ON 

INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'Support emails', N'hemalparmar2017@gmail.com', CAST(N'2021-02-21T13:17:27.970' AS DateTime), 1, CAST(N'2021-03-23T11:34:02.377' AS DateTime), 65, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'Support phone number', N'9924360163', CAST(N'2021-02-26T11:38:36.313' AS DateTime), 1, CAST(N'2021-03-23T11:34:02.377' AS DateTime), 65, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, N'Email Address', N'admin@gmail.com', CAST(N'2021-02-26T11:38:36.000' AS DateTime), 1, CAST(N'2021-03-23T11:34:02.377' AS DateTime), 65, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, N'Facebook', N'https://www.facebook.com/', CAST(N'2021-02-26T11:38:36.000' AS DateTime), 1, CAST(N'2021-03-23T11:34:02.377' AS DateTime), 65, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (6, N'Twitter', N'https://twitter.com/', CAST(N'2021-02-26T11:38:36.000' AS DateTime), 1, CAST(N'2021-03-23T11:34:02.377' AS DateTime), 65, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (7, N'Linkedin', N'https://www.linkedin.com/', CAST(N'2021-02-26T11:38:36.000' AS DateTime), 1, CAST(N'2021-03-23T11:34:02.377' AS DateTime), 65, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (8, N'Image', N'/Members/SystemConfiguration/computer-science.png', CAST(N'2021-02-26T11:38:36.000' AS DateTime), 1, CAST(N'2021-03-23T11:34:02.377' AS DateTime), 65, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (9, N'Picture', N'/Members/SystemConfiguration/member.png', CAST(N'2021-02-26T11:38:36.000' AS DateTime), 1, CAST(N'2021-03-23T11:34:02.377' AS DateTime), 65, 1)
SET IDENTITY_INSERT [dbo].[SystemConfigurations] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, NULL, NULL, NULL, N'91', N'1234567890', N'/Members/1/DP_12-44-29.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-29T12:42:58.803' AS DateTime), 1, CAST(N'2021-03-29T12:44:29.467' AS DateTime), 1)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 3, NULL, NULL, NULL, N'12', N'9924360163', N'/Members/3/DP_01-08-48.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-29T13:07:23.730' AS DateTime), 1, CAST(N'2021-03-29T13:08:48.830' AS DateTime), 3)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 4, NULL, NULL, NULL, N'13', N'5497832157', N'/Members/4/DP_01-31-26.jpg', N'Navagam', N'Than', N'Thangath', N'Gujarat', N'362698', N'India', NULL, NULL, CAST(N'2021-03-29T13:21:25.043' AS DateTime), 4, CAST(N'2021-03-29T13:31:26.963' AS DateTime), 4)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 2, CAST(N'2000-01-16' AS Date), 1, NULL, N'24', N'7048274947', N'/Members/2/DP_01-30-39.jpg', N'kamdar colony street no 3 end ', N'opp ashapura pan', N'Jamnagar', N'Gujarat', N'361006', N'India', NULL, NULL, CAST(N'2021-03-29T13:24:00.777' AS DateTime), 2, CAST(N'2021-03-29T13:30:39.510' AS DateTime), 2)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, 6, NULL, NULL, NULL, N'04', N'6598745321', N'/Members/6/DP_04-32-42.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-30T16:27:20.600' AS DateTime), 1, CAST(N'2021-03-30T16:32:42.540' AS DateTime), 6)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 5, NULL, NULL, NULL, N'67', N'5497832157', N'/Members/5/DP_04-51-06.jpg', N'Fatepar', N'paddhari', N'Rajkot', N'Gujarat', N'367894', N'USA', N'Sardar Patel University', N'Birla Vishwakarma Mahavidhyalaya', CAST(N'2021-03-30T16:51:06.847' AS DateTime), 5, CAST(N'2021-03-30T16:51:06.847' AS DateTime), 5)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, 7, NULL, NULL, NULL, N'04', N'8654798465', N'/Members/7/DP_04-54-43.jpg', N'BVM NEW HOSTEL', N'VALLABH VIDHYANAGAR', N'ANAND', N'GUJARAT', N'388120', N'United Kingdom', NULL, NULL, CAST(N'2021-03-30T16:54:43.177' AS DateTime), 7, CAST(N'2021-03-30T17:05:02.853' AS DateTime), 7)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, 8, NULL, 1, NULL, N'24', N'9867432157', NULL, N'6-MAYURNAGAR', N'GOKULNAGAR', N'Jamnagar', N'Gujarat', N'361004', N'Canada', NULL, NULL, CAST(N'2021-03-30T16:59:23.217' AS DateTime), 8, CAST(N'2021-03-30T16:59:23.217' AS DateTime), 8)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, 10, NULL, NULL, NULL, N'13', N'9876549513', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-30T17:02:49.873' AS DateTime), 1, CAST(N'2021-03-30T17:02:49.873' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'Member', N'Normal users', CAST(N'2021-02-09T18:00:59.793' AS DateTime), 1, CAST(N'2021-02-09T18:00:59.793' AS DateTime), 1, 1)
INSERT [dbo].[UserRoles] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, N'Admin', N'Same restricted funcationality in admin portal', CAST(N'2021-02-09T18:00:59.793' AS DateTime), 1, CAST(N'2021-02-09T18:02:56.220' AS DateTime), 1, 1)
INSERT [dbo].[UserRoles] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'Super Admin', N'All funcationality provided in admin portal', CAST(N'2021-02-09T18:00:59.793' AS DateTime), 1, CAST(N'2021-02-09T18:03:45.427' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, 3, N'Admin', N'Super', N'admin@gmail.com', N'Admin@123', 1, CAST(N'2021-03-29T12:22:12.273' AS DateTime), 1, CAST(N'2021-03-29T12:44:29.467' AS DateTime), 1, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, 1, N'Anil', N'Rathod', N'anil@gmail.com', N'Anil@123', 1, CAST(N'2021-03-29T13:03:38.127' AS DateTime), 2, CAST(N'2021-03-29T13:30:39.510' AS DateTime), 2, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, 2, N'Hemal', N'Parmar', N'hemal@gmail.com', N'Hemal@123', 1, CAST(N'2021-03-29T13:07:23.703' AS DateTime), 3, CAST(N'2021-03-29T13:09:37.200' AS DateTime), 3, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, 1, N'Vijay', N'Magvaniya', N'vijay@gmail.com', N'Vijay@123', 1, CAST(N'2021-03-29T13:18:49.970' AS DateTime), 4, CAST(N'2021-03-29T13:31:26.963' AS DateTime), 4, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, 1, N'Paras', N'Vasoya', N'paras@gmail.com', N'Paras@123', 1, CAST(N'2021-03-30T16:24:36.687' AS DateTime), 5, CAST(N'2021-03-30T16:51:06.847' AS DateTime), 5, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (6, 2, N'Vishal', N'Parmar', N'vishal@gmail.com', N'Vishal@123', 1, CAST(N'2021-03-30T16:27:20.537' AS DateTime), 6, CAST(N'2021-03-30T16:32:42.540' AS DateTime), 6, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (7, 1, N'Jayesh', N'Satani', N'jayesh@gmail.com', N'Jayesh@123', 1, CAST(N'2021-03-30T16:52:31.090' AS DateTime), 7, CAST(N'2021-03-30T17:05:02.853' AS DateTime), 7, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (8, 1, N'Yash', N'Goyani', N'yash@gmail.com', N'Yash@123', 1, CAST(N'2021-03-30T16:56:38.687' AS DateTime), 8, CAST(N'2021-03-30T16:59:23.220' AS DateTime), 8, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (9, 1, N'Kalpesh', N'Dharaviya', N'kalpesh@gmail.com', N'Kalpesh@123', 1, CAST(N'2021-03-30T17:00:18.057' AS DateTime), 9, CAST(N'2021-03-30T17:00:30.190' AS DateTime), 9, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (10, 2, N'Vimarsh', N'Rathod', N'vimarsh@gmail.com', N'Vimarsh@123', 1, CAST(N'2021-03-30T17:02:49.863' AS DateTime), 10, CAST(N'2021-03-30T17:03:53.803' AS DateTime), 10, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users]    Script Date: 01-04-2021 06:16:48 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [IX_Users] UNIQUE NONCLUSTERED 
(
	[EmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Countries_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Countries_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Downloads] ADD  CONSTRAINT [DF_Downloads_IsSellerHasAllowedDownload]  DEFAULT ((0)) FOR [IsSellerHasAllowedDownload]
GO
ALTER TABLE [dbo].[Downloads] ADD  CONSTRAINT [DF_Downloads_IsAttachmentDownloaded]  DEFAULT ((0)) FOR [IsAttachmentDownloaded]
GO
ALTER TABLE [dbo].[Downloads] ADD  CONSTRAINT [DF_Downloads_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[NoteCategory] ADD  CONSTRAINT [DF_NoteCategories_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[NoteCategory] ADD  CONSTRAINT [DF_NoteCategories_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[NoteType] ADD  CONSTRAINT [DF_NoteTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[NoteType] ADD  CONSTRAINT [DF_NoteTypes_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ReferenceData] ADD  CONSTRAINT [DF_ReferenceData_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ReferenceData] ADD  CONSTRAINT [DF_ReferenceData_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SellerNotes] ADD  CONSTRAINT [DF_SellerNotes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SellerNotes] ADD  CONSTRAINT [DF_SellerNotes_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SellerNotesAttachements] ADD  CONSTRAINT [DF_SellerNotesAttachements_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SellerNotesAttachements] ADD  CONSTRAINT [DF_SellerNotesAttachements_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SellerNotesReportedIssues] ADD  CONSTRAINT [DF_SellerNotesReportedIssues_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SellerNotesReviews] ADD  CONSTRAINT [DF_SellerNotesReviews_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SellerNotesReviews] ADD  CONSTRAINT [DF_SellerNotesReviews_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SystemConfigurations] ADD  CONSTRAINT [DF_SystemConfigurations_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SystemConfigurations] ADD  CONSTRAINT [DF_SystemConfigurations_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserProfile] ADD  CONSTRAINT [DF_UserProfile_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserRoles] ADD  CONSTRAINT [DF_UserRoles_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserRoles] ADD  CONSTRAINT [DF_UserRoles_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_RoleID]  DEFAULT ((1)) FOR [RoleID]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsEmailVerified]  DEFAULT ((0)) FOR [IsEmailVerified]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Downloads]  WITH CHECK ADD  CONSTRAINT [FK_Downloads_SellerNotes] FOREIGN KEY([NoteID])
REFERENCES [dbo].[SellerNotes] ([ID])
GO
ALTER TABLE [dbo].[Downloads] CHECK CONSTRAINT [FK_Downloads_SellerNotes]
GO
ALTER TABLE [dbo].[Downloads]  WITH CHECK ADD  CONSTRAINT [FK_Downloads_Users] FOREIGN KEY([Seller])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Downloads] CHECK CONSTRAINT [FK_Downloads_Users]
GO
ALTER TABLE [dbo].[Downloads]  WITH CHECK ADD  CONSTRAINT [FK_Downloads_Users1] FOREIGN KEY([Downloader])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Downloads] CHECK CONSTRAINT [FK_Downloads_Users1]
GO
ALTER TABLE [dbo].[NoteCategory]  WITH CHECK ADD  CONSTRAINT [FK_NoteCategory_Users] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[NoteCategory] CHECK CONSTRAINT [FK_NoteCategory_Users]
GO
ALTER TABLE [dbo].[NoteType]  WITH CHECK ADD  CONSTRAINT [FK_NoteType_Users] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[NoteType] CHECK CONSTRAINT [FK_NoteType_Users]
GO
ALTER TABLE [dbo].[SellerNotes]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotes_Countries] FOREIGN KEY([Country])
REFERENCES [dbo].[Country] ([ID])
GO
ALTER TABLE [dbo].[SellerNotes] CHECK CONSTRAINT [FK_SellerNotes_Countries]
GO
ALTER TABLE [dbo].[SellerNotes]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotes_NoteCategories] FOREIGN KEY([Category])
REFERENCES [dbo].[NoteCategory] ([ID])
GO
ALTER TABLE [dbo].[SellerNotes] CHECK CONSTRAINT [FK_SellerNotes_NoteCategories]
GO
ALTER TABLE [dbo].[SellerNotes]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotes_NoteTypes] FOREIGN KEY([NoteType])
REFERENCES [dbo].[NoteType] ([ID])
GO
ALTER TABLE [dbo].[SellerNotes] CHECK CONSTRAINT [FK_SellerNotes_NoteTypes]
GO
ALTER TABLE [dbo].[SellerNotes]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotes_ReferenceData] FOREIGN KEY([Status])
REFERENCES [dbo].[ReferenceData] ([ID])
GO
ALTER TABLE [dbo].[SellerNotes] CHECK CONSTRAINT [FK_SellerNotes_ReferenceData]
GO
ALTER TABLE [dbo].[SellerNotes]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotes_Users] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[SellerNotes] CHECK CONSTRAINT [FK_SellerNotes_Users]
GO
ALTER TABLE [dbo].[SellerNotes]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotes_Users1] FOREIGN KEY([ActionedBy])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[SellerNotes] CHECK CONSTRAINT [FK_SellerNotes_Users1]
GO
ALTER TABLE [dbo].[SellerNotesAttachements]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotesAttachements_SellerNotes] FOREIGN KEY([NoteID])
REFERENCES [dbo].[SellerNotes] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesAttachements] CHECK CONSTRAINT [FK_SellerNotesAttachements_SellerNotes]
GO
ALTER TABLE [dbo].[SellerNotesReportedIssues]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotesReportedIssues_Downloads] FOREIGN KEY([AgainstDownloadsID])
REFERENCES [dbo].[Downloads] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesReportedIssues] CHECK CONSTRAINT [FK_SellerNotesReportedIssues_Downloads]
GO
ALTER TABLE [dbo].[SellerNotesReportedIssues]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotesReportedIssues_SellerNotes] FOREIGN KEY([NoteID])
REFERENCES [dbo].[SellerNotes] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesReportedIssues] CHECK CONSTRAINT [FK_SellerNotesReportedIssues_SellerNotes]
GO
ALTER TABLE [dbo].[SellerNotesReportedIssues]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotesReportedIssues_Users] FOREIGN KEY([ReportedByID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesReportedIssues] CHECK CONSTRAINT [FK_SellerNotesReportedIssues_Users]
GO
ALTER TABLE [dbo].[SellerNotesReviews]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotesReviews_Downloads] FOREIGN KEY([AgainstDownloadsID])
REFERENCES [dbo].[Downloads] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesReviews] CHECK CONSTRAINT [FK_SellerNotesReviews_Downloads]
GO
ALTER TABLE [dbo].[SellerNotesReviews]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotesReviews_SellerNotes] FOREIGN KEY([NoteID])
REFERENCES [dbo].[SellerNotes] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesReviews] CHECK CONSTRAINT [FK_SellerNotesReviews_SellerNotes]
GO
ALTER TABLE [dbo].[SellerNotesReviews]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotesReviews_Users] FOREIGN KEY([ReviewedByID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesReviews] CHECK CONSTRAINT [FK_SellerNotesReviews_Users]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_ReferenceData] FOREIGN KEY([Gender])
REFERENCES [dbo].[ReferenceData] ([ID])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_ReferenceData]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserRoles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[UserRoles] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserRoles]
GO
/****** Object:  StoredProcedure [dbo].[spAddUsers]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spAddUsers]
@Fname varchar(50),
@Lname varchar(50),
@EmailID varchar(100),
@Password varchar(24)
AS
BEGIN
	INSERT INTO Users (RoleID, FirstName, LastName, EmailID, [Password])
	VALUES (1, @Fname, @Lname, @EmailID, @Password)
END
GO
/****** Object:  StoredProcedure [dbo].[spChangePassword]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spChangePassword]
@ID int,
@Password varchar(24)
AS
BEGIN
	UPDATE [dbo].[Users] SET [Password] = @Password, ModifiedBy = @ID, ModifiedDate = GETDATE() WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spEmailVerified]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEmailVerified]
@ID INT
AS
BEGIN
	UPDATE [dbo].[Users] SET IsEmailVerified = 1, ModifiedBy = @ID, ModifiedDate = GETDATE() WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllUsers]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllUsers]
AS
BEGIN
	SELECT * FROM Users
END
GO
/****** Object:  StoredProcedure [dbo].[spGetBuyerRequestDetails]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spGetBuyerRequestDetails]
AS
BEGIN
	SELECT [Downloads].[ID]
      ,[NoteID]
      ,[Seller]
	  ,[Users].[EmailID]
	  ,[UserProfile].[PhoneNumber-CountryCode]
	  ,[UserProfile].[PhoneNumber]
      ,[IsPaid]
      ,[PurchasedPrice]
      ,[NoteTitle]
      ,[NoteCategory].[Name]
	  ,[Downloads].[CreatedDate]
	FROM Downloads
	INNER JOIN
	UserProfile
	ON
	Downloads.Downloader = UserProfile.UserID
	INNER JOIN
	Users
	ON
	Downloads.Downloader = Users.ID
	INNER JOIN
	NoteCategory
	ON
	Downloads.NoteCategory = NoteCategory.ID
	WHERE [IsSellerHasAllowedDownload] = 0
END
GO
/****** Object:  StoredProcedure [dbo].[spGetForgotPassword]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetForgotPassword]
AS
BEGIN
	SELECT ID, EmailID FROM Users
END
GO
/****** Object:  StoredProcedure [dbo].[spGetLoginDetails]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spGetLoginDetails]
AS
BEGIN
	SELECT Users.ID, UserRoles.[Name], EmailID, [Password], IsEmailVerified, Users.IsActive 
	FROM Users
	INNER JOIN
	UserRoles
	ON Users.RoleID = UserRoles.ID
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSignUpDetails]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spGetSignUpDetails]
AS
BEGIN
	SELECT * FROM Users
END
GO
/****** Object:  StoredProcedure [dbo].[spGetStatisticDetails]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spGetStatisticDetails]
@ID int
AS
BEGIN
	SELECT COUNT(*) as SoldNote, 
	(CASE
		WHEN SUM(PurchasedPrice) IS NULL THEN 0
		ELSE SUM(PurchasedPrice)
	END) AS MonayEarned,
	(SELECT COUNT(*) FROM Downloads WHERE Downloader = @ID) AS DownloadNote,
	(SELECT COUNT(*) FROM Downloads INNER JOIN SellerNotes ON Downloads.NoteID = SellerNotes.ID WHERE SellerNotes.[Status] = 10) AS RejectedNote,
	(SELECT COUNT(*) FROM Downloads WHERE Seller = @ID AND IsSellerHasAllowedDownload = 0) AS BuyerRequest
	FROM Downloads
	WHERE Seller = @ID AND IsSellerHasAllowedDownload = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spSellerAllowed]    Script Date: 01-04-2021 06:16:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spSellerAllowed]
@ID INT,
@NoteID INT,
@Seller INT
AS
BEGIN
	UPDATE [dbo].[Downloads] 
	SET IsSellerHasAllowedDownload = 1, 
	AttachmentPath = (SELECT FilePath FROM SellerNotesAttachements WHERE SellerNotesAttachements.NoteID = @NoteID) ,
	ModifiedBy = @Seller, 
	ModifiedDate = GETDATE() 
	WHERE ID = @ID
END
GO
USE [master]
GO
ALTER DATABASE [Notes-MarketPlace] SET  READ_WRITE 
GO
