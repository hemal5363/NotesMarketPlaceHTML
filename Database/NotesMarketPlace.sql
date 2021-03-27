USE [master]
GO
/****** Object:  Database [Notes-MarketPlace]    Script Date: 27-03-2021 05:38:28 PM ******/
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
/****** Object:  Table [dbo].[Country]    Script Date: 27-03-2021 05:38:28 PM ******/
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
/****** Object:  Table [dbo].[Downloads]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  Table [dbo].[NoteCategory]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  Table [dbo].[NoteType]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  Table [dbo].[ReferenceData]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  Table [dbo].[SellerNotes]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  Table [dbo].[SellerNotesAttachements]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  Table [dbo].[SellerNotesReportedIssues]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  Table [dbo].[SellerNotesReviews]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  Table [dbo].[SystemConfigurations]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  Table [dbo].[UserProfile]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  Table [dbo].[UserRoles]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 27-03-2021 05:38:29 PM ******/
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

INSERT [dbo].[Country] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'India', N'91', CAST(N'2021-02-09T18:40:33.290' AS DateTime), 2, CAST(N'2021-02-09T18:40:33.290' AS DateTime), 2, 1)
INSERT [dbo].[Country] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, N'Australia', N'24', CAST(N'2021-02-09T18:40:33.290' AS DateTime), 2, CAST(N'2021-02-09T18:40:33.290' AS DateTime), 2, 1)
INSERT [dbo].[Country] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'USA', N'04', CAST(N'2021-02-09T18:40:33.290' AS DateTime), 3, CAST(N'2021-02-09T18:40:33.290' AS DateTime), 3, 1)
INSERT [dbo].[Country] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, N'United Kingdom', N'12', CAST(N'2021-02-09T18:40:33.290' AS DateTime), 3, CAST(N'2021-02-09T18:40:33.290' AS DateTime), 3, 1)
INSERT [dbo].[Country] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, N'Canada', N'13', CAST(N'2021-02-09T18:40:33.290' AS DateTime), 2, CAST(N'2021-03-18T11:04:40.947' AS DateTime), 2, 0)
INSERT [dbo].[Country] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (6, N'new', N'67', CAST(N'2021-03-18T11:04:13.277' AS DateTime), 2, CAST(N'2021-03-18T11:04:31.447' AS DateTime), 2, 1)
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Downloads] ON 

INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 2, 6, 5, 1, NULL, 1, NULL, 0, CAST(0.00 AS Decimal(18, 2)), N'Acccounts', N'Account', CAST(N'2021-02-16T12:51:52.523' AS DateTime), 5, CAST(N'2021-02-16T12:51:52.523' AS DateTime), 5)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, 4, 6, 1, NULL, 0, NULL, 1, CAST(65.00 AS Decimal(18, 2)), N'Data Science', N'Science', CAST(N'2021-02-16T12:51:52.523' AS DateTime), 6, CAST(N'2021-02-18T18:28:30.617' AS DateTime), 4)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 1, 4, 5, 0, NULL, 0, NULL, 1, CAST(65.00 AS Decimal(18, 2)), N'Data Science', N'Science', CAST(N'2021-02-16T12:51:52.523' AS DateTime), 5, CAST(N'2021-02-17T10:30:58.273' AS DateTime), 4)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 75, 18, 35, 1, N'/Members/18/75/Attachements/Event Registration (Responses) - Form responses 1.pdf', 1, CAST(N'2021-02-25T18:38:08.500' AS DateTime), 0, CAST(0.00 AS Decimal(18, 2)), N'Computer Operating System', N'Computer', CAST(N'2021-02-25T18:38:08.500' AS DateTime), 35, CAST(N'2021-02-25T18:38:08.500' AS DateTime), 35)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, 76, 18, 35, 1, N'/Members/18/76/Attachements/sample.pdf', 1, CAST(N'2021-03-02T16:50:43.000' AS DateTime), 1, CAST(56.00 AS Decimal(18, 2)), N'Computer Science', N'IT', CAST(N'2021-02-26T11:58:44.790' AS DateTime), 35, CAST(N'2021-03-02T16:50:43.527' AS DateTime), 18)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, 77, 18, 35, 1, N'/Members/18/77/Attachements/Problem Solving through Programming in C-converted.pdf', 1, CAST(N'2021-02-27T17:23:28.923' AS DateTime), 0, CAST(0.00 AS Decimal(18, 2)), N'Basic Computer Engg', N'Science', CAST(N'2021-02-27T17:23:28.927' AS DateTime), 35, CAST(N'2021-02-27T17:23:28.927' AS DateTime), 35)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, 76, 18, 4, 1, N'/Members/18/76/Attachements/sample.pdf', 1, CAST(N'2021-03-05T13:42:10.077' AS DateTime), 1, CAST(56.00 AS Decimal(18, 2)), N'Computer Science', N'IT', CAST(N'2021-02-27T17:39:47.793' AS DateTime), 4, CAST(N'2021-03-05T13:42:10.077' AS DateTime), 18)
SET IDENTITY_INSERT [dbo].[Downloads] OFF
GO
SET IDENTITY_INSERT [dbo].[NoteCategory] ON 

