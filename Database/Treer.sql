USE [master]
GO
/****** Object:  Database [Treer]    Script Date: 3/3/2023 12:59:01 PM ******/
CREATE DATABASE [Treer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Treer', FILENAME = N'D:\Student\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\Treer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Treer_log', FILENAME = N'D:\Student\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\Treer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Treer] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Treer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Treer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Treer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Treer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Treer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Treer] SET ARITHABORT OFF 
GO
ALTER DATABASE [Treer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Treer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Treer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Treer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Treer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Treer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Treer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Treer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Treer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Treer] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Treer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Treer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Treer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Treer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Treer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Treer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Treer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Treer] SET RECOVERY FULL 
GO
ALTER DATABASE [Treer] SET  MULTI_USER 
GO
ALTER DATABASE [Treer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Treer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Treer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Treer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Treer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Treer] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Treer', N'ON'
GO
ALTER DATABASE [Treer] SET QUERY_STORE = OFF
GO
USE [Treer]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/3/2023 12:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](80) NULL,
	[Password] [nvarchar](50) NULL,
	[RoleID] [int] NULL,
	[Phone] [char](15) NULL,
	[Address] [nvarchar](200) NULL,
	[Status] [int] NULL,
	[Token] [nvarchar](10) NULL,
	[CreateDate] [date] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK__Account__91CBC398FE8BE2EE] PRIMARY KEY CLUSTERED 
