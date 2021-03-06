USE [Notes-MarketPlace]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 06-03-2021 04:05:18 PM ******/
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
/****** Object:  Table [dbo].[Downloads]    Script Date: 06-03-2021 04:05:18 PM ******/
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
/****** Object:  Table [dbo].[NoteCategory]    Script Date: 06-03-2021 04:05:18 PM ******/
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
/****** Object:  Table [dbo].[NoteType]    Script Date: 06-03-2021 04:05:18 PM ******/
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
/****** Object:  Table [dbo].[ReferenceData]    Script Date: 06-03-2021 04:05:18 PM ******/
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
/****** Object:  Table [dbo].[SellerNotes]    Script Date: 06-03-2021 04:05:18 PM ******/
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
/****** Object:  Table [dbo].[SellerNotesAttachements]    Script Date: 06-03-2021 04:05:18 PM ******/
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
/****** Object:  Table [dbo].[SellerNotesReportedIssues]    Script Date: 06-03-2021 04:05:18 PM ******/
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
/****** Object:  Table [dbo].[SellerNotesReviews]    Script Date: 06-03-2021 04:05:18 PM ******/
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
/****** Object:  Table [dbo].[SystemConfigurations]    Script Date: 06-03-2021 04:05:18 PM ******/
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
/****** Object:  Table [dbo].[UserProfile]    Script Date: 06-03-2021 04:05:18 PM ******/
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
	[AddressLine1] [varchar](100) NOT NULL,
	[AddressLine2] [varchar](100) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[ZipCode] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[UserRoles]    Script Date: 06-03-2021 04:05:18 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 06-03-2021 04:05:18 PM ******/
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
INSERT [dbo].[Country] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, N'Australia', N'24', CAST(N'2021-02-09T18:40:33.290' AS DateTime), 2, CAST(N'2021-02-09T18:40:33.290' AS DateTime), 2, 1)
INSERT [dbo].[Country] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'USA', N'04', CAST(N'2021-02-09T18:40:33.290' AS DateTime), 1, CAST(N'2021-02-09T18:40:33.290' AS DateTime), 1, 1)
INSERT [dbo].[Country] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, N'United Kingdom', N'12', CAST(N'2021-02-09T18:40:33.290' AS DateTime), 3, CAST(N'2021-02-09T18:40:33.290' AS DateTime), 3, 1)
INSERT [dbo].[Country] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, N'Canada', N'13', CAST(N'2021-02-09T18:40:33.290' AS DateTime), 2, CAST(N'2021-02-09T18:40:33.290' AS DateTime), 2, 1)
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
INSERT [dbo].[NoteCategory] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, N'Account', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:45:22.970' AS DateTime), 3, CAST(N'2021-02-09T18:45:22.970' AS DateTime), 3, 1)
SET IDENTITY_INSERT [dbo].[NoteCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[NoteType] ON 

INSERT [dbo].[NoteType] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'Val 1', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:48:53.797' AS DateTime), 2, CAST(N'2021-02-09T18:48:53.797' AS DateTime), 2, 1)
INSERT [dbo].[NoteType] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, N'Val 2', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:48:53.797' AS DateTime), 3, CAST(N'2021-02-09T18:48:53.797' AS DateTime), 3, 1)
INSERT [dbo].[NoteType] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'Val 3', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:48:53.797' AS DateTime), 3, CAST(N'2021-02-09T18:48:53.797' AS DateTime), 3, 1)
INSERT [dbo].[NoteType] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, N'Val 4', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:48:53.797' AS DateTime), 3, CAST(N'2021-02-09T18:48:53.797' AS DateTime), 3, 1)
INSERT [dbo].[NoteType] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, N'Val 5', N'Lorem lpsum is simply dummy text', CAST(N'2021-02-09T18:48:53.797' AS DateTime), 2, CAST(N'2021-02-09T18:48:53.797' AS DateTime), 2, 1)
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
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (75, 18, 9, 2, NULL, CAST(N'2021-02-25T16:08:07.000' AS DateTime), N'Computer Operating System', 2, N'/Members/18/75/search1.png', 1, 205, N'Note 1', N'BVM', 4, N'OS', N'CP206', N'NMP', 0, CAST(0.00 AS Decimal(18, 2)), NULL, CAST(N'2021-02-25T12:55:54.593' AS DateTime), 18, CAST(N'2021-02-25T16:08:07.877' AS DateTime), 18, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (76, 18, 9, 2, NULL, CAST(N'2021-02-25T16:08:07.000' AS DateTime), N'Computer Science', 1, N'/Members/18/76/search2.png', 2, 689, N'note 2', N'LD', 5, N'CS', N'CP304', N'UKJ', 1, CAST(56.00 AS Decimal(18, 2)), N'/Members/18/76/Vijay ticket.pdf', CAST(N'2021-02-25T12:58:17.837' AS DateTime), 18, CAST(N'2021-02-25T16:13:05.000' AS DateTime), 18, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (77, 18, 9, 2, NULL, CAST(N'2021-02-16T12:36:54.000' AS DateTime), N'Basic Computer Engg', 3, N'/Members/18/77/search3.png', 3, 354, N'Note 3', N'MSU', 3, N'BCE', N'CP107', N'MMV', 0, CAST(0.00 AS Decimal(18, 2)), NULL, CAST(N'2021-02-25T13:01:29.523' AS DateTime), 18, CAST(N'2021-02-25T16:15:02.757' AS DateTime), 18, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (83, 18, 10, 2, N'this is not proper', CAST(N'2021-03-03T17:36:25.000' AS DateTime), N'Computer Hardware', 5, NULL, 4, 358, N'This is hardware book', NULL, 4, N'CH', N'CP780', N'DGT', 1, CAST(48.00 AS Decimal(18, 2)), N'/Members/18/83/santilal 2021.pdf', CAST(N'2021-03-03T17:36:25.083' AS DateTime), 18, CAST(N'2021-03-05T11:25:01.120' AS DateTime), 18, 1)
SET IDENTITY_INSERT [dbo].[SellerNotes] OFF
GO
SET IDENTITY_INSERT [dbo].[SellerNotesAttachements] ON 

INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (27, 75, N'Event Registration (Responses) - Form responses 1.pdf', N'/Members/18/75/Attachements/Event Registration (Responses) - Form responses 1.pdf', CAST(N'2021-02-25T12:55:54.593' AS DateTime), 18, CAST(N'2021-02-25T16:08:07.877' AS DateTime), 18, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (28, 76, N'sample.pdf', N'/Members/18/76/Attachements/sample.pdf', CAST(N'2021-02-25T12:58:17.837' AS DateTime), 18, CAST(N'2021-02-25T16:13:05.000' AS DateTime), 18, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (29, 77, N'Problem Solving through Programming in C-converted.pdf', N'/Members/18/77/Attachements/Problem Solving through Programming in C-converted.pdf', CAST(N'2021-02-25T13:01:29.523' AS DateTime), 18, CAST(N'2021-02-25T16:15:02.757' AS DateTime), 18, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (32, 83, N'bill.pdf', N'/Members/18/83/Attachements/bill.pdf', CAST(N'2021-03-03T17:36:25.083' AS DateTime), 18, CAST(N'2021-03-05T11:25:01.120' AS DateTime), 18, 1)
SET IDENTITY_INSERT [dbo].[SellerNotesAttachements] OFF
GO
SET IDENTITY_INSERT [dbo].[SellerNotesReportedIssues] ON 

INSERT [dbo].[SellerNotesReportedIssues] ([ID], [NoteID], [ReportedByID], [AgainstDownloadsID], [Remarks], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 75, 35, 4, N'asdf', CAST(N'2021-03-03T16:31:01.610' AS DateTime), 35, CAST(N'2021-03-03T16:31:34.417' AS DateTime), 35)
INSERT [dbo].[SellerNotesReportedIssues] ([ID], [NoteID], [ReportedByID], [AgainstDownloadsID], [Remarks], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 76, 35, 9, N'this is not proper', CAST(N'2021-03-03T16:33:51.190' AS DateTime), 35, CAST(N'2021-03-03T16:43:11.560' AS DateTime), 35)
SET IDENTITY_INSERT [dbo].[SellerNotesReportedIssues] OFF
GO
SET IDENTITY_INSERT [dbo].[SellerNotesReviews] ON 

INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (11, 77, 35, 11, CAST(4.0 AS Decimal(2, 1)), N'axvc', CAST(N'2021-03-03T12:19:25.083' AS DateTime), 35, CAST(N'2021-03-03T12:55:28.517' AS DateTime), 35, 1)
INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (12, 77, 35, 11, CAST(1.0 AS Decimal(2, 1)), N'asd', CAST(N'2021-03-03T12:28:47.493' AS DateTime), 35, CAST(N'2021-03-03T12:28:47.493' AS DateTime), 35, 1)
INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (13, 76, 35, 9, CAST(5.0 AS Decimal(2, 1)), N'sDF', CAST(N'2021-03-03T12:38:53.413' AS DateTime), 35, CAST(N'2021-03-03T12:39:12.267' AS DateTime), 35, 1)
SET IDENTITY_INSERT [dbo].[SellerNotesReviews] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemConfigurations] ON 

INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'Email', N'hemalparmar2017@gmail.com', CAST(N'2021-02-21T13:17:27.970' AS DateTime), 1, CAST(N'2021-02-21T13:17:27.970' AS DateTime), 1, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'Number', N'91 9924360163', CAST(N'2021-02-26T11:38:36.313' AS DateTime), 1, CAST(N'2021-02-26T11:38:36.000' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[SystemConfigurations] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 3, NULL, NULL, NULL, N'91', N'6584874565', NULL, N'144-Diamond Height', N'Star Colony', N'New York', N'New York State', N'11004-05', N'united State', NULL, NULL, CAST(N'2021-02-16T16:24:31.313' AS DateTime), 3, CAST(N'2021-02-16T16:24:31.313' AS DateTime), 3)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 4, NULL, NULL, NULL, N'91', N'3256874568', NULL, N'144-Diamond Height', N'Star Colony', N'New York', N'New York State', N'11004-05', N'united State', NULL, NULL, CAST(N'2021-02-16T16:24:31.313' AS DateTime), 4, CAST(N'2021-02-16T16:24:31.313' AS DateTime), 4)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 5, NULL, NULL, NULL, N'91', N'7458632198', NULL, N'144-Diamond Height', N'Star Colony', N'New York', N'New York State', N'11004-05', N'united State', NULL, NULL, CAST(N'2021-02-16T16:24:31.313' AS DateTime), 5, CAST(N'2021-02-16T16:24:31.313' AS DateTime), 5)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 6, NULL, 2, NULL, N'91', N'8654793256', N'/Members/6/Untitled-4 copy.jpg', N'144-Diamond Height', N'Star Colony', N'New York', N'New York State', N'11004-05', N'Canada', NULL, NULL, CAST(N'2021-02-16T16:24:31.313' AS DateTime), 6, CAST(N'2021-03-05T11:20:48.530' AS DateTime), 6)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumber-CountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 18, CAST(N'2021-03-05' AS Date), 1, NULL, N'91', N'7048274947', N'/Members/18/861.jpg', N'144-Diamo', N'StarColony', N'New York', N'New York State', N'11004-05', N'India', NULL, NULL, CAST(N'2021-02-17T00:00:00.000' AS DateTime), 18, CAST(N'2021-03-05T13:52:18.640' AS DateTime), 18)
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'Member', N'Normal users', CAST(N'2021-02-09T18:00:59.793' AS DateTime), 1, CAST(N'2021-02-09T18:00:59.793' AS DateTime), 1, 1)
INSERT [dbo].[UserRoles] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, N'Admin', N'Same restricted funcationality in admin portal', CAST(N'2021-02-09T18:00:59.793' AS DateTime), 1, CAST(N'2021-02-09T18:02:56.220' AS DateTime), 1, 1)
INSERT [dbo].[UserRoles] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'Super Admin', N'All funcationality provided in admin portal', CAST(N'2021-02-09T18:00:59.793' AS DateTime), 1, CAST(N'2021-02-09T18:03:45.427' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, 2, N'Khayati', N'Patel', N'khayatipatel@gmail.com', N'khayati@123', 1, CAST(N'2021-02-09T18:21:14.540' AS DateTime), 2, CAST(N'2021-02-09T18:21:14.540' AS DateTime), 1, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, 2, N'Rahul', N'Shah', N'rahulshah@gmail.com', N'rahul@123', 1, CAST(N'2021-02-09T18:21:14.540' AS DateTime), 3, CAST(N'2021-02-09T18:21:14.540' AS DateTime), 1, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, 1, N'Suman', N'Trivedi', N'sumantrivedi@gmail.com', N'suman@123', 1, CAST(N'2021-02-09T18:21:14.540' AS DateTime), 4, CAST(N'2021-02-09T18:21:14.540' AS DateTime), 4, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, 1, N'Raj', N'Malhotra', N'rajmalhotra@gmail.com', N'raj@123', 1, CAST(N'2021-02-09T18:21:14.540' AS DateTime), 5, CAST(N'2021-02-09T18:21:14.540' AS DateTime), 5, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (6, 1, N'Niya', N'Patel', N'niyapatel@gmail.com', N'Niya@123', 1, CAST(N'2021-02-09T18:21:14.540' AS DateTime), 6, CAST(N'2021-03-05T11:20:48.533' AS DateTime), 6, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (18, 1, N'Anil', N'rathod', N'2017anilrathod@gmail.com', N'Anil@123', 1, CAST(N'2021-02-15T20:11:49.560' AS DateTime), 18, CAST(N'2021-03-05T13:52:18.643' AS DateTime), 18, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (35, 1, N'Hemal', N'Parmar', N'hemalparmar1999@gmail.com', N'Hemal@123', 1, CAST(N'2021-02-24T18:13:34.127' AS DateTime), 35, CAST(N'2021-02-24T18:14:06.463' AS DateTime), 35, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (64, 1, N'asf', N'asd', N'abc@xyz.com', N'Anil@123', 0, CAST(N'2021-03-05T12:50:37.133' AS DateTime), 64, CAST(N'2021-03-05T12:50:37.133' AS DateTime), 64, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users]    Script Date: 06-03-2021 04:05:18 PM ******/
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