INSERT [dbo].[NoteCategory] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'IT', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:45:22.970' AS DateTime), 2, CAST(N'2021-02-09T18:45:22.970' AS DateTime), 2, 1)
INSERT [dbo].[NoteCategory] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, N'Computer', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:45:22.970' AS DateTime), 2, CAST(N'2021-02-09T18:45:22.970' AS DateTime), 2, 1)
INSERT [dbo].[NoteCategory] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'Science', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:45:22.970' AS DateTime), 3, CAST(N'2021-02-09T18:45:22.970' AS DateTime), 3, 1)
INSERT [dbo].[NoteCategory] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, N'History', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:45:22.970' AS DateTime), 2, CAST(N'2021-02-09T18:45:22.970' AS DateTime), 2, 1)
INSERT [dbo].[NoteCategory] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, N'Account', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:45:22.970' AS DateTime), 3, CAST(N'2021-03-17T13:22:27.500' AS DateTime), 65, 0)
INSERT [dbo].[NoteCategory] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (6, N'new', N'asdf', CAST(N'2021-03-17T13:14:11.640' AS DateTime), 65, CAST(N'2021-03-17T13:21:39.253' AS DateTime), 65, 1)
SET IDENTITY_INSERT [dbo].[NoteCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[NoteType] ON 

INSERT [dbo].[NoteType] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'Val 1', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:48:53.797' AS DateTime), 2, CAST(N'2021-02-09T18:48:53.797' AS DateTime), 2, 1)
INSERT [dbo].[NoteType] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, N'Val 2', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:48:53.797' AS DateTime), 3, CAST(N'2021-02-09T18:48:53.797' AS DateTime), 3, 1)
INSERT [dbo].[NoteType] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'Val 3', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:48:53.797' AS DateTime), 3, CAST(N'2021-02-09T18:48:53.797' AS DateTime), 3, 1)
INSERT [dbo].[NoteType] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, N'Val 4', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:48:53.797' AS DateTime), 3, CAST(N'2021-02-09T18:48:53.797' AS DateTime), 3, 1)
INSERT [dbo].[NoteType] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, N'Val 5', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:48:53.797' AS DateTime), 2, CAST(N'2021-03-17T18:02:47.950' AS DateTime), 65, 0)
INSERT [dbo].[NoteType] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (6, N'new type', N'lhjk', CAST(N'2021-03-17T17:58:27.860' AS DateTime), 65, CAST(N'2021-03-18T10:34:14.533' AS DateTime), 2, 1)
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

INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, 4, 6, 2, NULL, CAST(N'2021-02-16T12:36:54.460' AS DateTime), N'Data Science', 3, NULL, NULL, NULL, N'This is a book', NULL, NULL, NULL, NULL, NULL, 1, CAST(65.00 AS Decimal(18, 2)), NULL, CAST(N'2021-02-16T12:36:54.460' AS DateTime), 4, CAST(N'2021-02-16T12:36:54.460' AS DateTime), 4, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, 6, 6, 3, NULL, CAST(N'2021-02-16T12:36:54.460' AS DateTime), N'Acccounts', 5, NULL, NULL, NULL, N'This is a book', NULL, NULL, NULL, NULL, NULL, 0, CAST(0.00 AS Decimal(18, 2)), NULL, CAST(N'2021-02-16T12:36:54.460' AS DateTime), 6, CAST(N'2021-02-16T12:36:54.460' AS DateTime), 6, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, 6, 6, 3, NULL, CAST(N'2021-02-16T12:36:54.460' AS DateTime), N'Social Studies', 4, NULL, NULL, NULL, N'This is a book', NULL, NULL, NULL, NULL, NULL, 0, CAST(0.00 AS Decimal(18, 2)), NULL, CAST(N'2021-02-16T12:36:54.460' AS DateTime), 6, CAST(N'2021-02-16T12:36:54.460' AS DateTime), 6, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (75, 6, 9, 2, NULL, CAST(N'2021-03-08T12:44:25.313' AS DateTime), N'Computer Operating System', 2, N'/Members/18/75/search1.png', 1, 205, N'Note 1', N'BVM', 4, N'OS', N'CP206', N'NMP', 0, CAST(0.00 AS Decimal(18, 2)), NULL, CAST(N'2021-02-25T12:55:54.593' AS DateTime), 18, CAST(N'2021-03-08T12:44:25.313' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (76, 18, 9, 2, NULL, CAST(N'2021-02-25T16:08:07.000' AS DateTime), N'Computer Science', 1, N'/Members/18/76/search2.png', 2, 689, N'note 2', N'LD', 5, N'CS', N'CP304', N'UKJ', 1, CAST(56.00 AS Decimal(18, 2)), N'/Members/18/76/Vijay ticket.pdf', CAST(N'2021-02-25T12:58:17.837' AS DateTime), 18, CAST(N'2021-02-25T16:13:05.000' AS DateTime), 18, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (77, 18, 9, 2, N'zxcv', CAST(N'2021-03-08T18:16:20.380' AS DateTime), N'Basic Computer Engg', 3, N'/Members/18/77/search3.png', 3, 354, N'Note 3', N'MSU', 3, N'BCE', N'CP107', N'MMV', 0, CAST(0.00 AS Decimal(18, 2)), NULL, CAST(N'2021-02-25T13:01:29.523' AS DateTime), 18, CAST(N'2021-03-08T18:16:20.380' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (83, 35, 9, 2, N'this is not proper', CAST(N'2021-03-10T12:43:32.197' AS DateTime), N'Computer Hardware', 5, NULL, 4, 358, N'This is hardware book', NULL, 4, N'CH', N'CP780', N'DGT', 1, CAST(48.00 AS Decimal(18, 2)), N'/Members/18/83/santilal 2021.pdf', CAST(N'2021-03-03T17:36:25.083' AS DateTime), 18, CAST(N'2021-03-10T12:43:32.197' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (84, 18, 7, 65, N'vbn', CAST(N'2021-03-23T11:08:28.417' AS DateTime), N'python', 3, N'/Members/18/84/Untitled copy.jpg', NULL, NULL, N'adgs', NULL, NULL, NULL, NULL, NULL, 0, CAST(0.00 AS Decimal(18, 2)), NULL, CAST(N'2021-03-07T12:03:28.893' AS DateTime), 18, CAST(N'2021-03-23T11:08:28.417' AS DateTime), 65, 1)
SET IDENTITY_INSERT [dbo].[SellerNotes] OFF
GO
SET IDENTITY_INSERT [dbo].[SellerNotesAttachements] ON 

INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (27, 75, N'Event Registration (Responses) - Form responses 1.pdf', N'/Members/18/75/Attachements/Event Registration (Responses) - Form responses 1.pdf', CAST(N'2021-02-25T12:55:54.593' AS DateTime), 18, CAST(N'2021-02-25T16:08:07.877' AS DateTime), 18, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (28, 76, N'sample.pdf', N'/Members/18/76/Attachements/sample.pdf', CAST(N'2021-02-25T12:58:17.837' AS DateTime), 18, CAST(N'2021-02-25T16:13:05.000' AS DateTime), 18, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (29, 77, N'Problem Solving through Programming in C-converted.pdf', N'/Members/18/77/Attachements/Problem Solving through Programming in C-converted.pdf', CAST(N'2021-02-25T13:01:29.523' AS DateTime), 18, CAST(N'2021-02-25T16:15:02.757' AS DateTime), 18, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (32, 83, N'bill.pdf', N'/Members/18/83/Attachements/bill.pdf', CAST(N'2021-03-03T17:36:25.083' AS DateTime), 18, CAST(N'2021-03-05T11:25:01.120' AS DateTime), 18, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (33, 84, N'Photo.pdf', N'/Members/18/84/Attachements/Photo.pdf', CAST(N'2021-03-07T12:03:28.893' AS DateTime), 18, CAST(N'2021-03-07T12:03:28.897' AS DateTime), 18, 1)
SET IDENTITY_INSERT [dbo].[SellerNotesAttachements] OFF
GO
SET IDENTITY_INSERT [dbo].[SellerNotesReportedIssues] ON 

INSERT [dbo].[SellerNotesReportedIssues] ([ID], [NoteID], [ReportedByID], [AgainstDownloadsID], [Remarks], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 76, 35, 9, N'this is not proper', CAST(N'2021-03-03T16:33:51.190' AS DateTime), 35, CAST(N'2021-03-03T16:43:11.560' AS DateTime), 35)
SET IDENTITY_INSERT [dbo].[SellerNotesReportedIssues] OFF
GO
SET IDENTITY_INSERT [dbo].[SellerNotesReviews] ON 

INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (12, 77, 35, 11, CAST(1.0 AS Decimal(2, 1)), N'asd', CAST(N'2021-03-03T12:28:47.493' AS DateTime), 35, CAST(N'2021-03-03T12:28:47.493' AS DateTime), 35, 1)
INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (14, 1, 6, 2, CAST(3.0 AS Decimal(2, 1)), N';lkjh', CAST(N'2021-03-07T11:54:00.803' AS DateTime), 6, CAST(N'2021-03-07T11:54:00.803' AS DateTime), 6, 1)
SET IDENTITY_INSERT [dbo].[SellerNotesReviews] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemConfigurations] ON 

INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'Support emails', N'support@gmail.com', CAST(N'2021-02-21T13:17:27.970' AS DateTime), 1, CAST(N'2021-03-23T11:34:02.377' AS DateTime), 65, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'Support phone number', N'9924360163', CAST(N'2021-02-26T11:38:36.313' AS DateTime), 1, CAST(N'2021-03-23T11:34:02.377' AS DateTime), 65, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, N'Email Address', N'hemalparmar2017@gmail.com', CAST(N'2021-02-26T11:38:36.000' AS DateTime), 1, CAST(N'2021-03-23T11:34:02.377' AS DateTime), 65, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, N'Facebook', N'https://www.facebook.com/', CAST(N'2021-02-26T11:38:36.000' AS DateTime), 1, CAST(N'2021-03-23T11:34:02.377' AS DateTime), 65, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (6, N'Twitter', N'https://twitter.com/', CAST(N'2021-02-26T11:38:36.000' AS DateTime), 1, CAST(N'2021-03-23T11:34:02.377' AS DateTime), 65, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (7, N'Linkedin', N'https://www.linkedin.com/', CAST(N'2021-02-26T11:38:36.000' AS DateTime), 1, CAST(N'2021-03-23T11:34:02.377' AS DateTime), 65, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (8, N'Image', N'/Members/SystemConfiguration/computer-science.png', CAST(N'2021-02-26T11:38:36.000' AS DateTime), 1, CAST(N'2021-03-23T11:34:02.377' AS DateTime), 65, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (9, N'Picture', N'/Members/SystemConfiguration/member.png', CAST(N'2021-02-26T11:38:36.000' AS DateTime), 1, CAST(N'2021-03-23T11:34:02.377' AS DateTime), 65, 1)
SET IDENTITY_INSERT [dbo].[SystemConfigurations] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 3, NULL, NULL, NULL, N'91', N'6584874565', NULL, N'144-Diamond Height', N'Star Colony', N'New York', N'New York State', N'11004-05', N'united State', NULL, NULL, CAST(N'2021-02-16T16:24:31.313' AS DateTime), 3, CAST(N'2021-02-16T16:24:31.313' AS DateTime), 3)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 4, NULL, NULL, NULL, N'91', N'3256874568', N'/Members/6/Untitled-4 copy.jpg', N'144-Diamond Height', N'Star Colony', N'New York', N'New York State', N'11004-05', N'united State', NULL, NULL, CAST(N'2021-02-16T16:24:31.313' AS DateTime), 4, CAST(N'2021-02-16T16:24:31.313' AS DateTime), 4)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 5, NULL, NULL, NULL, N'91', N'7458632198', NULL, N'144-Diamond Height', N'Star Colony', N'New York', N'New York State', N'11004-05', N'united State', NULL, NULL, CAST(N'2021-02-16T16:24:31.313' AS DateTime), 5, CAST(N'2021-02-16T16:24:31.313' AS DateTime), 5)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 6, NULL, 2, NULL, N'91', N'8654793256', N'/Members/6/Untitled-4 copy.jpg', N'144-Diamond Height', N'Star Colony', N'New York', N'New York State', N'11004-05', N'Canada', NULL, NULL, CAST(N'2021-02-16T16:24:31.313' AS DateTime), 6, CAST(N'2021-03-05T11:20:48.530' AS DateTime), 6)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 18, CAST(N'2000-01-16' AS Date), 1, NULL, N'91', N'7048274947', N'/Members/18/861.jpg', N'144-Diamo', N'StarColony', N'New York', N'New York State', N'11004-05', N'India', NULL, NULL, CAST(N'2021-02-17T00:00:00.000' AS DateTime), 18, CAST(N'2021-03-05T13:52:18.640' AS DateTime), 18)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, 2, NULL, NULL, NULL, N'12', N'2222222222', N'/Members/2/d78364df-a7b2-4b27-bbed-9f7562355d43.jfif', N'144', N'star', N'new', N'new', N'11', N'india', NULL, NULL, CAST(N'2021-03-15T18:22:01.387' AS DateTime), 2, CAST(N'2021-03-16T16:00:11.903' AS DateTime), 2)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (20, 65, NULL, NULL, NULL, N'12', N'2222222222', NULL, N'144', N'star', N'new', N'new', N'11', N'india', NULL, NULL, CAST(N'2021-03-15T18:22:01.000' AS DateTime), 65, CAST(N'2021-03-16T16:00:11.000' AS DateTime), 65)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (21, 66, NULL, NULL, NULL, N'91', N'3333333333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-16T18:21:36.063' AS DateTime), 65, CAST(N'2021-03-16T18:43:29.893' AS DateTime), 65)
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'Member', N'Normal users', CAST(N'2021-02-09T18:00:59.793' AS DateTime), 1, CAST(N'2021-02-09T18:00:59.793' AS DateTime), 1, 1)
INSERT [dbo].[UserRoles] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, N'Admin', N'Same restricted funcationality in admin portal', CAST(N'2021-02-09T18:00:59.793' AS DateTime), 1, CAST(N'2021-02-09T18:02:56.220' AS DateTime), 1, 1)
INSERT [dbo].[UserRoles] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'Super Admin', N'All funcationality provided in admin portal', CAST(N'2021-02-09T18:00:59.793' AS DateTime), 1, CAST(N'2021-02-09T18:03:45.427' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, 2, N'Khayati', N'Patel', N'khayatipatel@gmail.com', N'Khayati@123', 1, CAST(N'2021-02-09T18:21:14.540' AS DateTime), 2, CAST(N'2021-03-16T16:00:11.903' AS DateTime), 2, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, 2, N'Rahul', N'Shah', N'rahulshah@gmail.com', N'rahul@123', 1, CAST(N'2021-02-09T18:21:14.540' AS DateTime), 3, CAST(N'2021-02-09T18:21:14.540' AS DateTime), 1, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, 1, N'Suman', N'Trivedi', N'sumantrivedi@gmail.com', N'suman@123', 1, CAST(N'2021-02-09T18:21:14.540' AS DateTime), 4, CAST(N'2021-02-09T18:21:14.540' AS DateTime), 4, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, 1, N'Raj', N'Malhotra', N'rajmalhotra@gmail.com', N'raj@123', 1, CAST(N'2021-02-09T18:21:14.540' AS DateTime), 5, CAST(N'2021-03-17T13:21:57.493' AS DateTime), 65, 0)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (6, 1, N'Niya', N'Patel', N'niyapatel@gmail.com', N'Niya@123', 1, CAST(N'2021-02-09T18:21:14.540' AS DateTime), 6, CAST(N'2021-03-17T13:21:44.797' AS DateTime), 65, 0)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (18, 1, N'Anil', N'rathod', N'2017anilrathod@gmail.com', N'Anil@123', 1, CAST(N'2021-02-15T20:11:49.560' AS DateTime), 18, CAST(N'2021-03-05T13:52:18.643' AS DateTime), 18, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (35, 1, N'Hemal', N'Parmar', N'hemalparmar1999@gmail.com', N'Hemal@123', 1, CAST(N'2021-02-24T18:13:34.127' AS DateTime), 35, CAST(N'2021-02-24T18:14:06.463' AS DateTime), 35, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (64, 1, N'asf', N'asd', N'abc@xyz.com', N'Anil@123', 0, CAST(N'2021-03-05T12:50:37.133' AS DateTime), 64, CAST(N'2021-03-05T12:50:37.133' AS DateTime), 64, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (65, 3, N'admin', N'super', N'admin@gmail.com', N'admin@123', 1, CAST(N'2021-03-16T16:10:08.123' AS DateTime), 65, CAST(N'2021-03-16T16:10:08.123' AS DateTime), 65, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (66, 2, N'asdf', N'asdf', N'asdf@gmail.com', N'yWENDqvE', 1, CAST(N'2021-03-16T18:21:36.033' AS DateTime), 66, CAST(N'2021-03-16T18:53:15.867' AS DateTime), 65, 0)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (67, 1, N'Roshani', N'Solanki', N'sroshani025@gmail.com', N'Roshani@123', 0, CAST(N'2021-03-24T11:15:04.123' AS DateTime), 67, CAST(N'2021-03-24T11:15:04.123' AS DateTime), 67, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spAddUsers]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spChangePassword]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spEmailVerified]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetAllUsers]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetBuyerRequestDetails]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetForgotPassword]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetLoginDetails]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetSignUpDetails]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetStatisticDetails]    Script Date: 27-03-2021 05:38:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spSellerAllowed]    Script Date: 27-03-2021 05:38:29 PM ******/
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