(
	[AccID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auction]    Script Date: 3/3/2023 12:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auction](
	[AuctionID] [int] IDENTITY(1,1) NOT NULL,
	[Starttime] [datetime] NULL,
	[Endtime] [datetime] NULL,
	[PlantID] [int] NULL,
	[Starting_price] [int] NULL,
	[End_price] [int] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuctionDetails]    Script Date: 3/3/2023 12:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuctionDetails](
	[AuctionDetailID] [int] NOT NULL,
	[AuctionID] [int] NULL,
	[AccountID] [int] NULL,
	[Bidprice] [int] NULL,
	[Bidtime] [datetime] NULL,
 CONSTRAINT [PK_AuctionDetails] PRIMARY KEY CLUSTERED 
(
	[AuctionDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuctionPlant]    Script Date: 3/3/2023 12:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuctionPlant](
	[PlantAuctionID] [int] NOT NULL,
	[PlantAuctionName] [nvarchar](100) NULL,
	[Description] [ntext] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[imgPath] [ntext] NULL,
 CONSTRAINT [PK_AuctionPlant] PRIMARY KEY CLUSTERED 
(
	[PlantAuctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bid]    Script Date: 3/3/2023 12:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bid](
	[bidID] [int] IDENTITY(1,1) NOT NULL,
	[AccID] [int] NULL,
	[AuctionID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bidID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 3/3/2023 12:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [int] NULL,
	[Title] [nvarchar](200) NULL,
	[description] [ntext] NULL,
	[postdate] [date] NULL,
 CONSTRAINT [PK__Blog__54379E50E1EC4FED] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogImg]    Script Date: 3/3/2023 12:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogImg](
	[PictureBlog_ID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [int] NULL,
	[BlogImgPath] [nvarchar](500) NULL,
 CONSTRAINT [PK_BlogImg] PRIMARY KEY CLUSTERED 
(
	[PictureBlog_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/3/2023 12:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CateID] [int] IDENTITY(1,1) NOT NULL,
	[CategoriesName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriesDetails]    Script Date: 3/3/2023 12:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriesDetails](
	[CateDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[PlantID] [int] NULL,
	[CategoriesID] [int] NULL,
 CONSTRAINT [PK_CategoriesDetails] PRIMARY KEY CLUSTERED 
(
	[CateDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 3/3/2023 12:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountID] [int] IDENTITY(1,1) NOT NULL,
	[DiscountName] [nvarchar](200) NULL,
	[OpenDate] [datetime] NULL,
	[CloseDate] [datetime] NULL,
	[Quantity] [int] NULL,
	[DiscountCode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/3/2023 12:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[AccID] [int] NULL,
	[Title] [nvarchar](200) NULL,
	[Note] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/3/2023 12:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[OrderShip] [datetime] NULL,
	[AccID] [int] NULL,
	[Status] [int] NULL,
	[DiscountID] [int] NULL,
	[CusAddress] [nvarchar](500) NULL,
	[CusPhone] [nvarchar](15) NULL,
	[CustomerName] [nvarchar](50) NULL,
 CONSTRAINT [PK__Order__C3905BAF122B9C18] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/3/2023 12:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[PlantID] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plant]    Script Date: 3/3/2023 12:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plant](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[NamePlant] [nvarchar](100) NULL,
	[price] [int] NULL,
	[description] [nvarchar](1000) NULL,
	[Status] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[stock] [int] NULL,
	[sold] [int] NULL,
	[saleID] [int] NULL,
 CONSTRAINT [PK__Plant__C5775520B10ABF95] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlantImg]    Script Date: 3/3/2023 12:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlantImg](
	[PicturePlant_ID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[PlantimgPath] [nvarchar](500) NULL,
 CONSTRAINT [PK_PlantImg] PRIMARY KEY CLUSTERED 
(
	[PicturePlant_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/3/2023 12:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 3/3/2023 12:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[SaleID] [int] IDENTITY(1,1) NOT NULL,
	[Salepercent] [int] NULL,
	[Saledes] [nvarchar](100) NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vote]    Script Date: 3/3/2023 12:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vote](
	[VoteID] [int] IDENTITY(1,1) NOT NULL,
	[AccID] [int] NULL,
	[PID] [int] NULL,
	[Point] [float] NULL,
	[Comment] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[VoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishList]    Script Date: 3/3/2023 12:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishList](
	[WishID] [int] IDENTITY(1,1) NOT NULL,
	[AccID] [int] NULL,
	[PID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[WishID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (2, N'Nguyễn Văn Tiến', N'TienVan@gmail.com', N'1111', 1, N'0947382937     ', N'TP HCM', 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (3, N'Admin', N'Admin1@gmail.com', N'1234', 2, N'               ', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (4, N'Trần Hoa', N'HoaTran@gmail.com', N'2222', 1, N'0844832037     ', N'Bình Dương', 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (5, N'Nguyễn Trung Kiên', N'KienNguyen@gmail.com', N'1111', 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (6, N'Hoàng Trung Hiếu', N'HieuHoang@gmail.com', N'1111', 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (7, N'Lê Tuấn Minh', N'MinhLe@gmail.com', N'1234', 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (8, N'Phạm Văn Trường Giang ', N'GiangPham@gmail.com', N'1234', 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (9, N'Nguyễn Trường Giang ', N'GiangNguyen@gmail.com', N'2222', 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (10, N'Trần Quốc Linh ', N'LinhTran@gmail.com', N'1343', 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (11, N'Admin2', N'Admin2@gmail.com', N'1234', 2, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (12, N'Nguyễn Văn Hiếu', N'HieuNguyen@gmail.com', N'1234', 1, N'0449373929     ', N'TP HCM', 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (13, N'Lê Nguyễn Tuấn Minh', N'MinhTuan@gmail.com', N'1111', 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (14, N'Trần Trung Kiên', N'KienTran@gmail.com', N'1111', 1, N'0993382929     ', N'Long An', 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (15, N'Nguyễn Quốc Phát', N'PhatNguyen@gmail.com', N'2222', 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (16, N'Lê Tâm', N'TamLe@gmail.com', N'3333', 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (17, N'Phạm Bách ', N'BachPham@gmail.com', N'4444', 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (18, N'Nguyễn Tiến Long', N'LongNguyen@gmail.con', N'1111', 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (19, N'Nguyễn Viết Xuân', N'XuanNguyen@gmail.com', N'2222', 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (20, N'Nguyễn Thị Hoa', N'HoaNguyen@gmail.com', N'1234', 1, N'0384483939     ', N'TP HCM', 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (21, N'Hoàng', N'Hoang@gmail.com', N'1111', 1, N'0404829391     ', N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (22, N'Vân', N'Van@gmail.com', N'1111', 1, N'0944932938     ', N'', 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccID], [Name], [Email], [Password], [RoleID], [Phone], [Address], [Status], [Token], [CreateDate], [UpdateDate]) VALUES (23, N'Tien', N'Tien@gmail.com', N'1111', 1, N'0944932938     ', N'', 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([BlogID], [Status], [Title], [description], [postdate]) VALUES (1, 1, N'Ý nghĩa và cách trồng cây dừa cảnh phong thủy', N'Cây dừa cảnh là một trong những loại cây phong thủy mang đến may mắn,
                bình yên cho gia chủ. Đây là một loại cây dễ trồng và chăm sóc,
                bạn có thể trồng trong vườn hoặc trong nhà đều rất thích hợp.', CAST(N'2023-02-07' AS Date))
INSERT [dbo].[Blog] ([BlogID], [Status], [Title], [description], [postdate]) VALUES (2, 1, N'Cách trồng và chăm sóc cây hoa giấy để cây luôn ra hoa', N'Cây hoa giấy là loại hoa có nét đẹp giản dị, ngoài ra nó còn có tên gọi
                khác là cây bông giấy hay móc diều, loài hoa này thuộc họ thực vật Nyctaginaceae. Tên của loài hoa này
                được đặt dựa trên đặc
                điểm bên ngoài của nó, đó là nét đẹp mỏng manh nhưng kiên cường bởi sức chịu hạn khá tốt, cho hoa quanh
                năm; hơn nữa cánh hoa của loài hoa này trông khá giống những tờ giấy mềm mại, mỏng manh.', CAST(N'2023-02-07' AS Date))
INSERT [dbo].[Blog] ([BlogID], [Status], [Title], [description], [postdate]) VALUES (3, 1, N'Cách trồng và chăm sóc cây phú quý', N'Được xem là cây mang lại những may mắn, tài lộc cho gia chủ Cây phú quý
                còn có tác dụng trang trí cho không gian sống trở nên tươi mới, điều hòa, thanh lọc không khí bảo vệ
                sức khỏe cho gia chủ. Vậy để hiểu hơn về cây phú quý chúng ta cùng tìm hiểu chi tiết về đặc điểm,
                tác dụng, ý nghĩa, cách trồng và chăm sóc cây trong nội dung dưới đây.', CAST(N'2023-02-07' AS Date))
INSERT [dbo].[Blog] ([BlogID], [Status], [Title], [description], [postdate]) VALUES (4, 1, N'Hướng dẫn cách chăm sóc cây kim tiền chi tiết nhất', N'Cây kim tiền còn có một tên gọi khác là cây phát tài, đây là một
                loài thực vật có hoa trong họ thiên nam tinh và nguồn gốc tổ tiên từ vùng nhiệt đới Châu Á. Loại cây này đang rất được ưa chuộng hiện nay vì nó có ý nghĩa
                rất lớn về mặt phong thuỷ là đem lại tài lộc, may mắn cho gia chủ của mình. Chính vì thế
                mà cây kim tiền thường được sử dụng làm cây cảnh trong văn phòng công sở, phòng khách,
                phòng hội họp, nhà hàng, khách sạn hoặc dùng làm quà tặng trong các dịp lễ tết, thăng
 chức, khai trương….', CAST(N'2023-02-07' AS Date))
INSERT [dbo].[Blog] ([BlogID], [Status], [Title], [description], [postdate]) VALUES (5, 1, N'Cách trồng hoa dạ yến thảo trang trí trên ban công', N'Ban công là không gian mà ai cũng muốn được thư giãn sau một ngày làm
                việc mệt mỏi và căng thẳng. Với một chậu hoa dạ yến thảo, ban công của bạn sẽ trở nên đẹp, sinh
 động và rực rỡ. Dạ yến thảo không chỉ đẹp mà còn có ý nghĩa thay cho lời nhắn
                nhủ rằng bạn luôn ở trong trái tim tôi và tôi sẽ luôn đồng hành bên bạn. Hoa còn thể hiện
                cho tình yêu mềm mại nhưng lại có sức sống mãnh liệt luôn vươn lên phía trước.', CAST(N'2023-02-07' AS Date))
INSERT [dbo].[Blog] ([BlogID], [Status], [Title], [description], [postdate]) VALUES (6, 1, N'Hoa mười giờ trồng trong nhà được không?', N'Hoa 10 giờ hay còn được biết đến là hoa tí ngọ hay hoa lệ nhi, là
                loại hoa có nguồn gốc từ Nam Mỹ và thường mọc ở đồng cỏ tại các làng quê Việt Nam. Hoa mười
                giờ có tên khoa học là Portulaca grandiflora, tên tiếng anh là Sun plant và thuộc họ rau sam.
                Tên gọi của hoa xuất phát từ đặc điểm nở hoa vào lúc 8 – 10 giờ sáng mùa hè của loại hoa này', CAST(N'2023-02-07' AS Date))
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogImg] ON 

INSERT [dbo].[BlogImg] ([PictureBlog_ID], [BlogID], [BlogImgPath]) VALUES (1, 1, N'img\product_img\Cay dua canh 2.jpg')
INSERT [dbo].[BlogImg] ([PictureBlog_ID], [BlogID], [BlogImgPath]) VALUES (2, 2, N'img\product_img\Hoa giay 2.jpg')
INSERT [dbo].[BlogImg] ([PictureBlog_ID], [BlogID], [BlogImgPath]) VALUES (3, 3, N'img\product_img\Cay phu quy 3.jpg')
INSERT [dbo].[BlogImg] ([PictureBlog_ID], [BlogID], [BlogImgPath]) VALUES (4, 4, N'img\product_img\Cay kim tien 1.jpg')
INSERT [dbo].[BlogImg] ([PictureBlog_ID], [BlogID], [BlogImgPath]) VALUES (5, 5, N'img\product_img\Cay da yen thao 1.jpg')
INSERT [dbo].[BlogImg] ([PictureBlog_ID], [BlogID], [BlogImgPath]) VALUES (6, 6, N'img\product_img\Hoa muoi gio 2.jpg')
SET IDENTITY_INSERT [dbo].[BlogImg] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CateID], [CategoriesName]) VALUES (1, N'Cây để bàn')
INSERT [dbo].[Categories] ([CateID], [CategoriesName]) VALUES (2, N'Cây chậu treo')
INSERT [dbo].[Categories] ([CateID], [CategoriesName]) VALUES (3, N'Cây bám tường')
INSERT [dbo].[Categories] ([CateID], [CategoriesName]) VALUES (4, N'Cây dây leo')
INSERT [dbo].[Categories] ([CateID], [CategoriesName]) VALUES (5, N'Cây công trình')
INSERT [dbo].[Categories] ([CateID], [CategoriesName]) VALUES (6, N'Cây may mắn')
INSERT [dbo].[Categories] ([CateID], [CategoriesName]) VALUES (7, N'Cây thủy sinh')
INSERT [dbo].[Categories] ([CateID], [CategoriesName]) VALUES (8, N'Cây nội thất - văn phòng')
INSERT [dbo].[Categories] ([CateID], [CategoriesName]) VALUES (9, N'Cây giống')
INSERT [dbo].[Categories] ([CateID], [CategoriesName]) VALUES (10, N'Bonsai cây cảnh')
INSERT [dbo].[Categories] ([CateID], [CategoriesName]) VALUES (11, N'Cây sân vườn')
INSERT [dbo].[Categories] ([CateID], [CategoriesName]) VALUES (12, N'Cây trồng chậu đặt')
INSERT [dbo].[Categories] ([CateID], [CategoriesName]) VALUES (13, N'Cây mọc thảm')
INSERT [dbo].[Categories] ([CateID], [CategoriesName]) VALUES (14, N' ')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoriesDetails] ON 

INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (1, 5, 1)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (2, 5, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (3, 5, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (4, 5, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (5, 5, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (6, 6, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (7, 6, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (8, 6, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (9, 6, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (10, 7, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (11, 7, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (12, 7, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (13, 8, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (14, 8, 6)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (15, 8, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (16, 8, 9)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (17, 8, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (18, 8, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (19, 9, 1)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (20, 9, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (21, 9, 6)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (22, 9, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (23, 9, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (24, 9, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (25, 10, 6)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (26, 10, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (27, 10, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (28, 10, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (29, 10, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (30, 10, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (31, 11, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (32, 11, 6)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (33, 11, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (34, 11, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (35, 11, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (36, 12, 1)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (37, 12, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (38, 12, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (39, 12, 6)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (40, 12, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (41, 12, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (42, 12, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (43, 13, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (44, 13, 1)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (45, 13, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (46, 13, 6)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (47, 13, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (48, 13, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (49, 13, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (50, 14, 1)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (51, 14, 6)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (52, 14, 7)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (53, 14, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (54, 14, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (55, 14, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (56, 15, 1)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (57, 15, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (58, 15, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (59, 15, 6)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (60, 15, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (61, 15, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (62, 15, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (63, 16, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (64, 16, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (65, 16, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (66, 17, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (67, 17, 6)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (68, 17, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (69, 17, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (70, 18, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (71, 18, 9)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (72, 18, 10)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (73, 18, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (74, 18, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (75, 19, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (76, 19, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (77, 19, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (78, 20, 1)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (79, 20, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (80, 20, 3)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (81, 20, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (82, 20, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (83, 20, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (84, 21, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (85, 21, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (86, 21, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (87, 21, 10)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (88, 22, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (89, 22, 3)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (90, 22, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (91, 22, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (92, 22, 13)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (93, 23, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (94, 23, 6)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (95, 23, 10)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (96, 23, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (97, 23, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (98, 24, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (99, 24, 4)
GO
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (100, 24, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (101, 24, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (102, 24, 13)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (103, 25, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (104, 25, 6)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (105, 25, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (106, 25, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (107, 26, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (108, 26, 3)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (109, 26, 4)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (110, 26, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (111, 26, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (112, 26, 13)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (113, 27, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (114, 27, 10)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (115, 27, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (116, 27, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (117, 28, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (118, 28, 3)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (119, 28, 4)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (120, 28, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (121, 28, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (122, 28, 13)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (123, 29, 1)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (124, 29, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (125, 29, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (126, 29, 6)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (127, 29, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (128, 29, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (129, 29, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (130, 30, 1)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (131, 30, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (132, 30, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (133, 30, 6)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (134, 30, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (135, 30, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (136, 30, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (137, 31, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (138, 31, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (139, 31, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (140, 32, 1)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (141, 32, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (142, 32, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (143, 32, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (144, 32, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (145, 32, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (146, 33, 1)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (147, 33, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (148, 33, 6)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (149, 33, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (150, 33, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (151, 33, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (152, 34, 1)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (153, 34, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (154, 34, 6)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (155, 34, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (156, 34, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (157, 34, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (158, 35, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (159, 35, 6)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (160, 35, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (161, 35, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (162, 35, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (163, 36, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (164, 36, 6)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (165, 36, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (166, 36, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (167, 36, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (168, 37, 1)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (169, 37, 2)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (170, 37, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (171, 37, 6)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (172, 37, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (173, 37, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (174, 37, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (175, 38, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (177, 38, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (178, 38, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (179, 38, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (180, 39, 5)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (181, 39, 8)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (182, 39, 11)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (183, 39, 12)
INSERT [dbo].[CategoriesDetails] ([CateDetailsID], [PlantID], [CategoriesID]) VALUES (184, 22, 4)
SET IDENTITY_INSERT [dbo].[CategoriesDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderShip], [AccID], [Status], [DiscountID], [CusAddress], [CusPhone], [CustomerName]) VALUES (3, CAST(N'2023-02-20T00:00:00.000' AS DateTime), CAST(N'2023-02-23T00:00:00.000' AS DateTime), 2, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderShip], [AccID], [Status], [DiscountID], [CusAddress], [CusPhone], [CustomerName]) VALUES (4, CAST(N'2023-02-20T00:00:00.000' AS DateTime), CAST(N'2023-03-01T00:00:00.000' AS DateTime), 5, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderShip], [AccID], [Status], [DiscountID], [CusAddress], [CusPhone], [CustomerName]) VALUES (5, CAST(N'2023-02-12T00:00:00.000' AS DateTime), CAST(N'2023-03-02T00:00:00.000' AS DateTime), 5, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderShip], [AccID], [Status], [DiscountID], [CusAddress], [CusPhone], [CustomerName]) VALUES (6, CAST(N'2023-02-12T00:00:00.000' AS DateTime), CAST(N'2023-03-02T00:00:00.000' AS DateTime), 5, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderShip], [AccID], [Status], [DiscountID], [CusAddress], [CusPhone], [CustomerName]) VALUES (7, CAST(N'2023-02-26T00:00:00.000' AS DateTime), CAST(N'2023-03-01T00:00:00.000' AS DateTime), 5, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderShip], [AccID], [Status], [DiscountID], [CusAddress], [CusPhone], [CustomerName]) VALUES (8, CAST(N'2023-02-26T00:00:00.000' AS DateTime), NULL, 5, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([DetailID], [OrderID], [PlantID], [Quantity]) VALUES (1, 3, 5, 3)
INSERT [dbo].[OrderDetail] ([DetailID], [OrderID], [PlantID], [Quantity]) VALUES (2, 3, 6, 3)
INSERT [dbo].[OrderDetail] ([DetailID], [OrderID], [PlantID], [Quantity]) VALUES (3, 3, 7, 4)
INSERT [dbo].[OrderDetail] ([DetailID], [OrderID], [PlantID], [Quantity]) VALUES (4, 4, 5, 2)
INSERT [dbo].[OrderDetail] ([DetailID], [OrderID], [PlantID], [Quantity]) VALUES (5, 4, 6, 5)
INSERT [dbo].[OrderDetail] ([DetailID], [OrderID], [PlantID], [Quantity]) VALUES (6, 4, 8, 3)
INSERT [dbo].[OrderDetail] ([DetailID], [OrderID], [PlantID], [Quantity]) VALUES (7, 5, 7, 3)
INSERT [dbo].[OrderDetail] ([DetailID], [OrderID], [PlantID], [Quantity]) VALUES (8, 5, 8, 2)
INSERT [dbo].[OrderDetail] ([DetailID], [OrderID], [PlantID], [Quantity]) VALUES (9, 5, 9, 5)
INSERT [dbo].[OrderDetail] ([DetailID], [OrderID], [PlantID], [Quantity]) VALUES (10, 6, 8, 3)
INSERT [dbo].[OrderDetail] ([DetailID], [OrderID], [PlantID], [Quantity]) VALUES (11, 6, 9, 2)
INSERT [dbo].[OrderDetail] ([DetailID], [OrderID], [PlantID], [Quantity]) VALUES (12, 6, 5, 6)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Plant] ON 

INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (5, N'Cây cỏ lan chi', 100000, N'Cây lan chi hay còn có những tên gọi khác là cây cỏ lan chi, cây thảo lan chi, cây lan bạch chỉ, cây mạng nhện, tên khoa học của nó là Chlorophytum bichetii, trong tiếng anh cây lan chi thường được mọi người gọi là spider plant. Cây thuộc họ thực vật Asphodelaceae là họ tỏi rừng có nguồn gốc xuất xứ từ châu phi, hiện nay ở Việt Nam cây này được trồng nhiều và có ở khắp mọi nơi.', 1, CAST(N'2023-02-19T00:00:00.000' AS DateTime), CAST(N'2023-03-01T07:37:58.553' AS DateTime), 100, 63, 1)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (6, N'Cây cô tòng lá đốm', 120000, N'Là cây thân gỗ bụi thường xanh quanh năm. Cây có chiều cao từ 40cm – 2 m. Lá cây có màu xanh với những đốm vàng. Khi lá còn non thì đốm vàng nhiều, khi trưởng thành đến già dần chuyển màu xanh với ít đốm vàng hơn lúc nhỏ. Cây Cô Tòng Lá Đốm gồm 2 loại một là dạng lá hình bầu dục, nhọn ở đỉnh, một loại hình lá dạng mũi kiếm hơi nhọn ở đỉnh lá. Dù là dạng nào lá cây cũng mọc xen kẽ hình xoắn ốc.', 1, CAST(N'2023-02-19T00:00:00.000' AS DateTime), CAST(N'2023-02-28T14:43:51.380' AS DateTime), 100, 65, 2)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (7, N'Cây dạ yến thảo', 100000, N'Dạ yến thảo thuộc loại cây thân thảo mềm mại. Thân nhỏ nhắn có kích thước đường kính khoảng 5mm, chiều dài thân chỉ đạt khoảng 50 – 60cm. Tuy thân mềm nhưng không thích hợp trồng dưới đất và cần giá đỡ như nhiều loài thân leo khác, mà dạ yến thảo thường được trồng trong những chiếc chậu và cây buông rủ xuống.', 1, CAST(N'2023-02-19T00:00:00.000' AS DateTime), CAST(N'2023-02-28T14:43:36.403' AS DateTime), 100, 72, 2)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (8, N'Cây dừa cảnh', 200000, N'Là một loại cây thuộc giống cây dừa nhưng có kích thước nhỏ, thân mỗi cây chỉ có bán kính từ 10cm và mọc thành nhiều nhánh con tỏa thành chùm. Cây càng lớn, càng phát triển thì phần gốc có u lớn phát triển. Lá dừa cũng có kích thước nhỏ hơn, ngắn hơn và chỉ làm cảnh, không có trái, không ăn được.', 1, CAST(N'2023-02-19T00:00:00.000' AS DateTime), NULL, 50, 44, 1)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (9, N'Cây kim tiền', 140000, N'Cây kim tiền còn được gọi là cây kim phát tài, cây phát tài, kim tiền phát lộc có nguồn gốc từ Châu Phi. Là loài cây cảnh dễ trồng, dễ chăm sóc, ít sâu bệnh, thường phổ biến trang trí trong không gian nhà hoặc văn phòng. Người ta tin rằng trồng cây kim tiền trong nhà sẽ đem lại sư may mắn, giàu có và thuận hòa cho gia chủ, giúp họ thăng tiến trong công việc.', 1, CAST(N'2023-02-19T00:00:00.000' AS DateTime), CAST(N'2023-02-28T14:49:38.767' AS DateTime), 50, 92, 2)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (10, N'Cây lan chu đinh', 150000, N'Cây Chu Đinh Lan – Loài cây có xuất xứ từ Châu Á thân thuộc này đã được biết đến ở nước ta rất lâu đời. Hiện nay có khoảng 5 loại ở Việt Nam và 60 loại cây này trên thế giới. Cây có sắc hoa tím hồng trên nền lá xanh mướt rất bắt mắt. Ngoài ra, loài cây này cũng có sức sống và sức phát triển cũng rất tốt. Nó như một nguồn sức mạnh tượng trưng cho sự kiên cường vượt qua khó khăn.', 1, CAST(N'2023-02-19T00:00:00.000' AS DateTime), NULL, 50, 52, 3)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (11, N'Cây lan mỹ ý', 200000, N'Cây Lan Ý Mỹ mọc thành bụi, cao khoảng 0,5 m, lá dạng thuôn rộng có cuống dài dạng bẹ làm thành hai thân giả gắn ở gốc. Lá cây màu xanh bóng, mặt dưới màu nhạt hơn, nổi rõ các gân mảnh xa nhau. Cụm hoa có hình mo thẳng, mặt trong hoa có màu trắng, màu xanh ở mặt ngoài. Cụm hoa dày, nạc, thẳng màu vàng nhạt dài từ 5 – 10 cm.', 1, CAST(N'2023-02-19T00:00:00.000' AS DateTime), NULL, 50, 63, 1)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (12, N'Cây lưỡi hổ vàng', 130000, N'Trong văn hóa phương đông, cây lưỡi hổ mang đến ý nghĩa cát tường, hình dáng của lá cây tựa như lưỡi kiếm, bảo vệ bạn khỏi những điều tiêu cực và thu hút sự may mắn, thành công. Sở thích trồng cây lưỡi hổ tại văn phòng cũng được cho là sẽ giúp doanh nghiệp gặt hái được nhiều thành công hơn. ', 1, CAST(N'2023-02-19T00:00:00.000' AS DateTime), NULL, 60, 52, 2)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (13, N'Cây lưỡi hổ xanh', 130000, N'Cây lưỡi hổ xanh có rất nhiều công dụng như làm đẹp không gian, cải thiện phong thủy trong gia đình. Cây lưỡi hổ xanh còn có tác dụng chữa bệnh, giúp bạn ngủ ngon hơn. Việc chăm sóc cây lưỡi hổ xanh không khó bởi cây lưỡi hổ thuộc loài cây cảnh dễ chăm sóc nhất vì nó chịu hạn rất tốt, có thể sống trong điều kiện thiếu ánh sáng, không gian hẹp. Hi vọng những thông tin bổ ích trên sẽ giúp bạn có thêm kinh nghiệm chăm sóc cây lưỡi hổ nói chung và cây lưỡi hổ xanh nói riêng.', 1, CAST(N'2023-02-19T00:00:00.000' AS DateTime), NULL, 60, 63, 3)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (14, N'Cây phát lộc', 160000, N'Cây phát lộc với ý nghĩa mang đến nhiều sự may mắn, tiền bạc cho gia chủ nên nó được rất nhiều yêu thích và chú ý, lựa chọn để trồng trong nhà hay tại phòng làm việc. Cây lộc phát có nhiều tên gọi khác nhau như là: cây phát lộc, cây phát tài phát lộc, cây trúc dụ..v..v.. Tên khoa học của loại cây này là Dracaena Sanderiana có xuất xứ ở vùng ôn đới.', 1, CAST(N'2023-02-19T00:00:00.000' AS DateTime), NULL, 60, 73, 2)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (15, N'Cây phú quý', 170000, N'Cây phú quý có tên tiếng anh là Aglaonema Red, danh pháp khoa học là Aglaonema hybrid, thuộc chi Aglaonema. Đây là giống lai tạp có nguồn gốc từ Indonesia do nhà nhà thực vật học Gregori người Indonesia đã nghiên cứu vào năm 1982 khi ông chuyển màu sắc xanh nguyên thủy của giống gốc sang màu xanh viền đỏ hiện nay.', 1, CAST(N'2023-02-19T00:00:00.000' AS DateTime), NULL, 40, 83, 1)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (16, N'Cây tía tô cảnh', 130000, N'Cây tía tô cảnh là loài cây thân thảo, có thể trồng và sống quanh năm. Cây gồm nhiều cành, mọc tạo thành bụi thấp, chiều cao khi trưởng thành khoảng 30-50 cm. Cây tía tô có nhiều màu sắc phối hợp rất rực rỡ nhất là đỏ tím, mép lá có viền màu vàng, màu xanh tươi hoặc random các màu hài hòa. Hoa tía tô cảnh thường màu trắng mọc thành cụm ở đầu cành. Hoa nhỏ li ti , lá bắc màu tía, rụng sớm. Cuống hoa ngắn.', 1, CAST(N'2023-02-19T00:00:00.000' AS DateTime), NULL, 40, 42, 3)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (17, N'Cây vạn niên thanh', 150000, N'Vạn niên thanh là loại cây thảo, xanh tốt quanh năm, thân cây dạng leo bám rất chắc vào cột ở giữa nhờ rễ, cây có nhiều đốt và có nhiều rễ con mọc từ các đốt cây. Loài cây này có lá rất to nổi bật nhờ những tán lá rộng, rậm và xanh tốt. Lá cây vạn niên thanh có dạng gần giống với lá trầu không nhưng to hơn, bề mặt lá bóng mượt, gốc lá hình trái tim, nhọn ở đầu, mặt trên lá màu xanh lục, mặt dưới thì có màu xanh nhạt hơn.', 1, CAST(N'2023-02-19T00:00:00.000' AS DateTime), NULL, 40, 63, 2)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (18, N'Cây hoa giấy', 180000, N'Cây hoa giấy hay còn được gọi với những cái tên khác là cây bông giấy, móc diều. Loài cây này có tên khoa học là Bougainvillea spectabilis, thuộc họ thực vật Nyctaginaceae. Tên hoa giấy được đặt dựa trên đặc điểm của hoa, cánh hoa mỏng manh như tờ giấy. Hoa giấy có nhiều màu sắc, chịu hạn tốt và cho hoa quanh năm. Hiện, hoa giấy được trồng ở nhiều nơi, ngoài làm cảnh thì cây hoa giấy còn có thể làm giàn che bóng mát.', 1, CAST(N'2023-02-19T00:00:00.000' AS DateTime), NULL, 70, 22, 1)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (19, N'Hoa mười giờ', 90000, N'Hoa mười giờ mọc thành từng cụm và nở hoa xen lẫn nhau dày đặc như một thảm hoa đầy màu sắc. Mỗi ngày hoa chỉ nở vào lúc 10 giờ sáng, thời gian này cũng là lúc hoa nở đẹp nhất, tươi tắn nhất, vì vậy loài hoa này được gọi với một cái tên thân thuộc, dễ nhớ là hoa mười giờ.', 1, CAST(N'2023-02-19T00:00:00.000' AS DateTime), NULL, 70, 45, 3)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (20, N'Cây dương xỉ', 100000, N'Cây dương xỉ có tên khoa học là Microsorum pteropus, cây thuộc họ Polypodiaceae và có nguồn gốc từ Châu Á. Cây dương xỉ là loại cây thân thảo, gần như không có thân mà chỉ có gốc và cành lá, cây cao trung bình khoảng từ 15 – 30cm, rộng 10 – 20cm. Cây dương xỉ có nhiều lá, lá của cây dương xỉ là lá kép có chiều dài khoảng 20 – 35cm, lá có hình dạng giống hình chiếc lược, lá non mới ra thì cuộn tròn, có lông. Lá dương xỉ trông rất đẹp và có tính thẩm mỹ cao vì thế nó hay được dùng để cắm hoa.', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 70, 52, 2)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (21, N'Cây bằng lăng', 300000, N'Cây Bằng Lăng có tên khoa học là Lagerstroemia speciosa (L.) Pers, là loài thực vật thuộc họ Tử Vi. Đây là loại cây trồng vốn có nguồn gốc từ Ấn Độ và hiện nay đang rất được phổ biến tại nhiều nước Đông Nam Á, trong đó có Việt Nam. Cây Bằng Lăng ở nước ta đang được trồng nhiều trên những con phố đô thị hoặc trong công viên với mục đích làm đẹp cảnh quan xung quanh.', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 70, 64, 2)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (22, N'Cây hoa nhài leo', 120000, N'Hoa nhài leo là loại cây bụi thân gỗ nhưng thân mềm và có nhiều cành nhánh vươn dài. Cành non có lớp lông bao phủ dày . Lá cây cũng có lông ở cả hai mặt và cũng có màu xanh bóng mỏng , cuống lá ngắn.', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 80, 52, 2)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (23, N'Cây lộc vừng', 300000, N'Cây Lộc Vừng có ý nghĩa mang đến sự may mắn về tài lộc cho gia chủ. Do vậy, nhiều người sử dụng loại cây này để làm quà biếu tặng. Lộc vừng có hoa nhỏ màu đỏ rất mềm mại và thơ mộng. Với đặc tính này, Lộc Vừng được người xưa gắn liền với ngụ ý Lộc ứng, phát lộc như vừng (mè), dồi dào và có khả năng sinh sản vô định', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 80, 23, 1)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (24, N'Cây mai hoàng yến', 120000, N'Mai hoàng yến, hay còn được biết đến với nhiều tên gọi như hoa kim đồng, cây mai nhật, kim đồng vàng, hoa ghen,… có danh pháp khoa học là Tristellateia australasiae, là một loài thực vật có hoa, thuộc họ Malpighiaceae. Chúng có nguồn gốc từ các nước Châu Á nhiệt đới (Malaysia, Australia). Đến thời điểm hiện tại, mai hoàng yến đã du nhập vào nhiều nước châu Á, trong đó có Việt Nam.', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 80, 54, 1)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (25, N'Cây thiên tuế', 130000, N'Cây thiên tuế là loại cây cảnh lâu năm, có nguồn gốc từ các nước châu Á nhiệt đới, là loại cây có thân hình trụ, thân màu nâu đậm cao từ 2 – 5m, ít phân nhánh hoặc phân cành. Thường lá mọc chủ yếu ở phía ngọn của cây.', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 80, 32, 1)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (26, N'Cây thường xuân', 130000, N'Thường xuân là loài thân thảo, thuộc bộ dây leo, có thể leo cao tới 20-30m và lan rộng ra xung quanh trông rất đẹp mắt. Thân cây có nhiều đốt, mỗi đốt sẽ mọc ra rễ phụ và lá mới nhằm giúp cây có thể lan rộng và phát triển. Cành già thì khá nhẵn, còn cành non được bao phủ bởi lớp lông mềm mại.', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 20, 15, 1)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (27, N'Cây tử đằng', 300000, N'Hoa tử đằng được biết đến là dạng cây thân leo và có lá mềm, thuôn dài khoảng 15 - 35cm, phần lá có hình lông chim mọc đối xứng nhau, lá tử đằng thường rụng vào cuối thu đầu đông và sau đó nảy chồi ra hoa. Phần rễ hoa tử đằng được biết đến thuộc loại rễ cọc, không có rễ phụ và sống rất lâu năm', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 20, 34, 3)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (28, N'Cây cúc tần Ấn Độ', 140000, N'Cây cúc tần Ấn Độ còn có một tên gọi khác là cây mành trúc và tên khoa học của loại cây này là Vernonia Eliptica. Đây là loại cây có hoa và thuộc vào họ Cúc. Loài cây này có nguồn gốc và xuất xứ đến từ Ấn Độ. Loại cây này là loại cây thân leo, chúng thường được trồng trên những giàn dây đã giăng sẵn trong nhà hoặc ngoài sân vườn. Lá của cây thon dài và rậm rạp, nếu trồng trên giàn sẽ tạo nên bóng râm rất mát mẻ.', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 20, 45, 3)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (29, N'Hoa cẩm tú cầu xanh', 150000, N'Hoa Cẩm Tú Cầu là loài thân thảo, mọc bụi và nở quanh năm. Thân cây màu xanh lục, nhỏ nhắn, có chiều cao trung bình từ 30-40cm. Lá cây có cuống dài, màu xanh lục và có gân xuất hiện nhiều ở mặt lá, mép lá có răng cưa. Bông hoa Cẩm Tú Cầu khi nở rất đẹp, có nhiều màu sắc khác nhau, bông nở tỏa thành chùm có dạng hình cầu vô cùng đặc trưng và đẹp mắt.', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 20, 63, 2)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (30, N'Hoa cẩm tú cầu hồng ', 150000, N'Hoa cẩm tú cầu hay còn được gọi với tên gọi khác là hoa cẩm tú, thuộc chi tú cầu, cẩm tú cầu tiếng anh là Hydrangea thuộc họ thực vật tú cầu (Hydrangeaceae). Cẩm tú cầu có nguồn gốc từ bản địa Đông Á và Châu Mỹ.', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 110, 32, 1)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (31, N'Hoa chiều tím', 140000, N'Chiều tím thuộc loại thân thảo, cao trung bình 80-100cm. Lá cây dài như lá lúa, màu xanh thẫm. Hoa chiều tím có màu tím đặc trưng, kích thước hoa khá nhỏ, có 5 cánh và mùi thơm na ná như mùi hoa loa kèn. Hoa thường nở vào sáng sớm và tàn lúc chiều muộn nhưng bù lại thì nở quanh năm.', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 35, 53, 2)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (32, N'Hoa hồng', 120000, N'Hoa hồng là tên gọi chung  cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu thuộc chi Rosa, họ Rosaceae – là một họ lớn trong thảm thực vật với hơn 100 loài mang những màu sắc phong phú, đa dạng phân bố từ các miền ôn đới đến nhiệt đới. Phần lớn hoa hồng có nguồn gốc từ bản địa Châu Á, số ít còn lại có nguồn từ các bản địa Châu Âu, Bắc Mỹ, Tây Bắc Phi.', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 110, 32, 3)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (33, N'Hoa lan tím', 180000, N'Hoa phong lan tím (Lan hồ điệp tím) được tìm thấy lần đầu tiên tại những khu rừng nhiệt đới của Đông Nam Á và Úc. Hoa phong lan tím thuộc họ thân thảo và sinh trưởng bằng cách bám chặt vào thân của các cây khác trong rừng sâu hoặc tại những vách đá cheo leo.', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 35, 25, 3)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (34, N'Hoa lan hồ điệp', 230000, N'Theo phong thủy phương Đông, Lan Hồ Điệp có ý nghĩa đại diện cho sự may mắn, tài lộc, sang trọng và sung túc. Còn đối với các nước Châu Âu, Lan Hồ Điệp được xem là biểu tượng của tình yêu mãnh liệt. Ngoài ra, Lan Hồ Điệp còn đại diện cho sắc đẹp của người phụ nữ, hướng đến sự hoàn hảo và quyến rũ. ', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 35, 64, 2)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (35, N'Hoa loa kèn đỏ', 150000, N'Hoa loa kèn có hệ tán lá khá phát triển. Lá cây khá mảnh, mọc ra từ củ bên dưới, vươn dài. Hoa mọc ra từ phân thân hành. Hoa không nở riêng lẻ mà mọc thành chùm gồm 2 – 3 bông nở cùng một lúc. Hoa có hình dáng giống chiếc loa kèn. Đây cũng là nguồn gốc tên của loài hoa này. Một bông hoa có 6 cánh mọc đối xứng nhau. Đài nhụy và nhị vàng mọc vươn dài đẹp mắt.', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 35, 63, 3)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (36, N'Hoa loa kèn trắng ', 180000, N'Với vẻ đẹp nhẹ nhàng, tinh khôi, loài hoa loa kèn trắng sở hữu trong mình ý nghĩa của sự đoàn tụ, có lời chúc chúng ta sẽ mãi hòa hợp cho dù mang bất cứ chuyện gì xảy ra. Chính vì thế mà hoa loa kèn rum trắng không chỉ được sử dụng phổ biến trong các không gian sống mà còn làm cho quà tặng trong các dịp đặc biệt.', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 54, 12, 2)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (37, N'Hoa mào gà', 160000, N'Hoa mào gà là loài thực vật thân thảo, có chiều cao trung bình từ 50-100cm, thân cây thẳng đứng và vỏ nhẵn. Cây hoa có lá dạng mũi mác mọc lệch nhau và dài khoảng 15-20cm. Hoa mào gà thường mọc thành cụm ở đỉnh và có hình dạng giống như chiếc mào của con gà. Hoa có nhiều màu sắc khác nhau nhưng chủ yếu là màu đỏ, vàng hoặc trắng.', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 54, 46, 1)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (38, N'Hoa quỳnh anh tím', 180000, N'Quỳnh Anh là loại hoa có tên trong khoa học là Allamanda Cathartica, tên trong hán ngữ là Nhuyễn Chi Hoàng Thiền. Và có tên trong tiếng Anh là Yellow Bell, Golden Trumpet hoặc Buttercup Flower. Ở Việt Nam thì tên chính xác của loài hoa này là cây Quỳnh Anh, nhiều nơi gọi tên khác là cây Huỳnh Anh, Hoàng Anh, dây Huỳnh, hay dây công chúa,….', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 54, 74, 3)
INSERT [dbo].[Plant] ([PID], [NamePlant], [price], [description], [Status], [CreateDate], [UpdateDate], [stock], [sold], [saleID]) VALUES (39, N'Hoa quỳnh anh vàng', 160000, N'Hoa Huỳnh Anh là loài thân thảo, khi được trồng trong chậu thì chúng có chiều cao trung bình từ 50-80cm, chúng mọc bờ bụi và thường bắt đầu nở từ đầu mùa xuân kể từ tháng 2. Thân cây Huỳnh Anh có khả năng phát triển thành dạng dây leo, cành có nhựa màu trắng. Lá của cây hoa là lá đơn, có màu xanh lục và rất mỏng. Khi hoa Huỳnh Anh mới phát triển thì lá cây có màu hồng xanh.', 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL, 47, 42, 2)
SET IDENTITY_INSERT [dbo].[Plant] OFF
GO
SET IDENTITY_INSERT [dbo].[PlantImg] ON 

INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (1, 5, N'img\product_img\Cay co lan chi 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (2, 5, N'img\product_img\Cay co lan chi 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (3, 5, N'img\product_img\Cay co lan chi 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (4, 6, N'img\product_img\Cay co tong dom vang 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (5, 6, N'img\product_img\Cay co tong dom vang 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (6, 6, N'img\product_img\Cay co tong dom vang 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (7, 7, N'img\product_img\Cay da yen thao 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (8, 7, N'img\product_img\Cay da yen thao 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (9, 7, N'img\product_img\Cay da yen thao 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (10, 8, N'img\product_img\Cay dua canh 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (11, 8, N'img\product_img\Cay dua canh 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (12, 8, N'img\product_img\Cay dua canh 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (13, 9, N'img\product_img\Cay kim tien 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (14, 9, N'img\product_img\Cay kim tien 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (15, 9, N'img\product_img\Cay kim tien 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (16, 10, N'img\product_img\Cay lan chu dinh 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (17, 10, N'img\product_img\Cay lan chu dinh 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (18, 10, N'img\product_img\Cay lan chu dinh 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (19, 11, N'img\product_img\Cay lan y my 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (20, 11, N'img\product_img\Cay lan y my 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (21, 11, N'img\product_img\Cay lan y my 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (22, 12, N'img\product_img\Cay luoi ho vang 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (23, 12, N'img\product_img\Cay luoi ho vang 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (24, 12, N'img\product_img\Cay luoi ho vang 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (25, 13, N'img\product_img\Cay luoi ho xanh 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (26, 13, N'img\product_img\Cay luoi ho xanh 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (27, 13, N'img\product_img\Cay luoi ho xanh 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (28, 14, N'img\product_img\Cay phat loc 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (29, 14, N'img\product_img\Cay phat loc 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (30, 14, N'img\product_img\Cay phat loc 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (31, 15, N'img\product_img\Cay phu quy 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (32, 15, N'img\product_img\Cay phu quy 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (33, 15, N'img\product_img\Cay phu quy 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (34, 16, N'img\product_img\Cay tia to canh 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (35, 16, N'img\product_img\Cay tia to canh 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (36, 16, N'img\product_img\Cay tia to canh 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (37, 17, N'img\product_img\Cay van nien thanh 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (38, 17, N'img\product_img\Cay van nien thanh 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (39, 17, N'img\product_img\Cay van nien thanh 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (40, 18, N'img\product_img\Hoa giay 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (41, 18, N'img\product_img\Hoa giay 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (42, 18, N'img\product_img\Hoa giay 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (43, 19, N'img\product_img\Hoa muoi gio 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (44, 19, N'img\product_img\Hoa muoi gio 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (45, 19, N'img\product_img\Hoa muoi gio 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (46, 20, N'img\product_img\cay duong xi 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (47, 20, N'img\product_img\cay duong xi 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (48, 20, N'img\product_img\cay duong xi 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (49, 21, N'img\product_img\cay hoa bang lang 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (50, 21, N'img\product_img\cay hoa bang lang 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (51, 21, N'img\product_img\cay hoa bang lang 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (52, 22, N'img\product_img\cay hoa nhai leo 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (53, 22, N'img\product_img\cay hoa nhai leo 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (54, 22, N'img\product_img\cay hoa nhai leo 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (55, 22, N'img\product_img\cay hoa nhai leo 4.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (56, 23, N'img\product_img\cay loc vung 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (57, 23, N'img\product_img\cay loc vung 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (58, 23, N'img\product_img\cay loc vung 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (59, 24, N'img\product_img\cay mai hoang yen 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (60, 24, N'img\product_img\cay mai hoang yen 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (61, 24, N'img\product_img\cay mai hoang yen 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (62, 24, N'img\product_img\cay mai hoang yen 4.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (63, 25, N'img\product_img\cay thien tue 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (64, 25, N'img\product_img\cay thien tue 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (65, 25, N'img\product_img\cay thien tue 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (66, 25, N'img\product_img\cay thien tue 4.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (67, 26, N'img\product_img\cay thuong xuan 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (68, 26, N'img\product_img\cay thuong xuan 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (69, 26, N'img\product_img\cay thuong xuan 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (70, 26, N'img\product_img\cay thuong xuan 4.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (71, 26, N'img\product_img\cay thuong xuan 5.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (72, 27, N'img\product_img\cay tu dang 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (73, 27, N'img\product_img\cay tu dang 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (74, 27, N'img\product_img\cay tu dang 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (75, 27, N'img\product_img\cay tu dang 4.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (76, 28, N'img\product_img\cuc tan an do 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (77, 28, N'img\product_img\cuc tan an do 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (78, 28, N'img\product_img\cuc tan an do 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (79, 29, N'img\product_img\hoa cam tu cau xanh 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (80, 29, N'img\product_img\hoa cam tu cau xanh 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (81, 29, N'img\product_img\hoa cam tu cau xanh 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (82, 30, N'img\product_img\hoa cam tu cau hong 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (83, 30, N'img\product_img\hoa cam tu cau hong 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (84, 30, N'img\product_img\hoa cam tu cau hong 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (85, 31, N'img\product_img\hoa chieu tim 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (86, 31, N'img\product_img\hoa chieu tim 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (87, 31, N'img\product_img\hoa chieu tim 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (88, 31, N'img\product_img\hoa chieu tim 4.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (89, 32, N'img\product_img\hoa hong 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (90, 32, N'img\product_img\hoa hong 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (91, 32, N'img\product_img\hoa hong 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (92, 33, N'img\product_img\hoa lan tim 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (93, 33, N'img\product_img\hoa lan tim 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (94, 33, N'img\product_img\hoa lan tim 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (95, 33, N'img\product_img\hoa lan tim 4.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (96, 34, N'img\product_img\lan ho diep 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (97, 34, N'img\product_img\lan ho diep 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (98, 34, N'img\product_img\lan ho diep 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (99, 35, N'img\product_img\hoa loa ken do 1.jpg')
GO
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (100, 35, N'img\product_img\hoa loa ken do 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (101, 35, N'img\product_img\hoa loa ken do 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (102, 36, N'img\product_img\hoa loa ken trang 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (103, 36, N'img\product_img\hoa loa ken trang 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (104, 36, N'img\product_img\hoa loa ken trang 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (105, 37, N'img\product_img\hoa mao ga 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (106, 37, N'img\product_img\hoa mao ga 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (107, 37, N'img\product_img\hoa mao ga 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (108, 38, N'img\product_img\hoa quynh anh tim 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (109, 38, N'img\product_img\hoa quynh anh tim 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (110, 38, N'img\product_img\hoa quynh anh tim 3.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (111, 39, N'img\product_img\hoa quynh anh vang 1.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (112, 39, N'img\product_img\hoa quynh anh vang 2.jpg')
INSERT [dbo].[PlantImg] ([PicturePlant_ID], [PID], [PlantimgPath]) VALUES (113, 39, N'img\product_img\hoa quynh anh vang 3.jpg')
SET IDENTITY_INSERT [dbo].[PlantImg] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'User')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([SaleID], [Salepercent], [Saledes]) VALUES (1, 0, NULL)
INSERT [dbo].[Sale] ([SaleID], [Salepercent], [Saledes]) VALUES (2, 5, NULL)
INSERT [dbo].[Sale] ([SaleID], [Salepercent], [Saledes]) VALUES (3, 10, NULL)
INSERT [dbo].[Sale] ([SaleID], [Salepercent], [Saledes]) VALUES (4, 15, NULL)
INSERT [dbo].[Sale] ([SaleID], [Salepercent], [Saledes]) VALUES (5, 20, NULL)
INSERT [dbo].[Sale] ([SaleID], [Salepercent], [Saledes]) VALUES (6, 25, NULL)
INSERT [dbo].[Sale] ([SaleID], [Salepercent], [Saledes]) VALUES (7, 30, NULL)
INSERT [dbo].[Sale] ([SaleID], [Salepercent], [Saledes]) VALUES (8, 35, NULL)
INSERT [dbo].[Sale] ([SaleID], [Salepercent], [Saledes]) VALUES (9, 40, NULL)
INSERT [dbo].[Sale] ([SaleID], [Salepercent], [Saledes]) VALUES (10, 45, NULL)
INSERT [dbo].[Sale] ([SaleID], [Salepercent], [Saledes]) VALUES (11, 50, NULL)
INSERT [dbo].[Sale] ([SaleID], [Salepercent], [Saledes]) VALUES (12, 55, NULL)
INSERT [dbo].[Sale] ([SaleID], [Salepercent], [Saledes]) VALUES (13, 60, NULL)
INSERT [dbo].[Sale] ([SaleID], [Salepercent], [Saledes]) VALUES (14, 65, NULL)
INSERT [dbo].[Sale] ([SaleID], [Salepercent], [Saledes]) VALUES (15, 70, NULL)
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[WishList] ON 

INSERT [dbo].[WishList] ([WishID], [AccID], [PID]) VALUES (1, 2, 5)
SET IDENTITY_INSERT [dbo].[WishList] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK__Account__RoleID__3E52440B] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK__Account__RoleID__3E52440B]
GO
ALTER TABLE [dbo].[Auction]  WITH CHECK ADD  CONSTRAINT [FK__Auction__PlantID__49C3F6B7] FOREIGN KEY([PlantID])
REFERENCES [dbo].[Plant] ([PID])
GO
ALTER TABLE [dbo].[Auction] CHECK CONSTRAINT [FK__Auction__PlantID__49C3F6B7]
GO
ALTER TABLE [dbo].[Auction]  WITH CHECK ADD  CONSTRAINT [FK_Auction_AuctionPlant] FOREIGN KEY([PlantID])
REFERENCES [dbo].[AuctionPlant] ([PlantAuctionID])
GO
ALTER TABLE [dbo].[Auction] CHECK CONSTRAINT [FK_Auction_AuctionPlant]
GO
ALTER TABLE [dbo].[AuctionDetails]  WITH CHECK ADD  CONSTRAINT [FK_AuctionDetails_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccID])
GO
ALTER TABLE [dbo].[AuctionDetails] CHECK CONSTRAINT [FK_AuctionDetails_Account]
GO
ALTER TABLE [dbo].[AuctionDetails]  WITH CHECK ADD  CONSTRAINT [FK_AuctionDetails_Auction] FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auction] ([AuctionID])
GO
ALTER TABLE [dbo].[AuctionDetails] CHECK CONSTRAINT [FK_AuctionDetails_Auction]
GO
ALTER TABLE [dbo].[bid]  WITH CHECK ADD  CONSTRAINT [FK__bid__AccID__4AB81AF0] FOREIGN KEY([AccID])
REFERENCES [dbo].[Account] ([AccID])
GO
ALTER TABLE [dbo].[bid] CHECK CONSTRAINT [FK__bid__AccID__4AB81AF0]
GO
ALTER TABLE [dbo].[bid]  WITH CHECK ADD FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auction] ([AuctionID])
GO
ALTER TABLE [dbo].[BlogImg]  WITH CHECK ADD  CONSTRAINT [FK__BlogImg__BlogID__4316F928] FOREIGN KEY([BlogID])
REFERENCES [dbo].[Blog] ([BlogID])
GO
ALTER TABLE [dbo].[BlogImg] CHECK CONSTRAINT [FK__BlogImg__BlogID__4316F928]
GO
ALTER TABLE [dbo].[CategoriesDetails]  WITH CHECK ADD  CONSTRAINT [FK_CategoriesDetails_Categories] FOREIGN KEY([CategoriesID])
REFERENCES [dbo].[Categories] ([CateID])
GO
ALTER TABLE [dbo].[CategoriesDetails] CHECK CONSTRAINT [FK_CategoriesDetails_Categories]
GO
ALTER TABLE [dbo].[CategoriesDetails]  WITH CHECK ADD  CONSTRAINT [FK_CategoriesDetails_Plant] FOREIGN KEY([PlantID])
REFERENCES [dbo].[Plant] ([PID])
GO
ALTER TABLE [dbo].[CategoriesDetails] CHECK CONSTRAINT [FK_CategoriesDetails_Plant]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK__Feedback__AccID__44FF419A] FOREIGN KEY([AccID])
REFERENCES [dbo].[Account] ([AccID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK__Feedback__AccID__44FF419A]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__AccID__3D5E1FD2] FOREIGN KEY([AccID])
REFERENCES [dbo].[Account] ([AccID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__AccID__3D5E1FD2]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__DiscountI__45F365D3] FOREIGN KEY([DiscountID])
REFERENCES [dbo].[Discount] ([DiscountID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__DiscountI__45F365D3]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Order__3F466844] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__Order__3F466844]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Plant__403A8C7D] FOREIGN KEY([PlantID])
REFERENCES [dbo].[Plant] ([PID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__Plant__403A8C7D]
GO
ALTER TABLE [dbo].[Plant]  WITH CHECK ADD  CONSTRAINT [FK_Plant_Sale] FOREIGN KEY([saleID])
REFERENCES [dbo].[Sale] ([SaleID])
GO
ALTER TABLE [dbo].[Plant] CHECK CONSTRAINT [FK_Plant_Sale]
GO
ALTER TABLE [dbo].[PlantImg]  WITH CHECK ADD  CONSTRAINT [FK__PlantImg__PID__4222D4EF] FOREIGN KEY([PID])
REFERENCES [dbo].[Plant] ([PID])
GO
ALTER TABLE [dbo].[PlantImg] CHECK CONSTRAINT [FK__PlantImg__PID__4222D4EF]
GO
ALTER TABLE [dbo].[Vote]  WITH CHECK ADD  CONSTRAINT [FK__Vote__AccID__46E78A0C] FOREIGN KEY([AccID])
REFERENCES [dbo].[Account] ([AccID])
GO
ALTER TABLE [dbo].[Vote] CHECK CONSTRAINT [FK__Vote__AccID__46E78A0C]
GO
ALTER TABLE [dbo].[Vote]  WITH CHECK ADD  CONSTRAINT [FK__Vote__PID__440B1D61] FOREIGN KEY([PID])
REFERENCES [dbo].[Plant] ([PID])
GO
ALTER TABLE [dbo].[Vote] CHECK CONSTRAINT [FK__Vote__PID__440B1D61]
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD  CONSTRAINT [FK__WishList__AccID__47DBAE45] FOREIGN KEY([AccID])
REFERENCES [dbo].[Account] ([AccID])
GO
ALTER TABLE [dbo].[WishList] CHECK CONSTRAINT [FK__WishList__AccID__47DBAE45]
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD  CONSTRAINT [FK__WishList__PID__48CFD27E] FOREIGN KEY([PID])
REFERENCES [dbo].[Plant] ([PID])
GO
ALTER TABLE [dbo].[WishList] CHECK CONSTRAINT [FK__WishList__PID__48CFD27E]
GO
USE [master]
GO
ALTER DATABASE [Treer] SET  READ_WRITE 
GO
