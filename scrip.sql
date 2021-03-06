USE [master]
GO
/****** Object:  Database [MVC]    Script Date: 7/15/2020 7:03:37 PM ******/
CREATE DATABASE [MVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MVC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MVC.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MVC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MVC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MVC] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [MVC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MVC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MVC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MVC] SET RECOVERY FULL 
GO
ALTER DATABASE [MVC] SET  MULTI_USER 
GO
ALTER DATABASE [MVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MVC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MVC] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MVC', N'ON'
GO
USE [MVC]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 7/15/2020 7:03:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](50) NOT NULL,
	[CartID] [int] NOT NULL,
	[Quantity] [float] NOT NULL,
 CONSTRAINT [PK_Bill_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 7/15/2020 7:03:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[CustomerAddress] [nvarchar](100) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Amount] [float] NOT NULL,
 CONSTRAINT [PK_CartItem_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Items]    Script Date: 7/15/2020 7:03:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemName] [nvarchar](50) NOT NULL,
	[ItemPrice] [float] NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserDetail]    Script Date: 7/15/2020 7:03:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetail](
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](30) NOT NULL,
	[lastname] [nvarchar](50) NOT NULL,
	[isAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_UserDetail] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([ID], [ItemName], [CartID], [Quantity]) VALUES (23, N'KIA', 1, 1)
INSERT [dbo].[Bill] ([ID], [ItemName], [CartID], [Quantity]) VALUES (24, N'BMW', 1, 2)
INSERT [dbo].[Bill] ([ID], [ItemName], [CartID], [Quantity]) VALUES (25, N'KIA', 2, 1)
INSERT [dbo].[Bill] ([ID], [ItemName], [CartID], [Quantity]) VALUES (26, N'KIA', 3, 1)
INSERT [dbo].[Bill] ([ID], [ItemName], [CartID], [Quantity]) VALUES (27, N'Toyota', 3, 2)
INSERT [dbo].[Bill] ([ID], [ItemName], [CartID], [Quantity]) VALUES (28, N'BMW', 3, 1)
INSERT [dbo].[Bill] ([ID], [ItemName], [CartID], [Quantity]) VALUES (29, N'KIA', 4, 2)
INSERT [dbo].[Bill] ([ID], [ItemName], [CartID], [Quantity]) VALUES (30, N'Bugatti', 4, 1)
INSERT [dbo].[Bill] ([ID], [ItemName], [CartID], [Quantity]) VALUES (31, N'KIA', 5, 1)
INSERT [dbo].[Bill] ([ID], [ItemName], [CartID], [Quantity]) VALUES (32, N'Bugatti', 5, 1)
INSERT [dbo].[Bill] ([ID], [ItemName], [CartID], [Quantity]) VALUES (33, N'KIA', 6, 2)
INSERT [dbo].[Bill] ([ID], [ItemName], [CartID], [Quantity]) VALUES (34, N'Bugatti', 7, 2)
INSERT [dbo].[Bill] ([ID], [ItemName], [CartID], [Quantity]) VALUES (35, N'Honda', 7, 1)
INSERT [dbo].[Bill] ([ID], [ItemName], [CartID], [Quantity]) VALUES (36, N'Bugatti', 8, 1)
INSERT [dbo].[Bill] ([ID], [ItemName], [CartID], [Quantity]) VALUES (37, N'Honda', 8, 1)
INSERT [dbo].[Bill] ([ID], [ItemName], [CartID], [Quantity]) VALUES (38, N'KIA', 9, 1)
INSERT [dbo].[Bill] ([ID], [ItemName], [CartID], [Quantity]) VALUES (39, N'KIA', 10, 2)
INSERT [dbo].[Bill] ([ID], [ItemName], [CartID], [Quantity]) VALUES (40, N'Bugatti', 10, 1)
INSERT [dbo].[Bill] ([ID], [ItemName], [CartID], [Quantity]) VALUES (41, N'Honda', 10, 1)
SET IDENTITY_INSERT [dbo].[Bill] OFF
SET IDENTITY_INSERT [dbo].[CartItem] ON 

