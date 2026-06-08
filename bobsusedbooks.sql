USE [master]
GO
/****** Object:  Database [BobsUsedBookStore]    Script Date: 8/25/2025 8:23:45 AM ******/
CREATE DATABASE [BobsUsedBookStore]
GO
-- Essential database configuration (non-default settings only)
ALTER DATABASE [BobsUsedBookStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BobsUsedBookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BobsUsedBookStore] SET ENABLE_BROKER 
GO
ALTER DATABASE [BobsUsedBookStore] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BobsUsedBookStore] SET RECOVERY FULL 
GO
USE [BobsUsedBookStore]
GO
  
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddressLine1] [nvarchar](max) NOT NULL,
	[AddressLine2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](max) NOT NULL,
	[ZipCode] [nvarchar](max) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[IsActive] [int] NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 11/17/2025 6:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](max) NOT NULL,
	[Year] [int] NULL,
	[ISBN] [nvarchar](max) NOT NULL,
	[PublisherId] [int] NOT NULL,
	[BookTypeId] [int] NOT NULL,
	[GenreId] [int] NOT NULL,
	[ConditionId] [int] NOT NULL,
	[CoverImageUrl] [nvarchar](max) NULL,
	[Summary] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/17/2025 6:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sub] [nvarchar](450) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[DateOfBirth] [datetime2](7) NULL,
	[Phone] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offer]    Script Date: 11/17/2025 6:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Author] [nvarchar](max) NOT NULL,
	[ISBN] [nvarchar](max) NOT NULL,
	[BookName] [nvarchar](max) NOT NULL,
	[FrontUrl] [nvarchar](max) NULL,
	[GenreId] [int] NOT NULL,
	[ConditionId] [int] NOT NULL,
	[PublisherId] [int] NOT NULL,
	[BookTypeId] [int] NOT NULL,
	[Summary] [nvarchar](max) NULL,
	[OfferStatus] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[CustomerId] [int] NOT NULL,
	[BookPrice] [decimal](18, 2) NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Offer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 11/17/2025 6:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/17/2025 6:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
	[DeliveryDate] [datetime2](7) NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReferenceData]    Script Date: 11/17/2025 6:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferenceData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[datatype] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ReferenceData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 11/17/2025 6:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CorrelationId] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCartItem]    Script Date: 11/17/2025 6:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCartItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShoppingCartId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[WantToBuy] [int] NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ShoppingCartItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Address_CustomerId]    Script Date: 11/17/2025 6:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_Address_CustomerId] ON [dbo].[Address]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Book_BookTypeId]    Script Date: 11/17/2025 6:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_Book_BookTypeId] ON [dbo].[Book]
(
	[BookTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Book_ConditionId]    Script Date: 11/17/2025 6:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_Book_ConditionId] ON [dbo].[Book]
(
	[ConditionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Book_GenreId]    Script Date: 11/17/2025 6:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_Book_GenreId] ON [dbo].[Book]
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Book_PublisherId]    Script Date: 11/17/2025 6:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_Book_PublisherId] ON [dbo].[Book]
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Customer_Sub]    Script Date: 11/17/2025 6:05:22 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Customer_Sub] ON [dbo].[Customer]
(
	[Sub] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Offer_BookTypeId]    Script Date: 11/17/2025 6:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_Offer_BookTypeId] ON [dbo].[Offer]
(
	[BookTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Offer_ConditionId]    Script Date: 11/17/2025 6:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_Offer_ConditionId] ON [dbo].[Offer]
