USE [master]
GO
/****** Object:  Database [WebsiteASP_NET]    Script Date: 1/15/2025 2:10:40 PM ******/
CREATE DATABASE [WebsiteASP_NET]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebsiteASP_NET', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CRISTYLONG\MSSQL\DATA\WebsiteASP_NET.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebsiteASP_NET_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CRISTYLONG\MSSQL\DATA\WebsiteASP_NET_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WebsiteASP_NET] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebsiteASP_NET].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebsiteASP_NET] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebsiteASP_NET] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebsiteASP_NET] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebsiteASP_NET] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebsiteASP_NET] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET RECOVERY FULL 
GO
ALTER DATABASE [WebsiteASP_NET] SET  MULTI_USER 
GO
ALTER DATABASE [WebsiteASP_NET] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebsiteASP_NET] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebsiteASP_NET] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebsiteASP_NET] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebsiteASP_NET] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebsiteASP_NET', N'ON'
GO
ALTER DATABASE [WebsiteASP_NET] SET QUERY_STORE = ON
GO
ALTER DATABASE [WebsiteASP_NET] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WebsiteASP_NET]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 1/15/2025 2:10:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[Deleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/15/2025 2:10:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[Deleted] [bit] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/15/2025 2:10:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UserId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 1/15/2025 2:10:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/15/2025 2:10:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nchar](100) NULL,
	[CategoryId] [int] NULL,
	[ShortDes] [nvarchar](100) NULL,
	[FullDescription] [nvarchar](500) NULL,
	[Price] [float] NULL,
	[PriceDiscount] [float] NULL,
	[TypeId] [int] NULL,
	[Slug] [varchar](50) NULL,
	[BrandId] [int] NULL,
	[Deleted] [bit] NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/15/2025 2:10:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (1, N'Apple', N'apple.png', N'apple', 1, 1, CAST(N'2024-12-15T23:04:25.527' AS DateTime), NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (2, N'Samsung', N'samsung.png', N'samsung', 1, 2, CAST(N'2024-12-15T23:04:25.527' AS DateTime), NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (3, N'Xiaomi', N'xiaomi.png', N'xiaomi', 1, 3, CAST(N'2024-12-15T23:04:25.527' AS DateTime), NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (4, N'Oppo', N'oppo.png', N'oppo', 1, 4, CAST(N'2024-12-15T23:04:25.527' AS DateTime), NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (6, N'Dell', N'dell.png', N'dell', 0, 6, CAST(N'2024-12-15T23:04:25.527' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Điện thoại', N'smartphones.png                                                                                     ', N'smartphones', 1, 1, 0, CAST(N'2024-12-15T23:04:29.387' AS DateTime), NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Máy tính bảng', N'ipad.jpg                                                                                            ', N'tablets', 1, 2, 0, CAST(N'2024-12-15T23:04:29.387' AS DateTime), NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Máy tính xách tay', N'macbook5.jpg                                                                                        ', N'laptops', 1, 3, 0, CAST(N'2024-12-15T23:04:29.387' AS DateTime), NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Phụ kiện', N'accessories.png                                                                                     ', N'accessories', 1, 4, 0, CAST(N'2024-12-15T23:04:29.387' AS DateTime), NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (5, N'Thiết bị đeo', N'wearables.png                                                                                       ', N'wearables', 1, 5, 0, CAST(N'2024-12-15T23:04:29.387' AS DateTime), NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (6, N'Màn hình', N'monitors.png                                                                                        ', N'monitors', 0, 6, 0, CAST(N'2024-12-15T23:04:29.387' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (1, N'DonHang-20241225155745', 7, 17, CAST(N'2024-12-25T15:57:46.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (2, N'DonHang-20241225160308', 7, 17, CAST(N'2024-12-25T16:03:08.793' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (3, N'DonHang-20241225160610', 7, 17, CAST(N'2024-12-25T16:06:10.757' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (4, N'DonHang-20241225160922', 7, 17, CAST(N'2024-12-25T16:09:23.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (5, N'DonHang-20241225161052', 7, 17, CAST(N'2024-12-25T16:10:52.203' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (6, N'DonHang-20241225161100', 7, 17, CAST(N'2024-12-25T16:11:00.997' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (7, N'DonHang-20241225161104', 7, 17, CAST(N'2024-12-25T16:11:04.003' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (8, N'DonHang-20241225161104', 7, 17, CAST(N'2024-12-25T16:11:04.227' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (9, N'DonHang-20241225161105', 7, 17, CAST(N'2024-12-25T16:11:05.437' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (10, N'DonHang-20241225161106', 7, 17, CAST(N'2024-12-25T16:11:06.747' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (11, N'DonHang-20241225161107', 7, 17, CAST(N'2024-12-25T16:11:07.597' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (12, N'DonHang-20241225161107', 7, 17, CAST(N'2024-12-25T16:11:07.913' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (13, N'DonHang-20241225161108', 7, 17, CAST(N'2024-12-25T16:11:08.133' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (14, N'DonHang-20241225161110', 7, 17, CAST(N'2024-12-25T16:11:10.397' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (15, N'DonHang-20241225161110', 7, 17, CAST(N'2024-12-25T16:11:10.547' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (16, N'DonHang-20241225161110', 7, 17, CAST(N'2024-12-25T16:11:10.767' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (17, N'DonHang-20241225161116', 7, 17, CAST(N'2024-12-25T16:11:16.493' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (18, N'DonHang-20241225161225', 7, 17, CAST(N'2024-12-25T16:12:25.643' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (19, N'DonHang-20241225161245', 7, 17, CAST(N'2024-12-25T16:12:45.763' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (20, N'DonHang-20241225161247', 7, 17, CAST(N'2024-12-25T16:12:47.110' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (21, N'DonHang-20241225161247', 7, 17, CAST(N'2024-12-25T16:12:47.257' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (22, N'DonHang-20241225161247', 7, 17, CAST(N'2024-12-25T16:12:47.487' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (23, N'DonHang-20241225161248', 7, 17, CAST(N'2024-12-25T16:12:48.167' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (24, N'DonHang-20241225161248', 7, 17, CAST(N'2024-12-25T16:12:48.317' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (25, N'DonHang-20241225161248', 7, 17, CAST(N'2024-12-25T16:12:48.450' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (26, N'DonHang-20241225161248', 7, 17, CAST(N'2024-12-25T16:12:48.590' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (27, N'DonHang-20241225161248', 7, 17, CAST(N'2024-12-25T16:12:48.733' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (28, N'DonHang-20241225161248', 7, 17, CAST(N'2024-12-25T16:12:48.887' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (29, N'DonHang-20241225161249', 7, 17, CAST(N'2024-12-25T16:12:49.007' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (30, N'DonHang-20241225161249', 7, 17, CAST(N'2024-12-25T16:12:49.343' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (31, N'DonHang-20241225161249', 7, 17, CAST(N'2024-12-25T16:12:49.500' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (32, N'DonHang-20241225161249', 7, 17, CAST(N'2024-12-25T16:12:49.647' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (33, N'DonHang-20241225161249', 7, 17, CAST(N'2024-12-25T16:12:49.793' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (34, N'DonHang-20241225161249', 7, 17, CAST(N'2024-12-25T16:12:49.963' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (35, N'DonHang-20241225161340', 7, 17, CAST(N'2024-12-25T16:13:40.523' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (36, N'DonHang-20241225161348', 7, 17, CAST(N'2024-12-25T16:13:48.780' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (37, N'DonHang-20241228102449', 7, 17, CAST(N'2024-12-28T10:24:49.743' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (38, N'DonHang-20241228102457', 7, 17, CAST(N'2024-12-28T10:24:57.980' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (39, N'DonHang-20241228102459', 7, 17, CAST(N'2024-12-28T10:24:59.250' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (40, N'DonHang-20241228102459', 7, 17, CAST(N'2024-12-28T10:24:59.397' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (41, N'DonHang-20241228102459', 7, 17, CAST(N'2024-12-28T10:24:59.557' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (42, N'DonHang-20241228102459', 7, 17, CAST(N'2024-12-28T10:24:59.697' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (43, N'DonHang-20241228102506', 7, 17, CAST(N'2024-12-28T10:25:06.637' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (44, N'DonHang-20241228102834', 7, 17, CAST(N'2024-12-28T10:28:34.810' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (45, N'DonHang-20241230061541', 7, 17, CAST(N'2024-12-30T06:15:41.517' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (46, N'DonHang-20241230073033', 7, 17, CAST(N'2024-12-30T07:30:33.560' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (47, N'DonHang-20241230073043', 7, 17, CAST(N'2024-12-30T07:30:43.957' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (48, N'DonHang-20241230093806', 7, 17, CAST(N'2024-12-30T09:38:06.877' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (49, N'DonHang-20241230104127', 7, 17, CAST(N'2024-12-30T10:41:27.133' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (50, N'DonHang-20241230104721', 7, 17, CAST(N'2024-12-30T10:47:21.337' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (51, N'DonHang-20241230104728', 7, 17, CAST(N'2024-12-30T10:47:28.027' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (52, N'DonHang-20241230105222', 7, 17, CAST(N'2024-12-30T10:52:22.253' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (53, N'DonHang-20241230110409', 7, 17, CAST(N'2024-12-30T11:04:09.763' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (54, N'DonHang-20241230110622', 7, 17, CAST(N'2024-12-30T11:06:22.310' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (55, N'DonHang-20241230110636', 7, 17, CAST(N'2024-12-30T11:06:36.987' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (56, N'DonHang-20241230110812', 7, 17, CAST(N'2024-12-30T11:08:12.133' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (57, N'DonHang-20241230111354', 7, 17, CAST(N'2024-12-30T11:13:54.250' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (58, N'DonHang-20241230111413', 7, 17, CAST(N'2024-12-30T11:14:13.403' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (59, N'DonHang-20241230123433', 7, 17, CAST(N'2024-12-30T12:34:33.003' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (60, N'DonHang-20241230125311', 7, 1, CAST(N'2024-12-30T12:53:11.540' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (61, N'DonHang-20241230125453', 9, 17, CAST(N'2024-12-30T12:54:53.083' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (62, N'DonHang-20241230142740', 7, 17, CAST(N'2024-12-30T14:27:40.733' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (63, N'DonHang-20241230151318', 7, 17, CAST(N'2024-12-30T15:13:18.890' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (64, N'DonHang-20241230160846', 7, 17, CAST(N'2024-12-30T16:08:46.353' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (65, N'DonHang-20241230161140', 10, 17, CAST(N'2024-12-30T16:11:40.363' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (67, N'DonHang-20250106125328', 7, 17, CAST(N'2025-01-06T12:53:28.973' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (68, N'DonHang-20250111170300', 17, 17, CAST(N'2025-01-11T17:03:00.447' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (69, N'DonHang-20250113135329', 7, 17, CAST(N'2025-01-13T13:53:29.930' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (70, N'DonHang-20250113135410', 7, 17, CAST(N'2025-01-13T13:54:10.833' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (71, N'DonHang-20250113204806', 9, 17, CAST(N'2025-01-13T20:48:06.103' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (72, N'DonHang-20250113220930', 17, 17, CAST(N'2025-01-13T22:09:30.507' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (73, N'DonHang-20250115140543', 20, 17, CAST(N'2025-01-15T14:05:43.450' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (4, 4, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (5, 5, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (6, 6, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (7, 7, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (8, 8, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (9, 9, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (10, 10, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (11, 11, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (12, 12, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (13, 13, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (14, 14, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (15, 15, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (16, 16, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (17, 17, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (18, 18, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (19, 19, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (20, 20, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (21, 21, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (22, 22, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (23, 23, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (24, 24, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (25, 25, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (26, 26, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (27, 27, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (28, 28, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (29, 29, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (30, 30, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (31, 31, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (32, 32, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (33, 33, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (34, 34, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (35, 35, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (36, 36, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (37, 37, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (38, 38, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (39, 39, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (40, 40, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (41, 41, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (42, 42, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (43, 43, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (44, 44, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (45, 45, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (46, 46, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (47, 47, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (48, 48, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (49, 49, 1, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (50, 50, 4, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (51, 51, 4, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (52, 52, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (53, 52, 11, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (54, 53, 11, 3)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (55, 54, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (56, 55, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (57, 56, 11, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (58, 57, 11, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (59, 58, 1, 4)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (60, 59, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (61, 59, 4, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (62, 59, 6, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (63, 60, 1, 4)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (64, 61, 4, 3)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (65, 62, 1, 5)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (66, 63, 3, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (67, 64, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (68, 65, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (69, 67, 15, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (70, 68, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (71, 69, 1, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (72, 70, 1, 6)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (73, 71, 21, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (74, 71, 23, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (75, 72, 1, 3)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (76, 73, 1, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'iPhone 14 Pro Max 128GB', N'iphone144.jpeg                                                                                      ', 1, N'iPhone 14 Pro Max 128GB sở hữu thiết kế sang trọng, màn hình Super Retina XDR 6.7 inch', N'iPhone 14 là mẫu điện thoại thông minh được Apple ra mắt vào năm 2022, nổi bật với thiết kế cao cấp, hiệu suất mạnh mẽ và nhiều tính năng nâng cấp so với các thế hệ trước', 25896000, 899.99, 1, N'iphone', 1, 1, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Galaxy Tab S8 Plus', N'samsunggalaxy.jpg                                                                                   ', 2, N'Tablet mạnh mẽ', N'Samsung Galaxy Tab S8 với màn hình AMOLED.', 9800000, 649.99, 1, N'galaxy-tab-s8', 2, 0, 1, 1, CAST(N'2024-12-15T23:04:37.110' AS DateTime), CAST(N'2024-12-16T00:00:08.990' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Surface Laptop Studio 2', N'sufacelaptop.jpg                                                                                    ', 3, N'Laptop nhẹ và mạnh', N'Surface Laptop Studio 2 là mẫu laptop cao cấp nhất trong dòng sản phẩm Surface của Microsoft, được thiết kế dành cho các nhà sáng tạo nội dung, lập trình viên và người dùng chuyên nghiệp', 13560000, 749.99, 1, N'mi-notebook-air', 2, 0, 1, 1, CAST(N'2024-12-15T23:04:37.110' AS DateTime), CAST(N'2024-12-16T00:00:08.990' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Tai nghe Bluetooth Apple AirPods 4', N'airpods4.jpg                                                                                        ', 5, N'Tai nghe Bluetooth Apple AirPods 4', N'Apple AirPods 4 là tai nghe không dây với chip H2 cùng EQ thích ứng và âm thanh không gian cá nhân hóa mang lại trải nghiệm âm thanh ấn tượng', 7500000, 199.99, 1, N'oppo-watch', 1, 0, 1, 1, CAST(N'2024-12-15T23:04:37.110' AS DateTime), CAST(N'2024-12-16T00:00:08.990' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (5, N'iPhone 16 Pro Max', N'16.png                                                                                              ', 1, N'Smartphone phổ thông', N'iPhone 16 Pro Max, màn hình OLED 6.9 inch, chip A18 Bionic mạnh mẽ, camera Pro 48MP, zoom quang 10x, pin lâu hơn, hỗ trợ USB-C, thiết kế cao cấp, hiệu năng vượt trội', 29856000, 149.99, 1, N'vivo-y21', 1, 0, 1, 2, CAST(N'2024-12-15T23:04:37.110' AS DateTime), CAST(N'2024-12-16T00:00:08.990' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (6, N'Dell P2425H 24 inch', N'monitors.png                                                                                        ', 6, N'Màn hình chất lượng cao', N'Màn hình Dell 24" với độ phân giải Full HD.', 17600000, 249.99, 1, N'dell-monitor-24', 2, 0, 1, 1, CAST(N'2024-12-15T23:04:37.110' AS DateTime), CAST(N'2024-12-16T00:00:08.990' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (7, N'iPhone 14 Pro Max', N'iphone14.jpg                                                                                        ', 1, N'Dòng smartphone cao cấp', N'iPhone 14 Pro Max, màn hình OLED 6.7 inch, chip A16 Bionic, Dynamic Island, camera chính 48MP, hỗ trợ quay phim 4K, pin lâu, Face ID cải tiến, thiết kế sang trọng, hiệu năng mạnh mẽ', 22560000, 899.99, 1, N'iphone-14', 1, 0, 1, 1, CAST(N'2024-12-16T00:49:12.020' AS DateTime), CAST(N'2024-12-16T00:54:57.653' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (8, N'Galaxy Tab S10 Ultra', N'galaxytabs10.jpg                                                                                    ', 2, N'Tablet mạnh mẽ', N'Samsung Galaxy Tab S8 với màn hình AMOLED.', 17500000, 649.99, 1, N'galaxy-tab-s8', 2, 0, 1, 1, CAST(N'2024-12-16T00:49:12.020' AS DateTime), CAST(N'2024-12-16T00:54:57.653' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (11, N'Oppo Watch 41mm Wifi (OW19W6)', N'oppoo.jpg                                                                                           ', 4, N'Chiếc đồng hồ thời thượng', N'
Oppo Watch 41mm WiFi là một chiếc đồng hồ thông minh được thiết kế tinh tế, với nhiều tính năng hiện đại phục vụ nhu cầu theo dõi sức khỏe và kết nối thông minh', 8500000, 566.88, 2, N'oppo-watch', 4, 0, 1, 1, NULL, CAST(N'2024-12-30T07:22:00.310' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (15, N'Apple 2024 Macbook Air 15', N'macbook2.jpg                                                                                        ', 3, N'Apple 2024 MacBook Air 15: Màn hình 15 inch, hiệu suất mạnh mẽ, thiết kế mỏng nhẹ.', N'Apple 2024 MacBook Air 15 có màn hình Retina 15 inch sắc nét, vi xử lý M2 mạnh mẽ, thiết kế mỏng nhẹ và thời lượng pin dài. Với hiệu suất vượt trội, máy phù hợp cho công việc, học tập và giải trí.', 45000000, 880000, 2, N'Apple 2024 MacBook Air 15', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (18, N'Dell UltraSharp U2723QE', N'moniter1.png                                                                                        ', 6, N'Màn hình Dell UltraSharp U2723QE 27 inch, độ phân giải 4K UHD', N'Màn hình Dell UltraSharp U2723QE 27 inch, độ phân giải 4K UHD, công nghệ IPS Black, màu sắc chính xác với 99% sRGB, hỗ trợ HDR, thiết kế viền mỏng, phù hợp cho đồ họa và công việc chuyên nghiệp', 12390000, 9900000, 2, N'Dell UltraSharp U2723QE', 6, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (19, N'Xiaomi Redmi Watch 4', N'xiaomi.png                                                                                          ', 4, N'Đồng hồ thông minh Xiaomi Redmi Watch 4', N'Đồng hồ thông minh Xiaomi Redmi Watch 4: Với màn hình AMOLED 1.6 inch, thời lượng pin 10 ngày, hỗ trợ đo nhịp tim, theo dõi giấc ngủ, chống nước 5ATM', 2390000, 2200000, 1, N'Ð?ng h? thông minh Xiaomi Redmi Watch 4', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (20, N'iPad 2024 Wifi 128GB', N'ipad.png                                                                                            ', 2, N'iPad mini 7 2024 WiFi 128GB: Với màn hình Retina 8.3 inch, chip A15 Bionic mạnh mẽ', N'iPad mini 7 2024 WiFi 128GB: Với màn hình Retina 8.3 inch, chip A15 Bionic mạnh mẽ, kết nối Wi-Fi nhanh, dung lượng 128GB, iPad mini 7 mang đến trải nghiệm mượt mà cho công việc và giải trí, dễ dàng mang theo mọi lúc', 13990000, 12900000, 1, N'iPad 2024 Wifi 128GB', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (21, N'Laptop ASUS TUF Gaming A15', N'asus.png                                                                                            ', 3, N'Laptop ASUS TUF Gaming A15 FA506NFR-HN006W', N'Laptop ASUS TUF Gaming A15 FA506NFR-HN006W: Với bộ vi xử lý AMD Ryzen 7 6800H, card đồ họa NVIDIA GeForce RTX 4060, màn hình 15.6 inch 144Hz, cùng thiết kế bền bỉ, chiếc laptop này tối ưu hiệu suất chơi game và làm việc đa nhiệm mạnh mẽ', 17990000, 17890000, 2, N'Laptop ASUS TUF Gaming A15', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (22, N'Sạc nhanh Ugreen Robot CD361', N'ugreen.png                                                                                          ', 4, N'Củ sạc nhanh UGREEN Robot 3 cổng USB-C to USB-A GaN 65W 11570', N'Củ sạc nhanh UGREEN Robot 3 cổng USB-C to USB-A GaN 65W 11570 có ngoại hình độc đáo với công suất truyền tải tối đa 65W, kèm theo công nghệ sạc nhanh cùng chip GaN Fast II. Bên cạnh đó, dòng sạc thông minh này còn cho phép người dùng chuyển đổi cổng sạc từ USB-C to USB-A', 990000, 970000, 1, N'S?c nhanh Ugreen Robot CD361', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (23, N'Chuột không dây Logitech', N'mouse.png                                                                                           ', 4, N'Chuột không dây Logitech MX Master 3S', N'Chuột không dây Logitech MX Master 3S mang đến kiểu dáng công thái học, giúp sử dụng thoải mái khi được nâng đỡ cả bàn tay. Phụ kiện chuột Logitech có khả năng sử dụng mượt mà trên nhiều bề mặt, đem lại phản hồi trực quan và vô cùng yên tĩnh khi nhấp chuột.', 2390000, 2300000, 2, N'Chu?t không dây Logitech MX Master 3S', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (24, N'Webcam Logitech MX Brio 4K Ultra HD', N'webcam.png                                                                                          ', 4, N'Webcam Logitech MX Brio 4K Ultra HD', N'Webcam Logitech MX BRIO 4K ULTRA HD xám đi kèm với màn chập che ống kính giúp bạn đảm bảo được sự riêng tư của mình tối ưu trong các cuộc họp trực tuyến. Bên cạnh đó, mẫu webcam này còn có khả năng ghi hình 4K ở tốc độ 30fps hoặc Full HD ở tốc độ 60fps', 4490000, 4480000, 2, N'Webcam Logitech MX Brio 4K Ultra HD', 2, 0, 1, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (4, N'Thao', N'Vu', N'thaovu@example.com', N'thao123', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (5, N'Phúc', N'Pham', N'phucpham@example.com', N'phuc123', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (7, N'Long', N'Duong', N'dcl@gmail.com', N'202cb962ac59075b964b07152d234b70', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (8, N'Công ', N'Long', N'cl@gmail.com', N'25f9e794323b453885f5181f1b624d0b', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (9, N'Long', N'Duong', N'dcl2004@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (10, N'Long', N'Duong', N'dcl20042004@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (14, N'Long', N'Duong', N'dcl20042004@gmail.com', N'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI=', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (15, N'Long', N'Duong', N'dcl20042004@gmail.com', N'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI=', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (16, N'Long', N'Duong', N'dcl200420042004@gmail.com', N'25f9e794323b453885f5181f1b624d0b', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (17, N'Cristy', N'Long', N'cristy2004@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', 1)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (20, N'Duonggg', N'Conggg', N'duongcongg@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:Giảm giá sốc, 2:Đề xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
USE [master]
GO
ALTER DATABASE [WebsiteASP_NET] SET  READ_WRITE 
GO