INSERT [dbo].[CartItem] ([ID], [CustomerName], [CustomerAddress], [Date], [Amount]) VALUES (1, N'Nguyen', N'Quan 12', CAST(N'2020-07-14 16:29:05.707' AS DateTime), 22000)
INSERT [dbo].[CartItem] ([ID], [CustomerName], [CustomerAddress], [Date], [Amount]) VALUES (2, N'Nguyen', N'Quan12', CAST(N'2020-07-14 16:30:19.470' AS DateTime), 2000)
INSERT [dbo].[CartItem] ([ID], [CustomerName], [CustomerAddress], [Date], [Amount]) VALUES (3, N'Nguyen', N'Quan 12', CAST(N'2020-07-15 15:07:51.510' AS DateTime), 16000)
INSERT [dbo].[CartItem] ([ID], [CustomerName], [CustomerAddress], [Date], [Amount]) VALUES (4, N'1', N'1', CAST(N'2020-07-15 16:29:12.423' AS DateTime), 24000)
INSERT [dbo].[CartItem] ([ID], [CustomerName], [CustomerAddress], [Date], [Amount]) VALUES (5, N'Nguyen dep trai', N'quan 12', CAST(N'2020-07-15 16:39:18.437' AS DateTime), 22000)
INSERT [dbo].[CartItem] ([ID], [CustomerName], [CustomerAddress], [Date], [Amount]) VALUES (6, N'Nguyen', N'Quan 12', CAST(N'2020-07-15 17:13:09.827' AS DateTime), 4000)
INSERT [dbo].[CartItem] ([ID], [CustomerName], [CustomerAddress], [Date], [Amount]) VALUES (7, N'Nguyen', N'Quan 6', CAST(N'2020-07-15 17:23:28.577' AS DateTime), 45000)
INSERT [dbo].[CartItem] ([ID], [CustomerName], [CustomerAddress], [Date], [Amount]) VALUES (8, N'Nguyen', N'Quan 2', CAST(N'2020-07-15 17:25:36.197' AS DateTime), 25000)
INSERT [dbo].[CartItem] ([ID], [CustomerName], [CustomerAddress], [Date], [Amount]) VALUES (9, N'Nguyen ne', N'Quan 9', CAST(N'2020-07-15 18:02:54.117' AS DateTime), 2000)
INSERT [dbo].[CartItem] ([ID], [CustomerName], [CustomerAddress], [Date], [Amount]) VALUES (10, N'nguyen nua', N'Quan 3', CAST(N'2020-07-15 18:06:58.797' AS DateTime), 29000)
SET IDENTITY_INSERT [dbo].[CartItem] OFF
INSERT [dbo].[Items] ([ItemName], [ItemPrice]) VALUES (N'BMW', 10000)
INSERT [dbo].[Items] ([ItemName], [ItemPrice]) VALUES (N'Bugatti', 20000)
INSERT [dbo].[Items] ([ItemName], [ItemPrice]) VALUES (N'Honda', 5000)
INSERT [dbo].[Items] ([ItemName], [ItemPrice]) VALUES (N'KIA', 2000)
INSERT [dbo].[Items] ([ItemName], [ItemPrice]) VALUES (N'Toyota', 2000)
INSERT [dbo].[UserDetail] ([Username], [Password], [lastname], [isAdmin]) VALUES (N'admin', N'123456', N'nguyen ne', 1)
INSERT [dbo].[UserDetail] ([Username], [Password], [lastname], [isAdmin]) VALUES (N'admin1', N'123456', N'Phan Si Nguyen', 1)
INSERT [dbo].[UserDetail] ([Username], [Password], [lastname], [isAdmin]) VALUES (N'user1', N'123456', N'Nguyen Dep Trai', 1)
INSERT [dbo].[UserDetail] ([Username], [Password], [lastname], [isAdmin]) VALUES (N'user2', N'nguyen', N'nguyen nua ne', 0)
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_CartItem] FOREIGN KEY([CartID])
REFERENCES [dbo].[CartItem] ([ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_CartItem]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Items] FOREIGN KEY([ItemName])
REFERENCES [dbo].[Items] ([ItemName])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Items]
GO
USE [master]
GO
ALTER DATABASE [MVC] SET  READ_WRITE 
GO
