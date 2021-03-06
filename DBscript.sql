USE [master]
GO
/****** Object:  Database [MemoryGame]    Script Date: 30/11/2018 15:13:07 ******/
CREATE DATABASE [MemoryGame]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MemoryGame', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\MemoryGame.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MemoryGame_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\MemoryGame_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MemoryGame] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MemoryGame].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MemoryGame] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MemoryGame] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MemoryGame] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MemoryGame] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MemoryGame] SET ARITHABORT OFF 
GO
ALTER DATABASE [MemoryGame] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MemoryGame] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MemoryGame] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MemoryGame] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MemoryGame] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MemoryGame] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MemoryGame] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MemoryGame] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MemoryGame] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MemoryGame] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MemoryGame] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MemoryGame] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MemoryGame] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MemoryGame] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MemoryGame] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MemoryGame] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MemoryGame] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MemoryGame] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MemoryGame] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MemoryGame] SET  MULTI_USER 
GO
ALTER DATABASE [MemoryGame] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MemoryGame] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MemoryGame] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MemoryGame] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [MemoryGame]
GO
/****** Object:  Table [dbo].[ContactMessage]    Script Date: 30/11/2018 15:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactMessage](
	[MessageId] [int] IDENTITY(1,1) NOT NULL,
	[MessageDateTime] [datetime] NOT NULL,
	[PhoneNumber] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[MessageText] [varchar](500) NOT NULL,
 CONSTRAINT [PK_ContactMessage] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 30/11/2018 15:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FeedbackDateTime] [datetime] NOT NULL,
	[FeedbackText] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GameResult]    Script Date: 30/11/2018 15:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameResult](
	[GameId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[GameDateTime] [datetime] NOT NULL,
	[GameDuration] [bigint] NOT NULL,
	[CountOfSteps] [int] NOT NULL,
 CONSTRAINT [PK_GameResult] PRIMARY KEY CLUSTERED 
(
	[GameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Images]    Script Date: 30/11/2018 15:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Images](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 30/11/2018 15:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[BirthDate] [date] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ContactMessage] ON 

GO
INSERT [dbo].[ContactMessage] ([MessageId], [MessageDateTime], [PhoneNumber], [Email], [MessageText]) VALUES (2, CAST(0x0000A9A70131D224 AS DateTime), NULL, NULL, N'sdfdsf')
GO
SET IDENTITY_INSERT [dbo].[ContactMessage] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

GO
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDateTime], [FeedbackText]) VALUES (2, 1010, CAST(0x0000A9A70137D6EC AS DateTime), N'אהבתי מאוד את המשחק!
אני פשוט לא יכול להפסיק לשחק!')
GO
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDateTime], [FeedbackText]) VALUES (3, 1010, CAST(0x0000A9A7013AB4CE AS DateTime), N'מפתח מאוד את הזיכרון!
שלחתי לכל החברים שלי את המשחק.')
GO
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDateTime], [FeedbackText]) VALUES (5, 1010, CAST(0x0000A9A800F96517 AS DateTime), N'אהבתי!')
GO
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[GameResult] ON 

GO
INSERT [dbo].[GameResult] ([GameId], [UserId], [GameDateTime], [GameDuration], [CountOfSteps]) VALUES (1, 1010, CAST(0x0000A9A701072D18 AS DateTime), 12007, 8)
GO
INSERT [dbo].[GameResult] ([GameId], [UserId], [GameDateTime], [GameDuration], [CountOfSteps]) VALUES (2, 1010, CAST(0x0000A9A70110EA1F AS DateTime), 1301, 8)
GO
INSERT [dbo].[GameResult] ([GameId], [UserId], [GameDateTime], [GameDuration], [CountOfSteps]) VALUES (3, 1010, CAST(0x0000A9A70113AB18 AS DateTime), 7208, 9)
GO
INSERT [dbo].[GameResult] ([GameId], [UserId], [GameDateTime], [GameDuration], [CountOfSteps]) VALUES (4, 1010, CAST(0x0000A9A70137272B AS DateTime), 4903, 25)
GO
INSERT [dbo].[GameResult] ([GameId], [UserId], [GameDateTime], [GameDuration], [CountOfSteps]) VALUES (5, 1010, CAST(0x0000A9A800EDF005 AS DateTime), 6407, 29)
GO
INSERT [dbo].[GameResult] ([GameId], [UserId], [GameDateTime], [GameDuration], [CountOfSteps]) VALUES (6, 1010, CAST(0x0000A9A800F2E95A AS DateTime), 7000, 33)
GO
INSERT [dbo].[GameResult] ([GameId], [UserId], [GameDateTime], [GameDuration], [CountOfSteps]) VALUES (7, 1010, CAST(0x0000A9A800F92C4A AS DateTime), 7103, 30)
GO
SET IDENTITY_INSERT [dbo].[GameResult] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

GO
INSERT [dbo].[Images] ([ImageId], [ImageName]) VALUES (1, N'1.png')
GO
INSERT [dbo].[Images] ([ImageId], [ImageName]) VALUES (2, N'2.jpg')
GO
INSERT [dbo].[Images] ([ImageId], [ImageName]) VALUES (3, N'3.jpg')
GO
INSERT [dbo].[Images] ([ImageId], [ImageName]) VALUES (4, N'4.png')
GO
INSERT [dbo].[Images] ([ImageId], [ImageName]) VALUES (5, N'5.png')
GO
INSERT [dbo].[Images] ([ImageId], [ImageName]) VALUES (6, N'6.png')
GO
INSERT [dbo].[Images] ([ImageId], [ImageName]) VALUES (7, N'7.png')
GO
INSERT [dbo].[Images] ([ImageId], [ImageName]) VALUES (8, N'8.png')
GO
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([UserId], [FullName], [UserName], [Password], [Email], [BirthDate]) VALUES (1010, N'ישראל ישראלי', N'israel', N'israel', N'usrael@gmail.con', NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__C9F2845614E59D71]    Script Date: 30/11/2018 15:13:08 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Users]
GO
ALTER TABLE [dbo].[GameResult]  WITH CHECK ADD  CONSTRAINT [FK_GameResult_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[GameResult] CHECK CONSTRAINT [FK_GameResult_Users]
GO
USE [master]
GO
ALTER DATABASE [MemoryGame] SET  READ_WRITE 
GO
