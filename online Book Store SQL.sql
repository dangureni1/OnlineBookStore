USE [OnlineBooksStore]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 05/12/2021 9:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Address_Id] [int] IDENTITY(1,1) NOT NULL,
	[StreetName] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[AddressCalc]  AS (([StreetName]+', ')+[City]),
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Address_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/12/2021 9:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Hash] [nvarchar](max) NULL,
	[Salt] [nvarchar](max) NULL,
	[IsAdmin] [bit] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Age] [int] NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 05/12/2021 9:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Authors_Id] [int] IDENTITY(1,1) NOT NULL,
	[Address_Id] [int] NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Age] [int] NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Authors_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 05/12/2021 9:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[PayMethod] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NULL,
	[User_Id] [int] NOT NULL,
	[Address_Id] [int] NOT NULL,
	[Book_Id] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 05/12/2021 9:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Book_Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[DatePublished] [datetime2](7) NOT NULL,
	[Gendre] [nvarchar](max) NULL,
	[User_Id] [int] NULL,
	[Author_Id] [int] NULL,
	[Order_Id] [int] NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Book_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[OrderDetailView]    Script Date: 05/12/2021 9:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[OrderDetailView] AS
SELECT       dbo.Orders.Order_Id AS Order_Number, dbo.Orders.OrderDate, dbo.Orders.PayMethod, dbo.Books.Price AS Book_Price, dbo.Orders.Status AS Order_Status, dbo.Users.Name AS User_Name, dbo.Books.Title AS Book_Title, 
                         dbo.Addresses.AddressCalc AS ShipingAdress, dbo.Authors.Name AS Author_Name