(
	[ConditionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Offer_CustomerId]    Script Date: 11/17/2025 6:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_Offer_CustomerId] ON [dbo].[Offer]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Offer_GenreId]    Script Date: 11/17/2025 6:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_Offer_GenreId] ON [dbo].[Offer]
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Offer_PublisherId]    Script Date: 11/17/2025 6:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_Offer_PublisherId] ON [dbo].[Offer]
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItem_BookId]    Script Date: 11/17/2025 6:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderItem_BookId] ON [dbo].[OrderItem]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItem_OrderId]    Script Date: 11/17/2025 6:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderItem_OrderId] ON [dbo].[OrderItem]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_AddressId]    Script Date: 11/17/2025 6:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_AddressId] ON [dbo].[Orders]
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_CustomerId]    Script Date: 11/17/2025 6:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_CustomerId] ON [dbo].[Orders]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ShoppingCartItem_BookId]    Script Date: 11/17/2025 6:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ShoppingCartItem_BookId] ON [dbo].[ShoppingCartItem]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ShoppingCartItem_ShoppingCartId]    Script Date: 11/17/2025 6:05:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ShoppingCartItem_ShoppingCartId] ON [dbo].[ShoppingCartItem]
(
	[ShoppingCartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Book] ON 
GO
INSERT [dbo].[Book] ([Id], [Name], [Author], [Year], [ISBN], [PublisherId], [BookTypeId], [GenreId], [ConditionId], [CoverImageUrl], [Summary], [Price], [Quantity], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (1, N'2020: The Apocalypse', N'Li Juan', NULL, N'6556784356', 15, 1, 13, 5, N'/images/coverimages/apocalypse.png', NULL, CAST(10.95 AS Decimal(18, 2)), 25, N'System', CAST(N'2025-11-19T18:52:48.7903609' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903612' AS DateTime2))
GO
INSERT [dbo].[Book] ([Id], [Name], [Author], [Year], [ISBN], [PublisherId], [BookTypeId], [GenreId], [ConditionId], [CoverImageUrl], [Summary], [Price], [Quantity], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (2, N'Children Of Iron', N'Nikki Wolf', NULL, N'7665438976', 16, 1, 11, 6, N'/images/coverimages/childrenofiron.png', NULL, CAST(13.95 AS Decimal(18, 2)), 3, N'System', CAST(N'2025-11-19T18:52:48.7903620' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903621' AS DateTime2))
GO
INSERT [dbo].[Book] ([Id], [Name], [Author], [Year], [ISBN], [PublisherId], [BookTypeId], [GenreId], [ConditionId], [CoverImageUrl], [Summary], [Price], [Quantity], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (3, N'Gold In The Dark', N'Richard Roe', NULL, N'5442280765', 17, 1, 13, 5, N'/images/coverimages/goldinthedark.png', NULL, CAST(6.50 AS Decimal(18, 2)), 10, N'System', CAST(N'2025-11-19T18:52:48.7903623' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903624' AS DateTime2))
GO
INSERT [dbo].[Book] ([Id], [Name], [Author], [Year], [ISBN], [PublisherId], [BookTypeId], [GenreId], [ConditionId], [CoverImageUrl], [Summary], [Price], [Quantity], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (4, N'Leagues Of Smoke', N'Pat Candella', NULL, N'4556789542', 18, 2, 11, 7, N'/images/coverimages/leaguesofsmoke.png', NULL, CAST(3.00 AS Decimal(18, 2)), 1, N'System', CAST(N'2025-11-19T18:52:48.7903629' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903630' AS DateTime2))
GO
INSERT [dbo].[Book] ([Id], [Name], [Author], [Year], [ISBN], [PublisherId], [BookTypeId], [GenreId], [ConditionId], [CoverImageUrl], [Summary], [Price], [Quantity], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (5, N'Alone With The Stars', N'Carlos Salazar', NULL, N'4563358087', 19, 2, 12, 5, N'/images/coverimages/alonewiththestars.png', NULL, CAST(15.95 AS Decimal(18, 2)), 5, N'System', CAST(N'2025-11-19T18:52:48.7903632' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903633' AS DateTime2))
GO
INSERT [dbo].[Book] ([Id], [Name], [Author], [Year], [ISBN], [PublisherId], [BookTypeId], [GenreId], [ConditionId], [CoverImageUrl], [Summary], [Price], [Quantity], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (6, N'The Girl In The Polaroid', N'Terri Whitlock', NULL, N'2354435678', 20, 1, 12, 6, N'/images/coverimages/girlinthepolaroid.png', NULL, CAST(8.25 AS Decimal(18, 2)), 2, N'System', CAST(N'2025-11-19T18:52:48.7903636' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903637' AS DateTime2))
GO
INSERT [dbo].[Book] ([Id], [Name], [Author], [Year], [ISBN], [PublisherId], [BookTypeId], [GenreId], [ConditionId], [CoverImageUrl], [Summary], [Price], [Quantity], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (7, N'1001 Jokes', N'Mary Major', NULL, N'6554789632', 21, 2, 11, 5, N'/images/coverimages/1001jokes.png', NULL, CAST(13.95 AS Decimal(18, 2)), 7, N'System', CAST(N'2025-11-19T18:52:48.7903639' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903640' AS DateTime2))
GO
INSERT [dbo].[Book] ([Id], [Name], [Author], [Year], [ISBN], [PublisherId], [BookTypeId], [GenreId], [ConditionId], [CoverImageUrl], [Summary], [Price], [Quantity], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (8, N'My Search For Meaning', N'Mateo Jackson', NULL, N'4558786554', 22, 3, 8, 7, N'/images/coverimages/mysearchformeaning.png', NULL, CAST(5.00 AS Decimal(18, 2)), 15, N'System', CAST(N'2025-11-19T18:52:48.7903643' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903644' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([Id], [Sub], [Username], [FirstName], [LastName], [Email], [DateOfBirth], [Phone], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (1, N'FB6135C7-1464-4A72-B74E-4B63D343DD09', N'bookstoreuser', N'Bookstore', N'User', NULL, NULL, NULL, N'System', CAST(N'2025-11-19T18:58:42.5306935' AS DateTime2), CAST(N'2025-11-19T18:58:42.5797217' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[ReferenceData] ON 
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (1, 2, N'Hardcover', N'System', CAST(N'2025-11-19T18:52:48.7903327' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903335' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (2, 2, N'Trade Paperback', N'System', CAST(N'2025-11-19T18:52:48.7903341' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903342' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (3, 2, N'Mass Market Paperback', N'System', CAST(N'2025-11-19T18:52:48.7903343' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903344' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (4, 1, N'New', N'System', CAST(N'2025-11-19T18:52:48.7903345' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903346' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (5, 1, N'Like New', N'System', CAST(N'2025-11-19T18:52:48.7903347' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903348' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (6, 1, N'Good', N'System', CAST(N'2025-11-19T18:52:48.7903349' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903350' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (7, 1, N'Acceptable', N'System', CAST(N'2025-11-19T18:52:48.7903351' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903352' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (8, 3, N'Biographies', N'System', CAST(N'2025-11-19T18:52:48.7903354' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903354' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (9, 3, N'Children''s Books', N'System', CAST(N'2025-11-19T18:52:48.7903355' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903356' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (10, 3, N'History', N'System', CAST(N'2025-11-19T18:52:48.7903358' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903358' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (11, 3, N'Literature & Fiction', N'System', CAST(N'2025-11-19T18:52:48.7903360' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903360' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (12, 3, N'Mystery, Thriller & Suspense', N'System', CAST(N'2025-11-19T18:52:48.7903362' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903362' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (13, 3, N'Science Fiction & Fantasy', N'System', CAST(N'2025-11-19T18:52:48.7903364' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903364' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (14, 3, N'Travel', N'System', CAST(N'2025-11-19T18:52:48.7903366' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903366' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (15, 0, N'Arcadia Books', N'System', CAST(N'2025-11-19T18:52:48.7903368' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903368' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (16, 0, N'Astral Publishing', N'System', CAST(N'2025-11-19T18:52:48.7903370' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903371' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (17, 0, N'Moonlight Publishing', N'System', CAST(N'2025-11-19T18:52:48.7903372' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903373' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (18, 0, N'Dreamscape Press', N'System', CAST(N'2025-11-19T18:52:48.7903374' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903375' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (19, 0, N'Enchanted Library', N'System', CAST(N'2025-11-19T18:52:48.7903376' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903377' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (20, 0, N'Fantasia House', N'System', CAST(N'2025-11-19T18:52:48.7903378' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903379' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (21, 0, N'Horizon Books', N'System', CAST(N'2025-11-19T18:52:48.7903380' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903380' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (22, 0, N'Infinity Press', N'System', CAST(N'2025-11-19T18:52:48.7903382' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903383' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (23, 0, N'Paradigm Publishing', N'System', CAST(N'2025-11-19T18:52:48.7903384' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903388' AS DateTime2))
GO
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (24, 0, N'Aurora Publishing', N'System', CAST(N'2025-11-19T18:52:48.7903390' AS DateTime2), CAST(N'2025-11-19T18:52:48.7903390' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[ReferenceData] OFF
GO


GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Customer_CustomerId]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_ReferenceData_BookTypeId] FOREIGN KEY([BookTypeId])
REFERENCES [dbo].[ReferenceData] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_ReferenceData_BookTypeId]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_ReferenceData_ConditionId] FOREIGN KEY([ConditionId])
REFERENCES [dbo].[ReferenceData] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_ReferenceData_ConditionId]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_ReferenceData_GenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[ReferenceData] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_ReferenceData_GenreId]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_ReferenceData_PublisherId] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[ReferenceData] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_ReferenceData_PublisherId]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [FK_Offer_Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [FK_Offer_Customer_CustomerId]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [FK_Offer_ReferenceData_BookTypeId] FOREIGN KEY([BookTypeId])
REFERENCES [dbo].[ReferenceData] ([Id])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [FK_Offer_ReferenceData_BookTypeId]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [FK_Offer_ReferenceData_ConditionId] FOREIGN KEY([ConditionId])
REFERENCES [dbo].[ReferenceData] ([Id])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [FK_Offer_ReferenceData_ConditionId]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [FK_Offer_ReferenceData_GenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[ReferenceData] ([Id])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [FK_Offer_ReferenceData_GenreId]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [FK_Offer_ReferenceData_PublisherId] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[ReferenceData] ([Id])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [FK_Offer_ReferenceData_PublisherId]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Book_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Book_BookId]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Orders_OrderId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Address_AddressId] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Address_AddressId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer_CustomerId]
GO
ALTER TABLE [dbo].[ShoppingCartItem]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCartItem_Book_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShoppingCartItem] CHECK CONSTRAINT [FK_ShoppingCartItem_Book_BookId]
GO
ALTER TABLE [dbo].[ShoppingCartItem]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCartItem_ShoppingCart_ShoppingCartId] FOREIGN KEY([ShoppingCartId])
REFERENCES [dbo].[ShoppingCart] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShoppingCartItem] CHECK CONSTRAINT [FK_ShoppingCartItem_ShoppingCart_ShoppingCartId]
GO 