FROM            dbo.Orders INNER JOIN
                         dbo.Users ON dbo.Users.UserId = dbo.Orders.User_Id INNER JOIN
                         dbo.Books ON dbo.Books.Book_Id = dbo.Orders.Book_Id INNER JOIN
                         dbo.Authors ON dbo.Authors.Authors_Id = dbo.Books.Author_Id INNER JOIN
                         dbo.Addresses ON dbo.Addresses.Address_Id = dbo.Orders.Address_Id;
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([Address_Id], [StreetName], [City]) VALUES (1, N'Herzel 3', N'Petah tikva')
INSERT [dbo].[Addresses] ([Address_Id], [StreetName], [City]) VALUES (2, N'Ben Gurion 14', N'Tel Aviv')
INSERT [dbo].[Addresses] ([Address_Id], [StreetName], [City]) VALUES (3, N'Herzel 6', N'Tel Aviv')
INSERT [dbo].[Addresses] ([Address_Id], [StreetName], [City]) VALUES (4, N'Hilel 13', N'Ramat Gan')
INSERT [dbo].[Addresses] ([Address_Id], [StreetName], [City]) VALUES (5, N'Yanviel 3', N'Ramat Gan')
INSERT [dbo].[Addresses] ([Address_Id], [StreetName], [City]) VALUES (6, N'Michal 11', N'Eilat')
INSERT [dbo].[Addresses] ([Address_Id], [StreetName], [City]) VALUES (7, N'Begin 1', N'Lod')
INSERT [dbo].[Addresses] ([Address_Id], [StreetName], [City]) VALUES (8, N'Yahlom 34', N'Ramat Gan')
INSERT [dbo].[Addresses] ([Address_Id], [StreetName], [City]) VALUES (9, N'Hayarkon 12', N'Hod Hasharon')
INSERT [dbo].[Addresses] ([Address_Id], [StreetName], [City]) VALUES (10, N'Krinizi 111', N'Ramat Gan')
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([Authors_Id], [Address_Id], [Name], [Age], [PhoneNumber], [Email]) VALUES (1, 2, N'Avi Ben David', 32, N'0543756239', N'AviBenDavid@gmail.com')
INSERT [dbo].[Authors] ([Authors_Id], [Address_Id], [Name], [Age], [PhoneNumber], [Email]) VALUES (2, 1, N'Moshe Levi', 44, N'0504632451', N'MosheLevi@gmail.com')
INSERT [dbo].[Authors] ([Authors_Id], [Address_Id], [Name], [Age], [PhoneNumber], [Email]) VALUES (3, 7, N'Ben Caspit', 23, N'0509876789', N'BenCaspit@gmail.com')
INSERT [dbo].[Authors] ([Authors_Id], [Address_Id], [Name], [Age], [PhoneNumber], [Email]) VALUES (4, 8, N'Yuri Lovenski', 56, N'0509874789', N'YuriLovenski@gmail.com')
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Book_Id], [Title], [DatePublished], [Gendre], [User_Id], [Author_Id], [Order_Id], [Price]) VALUES (1, N'Harry Potter', CAST(N'2002-12-04T00:00:00.0000000' AS DateTime2), N'Fiction', NULL, 4, NULL, 148)
INSERT [dbo].[Books] ([Book_Id], [Title], [DatePublished], [Gendre], [User_Id], [Author_Id], [Order_Id], [Price]) VALUES (2, N'SpiderMan', CAST(N'2010-01-17T00:00:00.0000000' AS DateTime2), N'Children', NULL, 1, NULL, 79)
INSERT [dbo].[Books] ([Book_Id], [Title], [DatePublished], [Gendre], [User_Id], [Author_Id], [Order_Id], [Price]) VALUES (3, N'Pluto', CAST(N'2020-07-30T00:00:00.0000000' AS DateTime2), N'Children', NULL, 2, NULL, 41)
INSERT [dbo].[Books] ([Book_Id], [Title], [DatePublished], [Gendre], [User_Id], [Author_Id], [Order_Id], [Price]) VALUES (4, N'Born a Crime', CAST(N'2012-01-01T00:00:00.0000000' AS DateTime2), N'Comedy', NULL, 2, NULL, 147)
INSERT [dbo].[Books] ([Book_Id], [Title], [DatePublished], [Gendre], [User_Id], [Author_Id], [Order_Id], [Price]) VALUES (5, N'Peace', CAST(N'2011-01-08T00:00:00.0000000' AS DateTime2), N'Comedy', NULL, 4, NULL, 133)
INSERT [dbo].[Books] ([Book_Id], [Title], [DatePublished], [Gendre], [User_Id], [Author_Id], [Order_Id], [Price]) VALUES (6, N'the Frogs', CAST(N'1998-02-02T00:00:00.0000000' AS DateTime2), N'Comedy', NULL, 2, NULL, 204)
INSERT [dbo].[Books] ([Book_Id], [Title], [DatePublished], [Gendre], [User_Id], [Author_Id], [Order_Id], [Price]) VALUES (7, N'Macbeth', CAST(N'1977-01-01T00:00:00.0000000' AS DateTime2), N'Drama', NULL, 3, NULL, 94)
INSERT [dbo].[Books] ([Book_Id], [Title], [DatePublished], [Gendre], [User_Id], [Author_Id], [Order_Id], [Price]) VALUES (8, N'Hamlet', CAST(N'1940-10-10T00:00:00.0000000' AS DateTime2), N'Drama', NULL, 2, NULL, 122)
INSERT [dbo].[Books] ([Book_Id], [Title], [DatePublished], [Gendre], [User_Id], [Author_Id], [Order_Id], [Price]) VALUES (11, N'Birds', CAST(N'1988-01-01T00:00:00.0000000' AS DateTime2), N'Horror', NULL, 2, NULL, 32)
INSERT [dbo].[Books] ([Book_Id], [Title], [DatePublished], [Gendre], [User_Id], [Author_Id], [Order_Id], [Price]) VALUES (12, N'Hitman', CAST(N'1999-02-01T00:00:00.0000000' AS DateTime2), N'Romance', NULL, 3, NULL, 81)
INSERT [dbo].[Books] ([Book_Id], [Title], [DatePublished], [Gendre], [User_Id], [Author_Id], [Order_Id], [Price]) VALUES (13, N'Harry Potter', CAST(N'2002-12-04T00:00:00.0000000' AS DateTime2), N'Fiction', NULL, 4, NULL, 148)
INSERT [dbo].[Books] ([Book_Id], [Title], [DatePublished], [Gendre], [User_Id], [Author_Id], [Order_Id], [Price]) VALUES (14, N'Harry Potter', CAST(N'2002-12-04T00:00:00.0000000' AS DateTime2), N'Fiction', NULL, 4, NULL, 148)
INSERT [dbo].[Books] ([Book_Id], [Title], [DatePublished], [Gendre], [User_Id], [Author_Id], [Order_Id], [Price]) VALUES (15, N'Hitman', CAST(N'1999-02-01T00:00:00.0000000' AS DateTime2), N'Romance', NULL, 3, NULL, 81)
INSERT [dbo].[Books] ([Book_Id], [Title], [DatePublished], [Gendre], [User_Id], [Author_Id], [Order_Id], [Price]) VALUES (17, N'Birds', CAST(N'1988-01-01T00:00:00.0000000' AS DateTime2), N'Horror', NULL, 2, NULL, 32)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT ((1)) FOR [Author_Id]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (N'New') FOR [Status]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [Book_Id]
GO
ALTER TABLE [dbo].[Authors]  WITH CHECK ADD  CONSTRAINT [FK_Authors_Addresses_Address_Id] FOREIGN KEY([Address_Id])
REFERENCES [dbo].[Addresses] ([Address_Id])
GO
ALTER TABLE [dbo].[Authors] CHECK CONSTRAINT [FK_Authors_Addresses_Address_Id]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Authors_Author_Id] FOREIGN KEY([Author_Id])
REFERENCES [dbo].[Authors] ([Authors_Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Authors_Author_Id]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Orders_Order_Id] FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Orders] ([Order_Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Orders_Order_Id]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Users_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Users_User_Id]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Addresses_Address_Id] FOREIGN KEY([Address_Id])
REFERENCES [dbo].[Addresses] ([Address_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Addresses_Address_Id]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_User_Id]
GO
/****** Object:  StoredProcedure [dbo].[AddressesAddOrEdit]    Script Date: 05/12/2021 9:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[AddressesAddOrEdit]
@Address_Id int,
@StreetName varchar(200),
@City varchar(200)

AS
 IF @Address_Id = 0
 INSERT INTO Addresses(StreetName, City)
 VALUES (@StreetName, @City)
 ELSE
 UPDATE Addresses
 SET 
 StreetName = @StreetName,
 City = @City

 WHERE Address_Id = @Address_Id
GO
/****** Object:  StoredProcedure [dbo].[AddressesDeleteByID]    Script Date: 05/12/2021 9:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[AddressesDeleteByID]
@Address_Id int
AS
	DELETE FROM Addresses
	WHERE Address_Id = @Address_Id
GO
/****** Object:  StoredProcedure [dbo].[AuthorDeleteByID]    Script Date: 05/12/2021 9:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[AuthorDeleteByID]
@Authors_Id int
AS
	DELETE FROM Authors
	WHERE Authors_Id = @Authors_Id
GO
/****** Object:  StoredProcedure [dbo].[AuthorsAddOrEdit]    Script Date: 05/12/2021 9:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[AuthorsAddOrEdit]
@Authors_Id int,
@Name varchar(100),
@Age int,
@Address_Id int,
@PhoneNumber varchar(30),
@Email varchar(100)
AS
 IF @Authors_Id = 0
 INSERT INTO Authors(Name, Age, Address_Id, PhoneNumber)
 VALUES (@Name, @Age, 1, @PhoneNumber)
 ELSE
 UPDATE Authors
 SET 
 Name = @Name,
 Age = @Age,
 Address_Id = @Address_Id,
 PhoneNumber = @PhoneNumber,
 Email = @Email
 WHERE Authors_Id = @Authors_Id

	

	
  
GO
/****** Object:  StoredProcedure [dbo].[BookAddOrEdit]    Script Date: 05/12/2021 9:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[BookAddOrEdit]
@BookID int,
@Title varchar(100),
@DatePublished Datetime,
@AuthorID int,
@Price int,
@Gendre varchar(100)

AS
 IF @BookID = 0
 INSERT INTO Books(Title, DatePublished, Price, Author_Id, Gendre)
 VALUES (@Title, '1900-01-01 00:00:00.0000000',@Price, 2, @Gendre)
 ELSE
 UPDATE Books
 SET 
 Title = @Title,
 DatePublished = @DatePublished,
 Author_Id = @AuthorID,
 Price = @Price,
 Gendre = @Gendre--,
 WHERE Book_Id = @BookID
GO
/****** Object:  StoredProcedure [dbo].[BookDeleteByID]    Script Date: 05/12/2021 9:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[BookDeleteByID]
@BookID int
AS
	DELETE FROM Books
	WHERE Book_Id = @BookID
GO
/****** Object:  StoredProcedure [dbo].[ShowOrderDetail]    Script Date: 05/12/2021 9:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ShowOrderDetail] @OrderId int, @User_Name varchar(30), @BookName varchar(100)
AS
BEGIN
		select * from OrderDetailView		
		where  OrderDetailView.Order_Number = @OrderId OR User_Name = @User_Name OR Book_Title = @BookName
	SET NOCOUNT ON;
END
GO
