USE [ArticleDb]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 08.09.2019 16:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriesPosts]    Script Date: 08.09.2019 16:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriesPosts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[PostId] [int] NULL,
 CONSTRAINT [PK_CategoriesPosts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 08.09.2019 16:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Text] [text] NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 08.09.2019 16:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Bio] [nvarchar](1000) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [CreateTime], [IsDeleted], [Name]) VALUES (2, CAST(N'2019-09-07T16:51:05.787' AS DateTime), 0, N'Eğitim')
INSERT [dbo].[Categories] ([Id], [CreateTime], [IsDeleted], [Name]) VALUES (3, CAST(N'2019-09-07T16:51:05.787' AS DateTime), 0, N'Teknoloji')
INSERT [dbo].[Categories] ([Id], [CreateTime], [IsDeleted], [Name]) VALUES (4, CAST(N'2019-09-07T16:51:05.787' AS DateTime), 0, N'Sağlık')
INSERT [dbo].[Categories] ([Id], [CreateTime], [IsDeleted], [Name]) VALUES (5, CAST(N'2019-09-07T16:51:05.787' AS DateTime), 0, N'Siyaset')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[CategoriesPosts] ON 

INSERT [dbo].[CategoriesPosts] ([Id], [CategoryId], [PostId]) VALUES (7, 2, 5)
INSERT [dbo].[CategoriesPosts] ([Id], [CategoryId], [PostId]) VALUES (8, 3, 1)
INSERT [dbo].[CategoriesPosts] ([Id], [CategoryId], [PostId]) VALUES (9, 2, 13)
INSERT [dbo].[CategoriesPosts] ([Id], [CategoryId], [PostId]) VALUES (10, 3, 13)
SET IDENTITY_INSERT [dbo].[CategoriesPosts] OFF
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [CreateTime], [UpdateTime], [IsDeleted], [Title], [Text], [UserId]) VALUES (1, CAST(N'2019-09-07T16:49:14.563' AS DateTime), CAST(N'2019-09-07T18:02:46.873' AS DateTime), 1, N'test1', N'Ut varius, quam nec maximus cursus, libero purus dictum augue, in accumsan ante mi in massa. Suspendisse quis pellentesque ipsum, sit amet tempor sem. Nullam sed dolor scelerisque, ornare metus eu, cursus justo. Quisque imperdiet risus quis dui facilisis fringilla. Donec id pellentesque felis. Donec facilisis lorem nunc, quis placerat libero tristique a. Fusce porta ut urna auctor dapibus. Nunc pretium sagittis turpis, eu gravida orci rutrum et. Nam vel elementum felis, molestie ornare sapien. Donec eleifend pulvinar risus, a rutrum urna. Morbi elementum pellentesque tempus. Mauris tincidunt sapien quis nisl molestie, in venenatis mauris mattis.

', 1)
INSERT [dbo].[Posts] ([Id], [CreateTime], [UpdateTime], [IsDeleted], [Title], [Text], [UserId]) VALUES (5, CAST(N'2019-09-07T16:49:14.563' AS DateTime), CAST(N'2019-09-07T18:00:23.950' AS DateTime), 0, N'asd', N'asd', 1)
INSERT [dbo].[Posts] ([Id], [CreateTime], [UpdateTime], [IsDeleted], [Title], [Text], [UserId]) VALUES (6, CAST(N'2019-09-07T17:45:43.750' AS DateTime), CAST(N'2019-09-07T18:02:21.100' AS DateTime), 0, N'test6', N'Aenean sodales eget tellus in blandit. Ut at gravida libero, nec porttitor ipsum. In eget libero convallis, condimentum metus blandit, lobortis odio. Sed justo quam, scelerisque ac molestie id, dapibus id lacus. Nunc convallis lacus tellus, eget fringilla augue egestas eu. Phasellus imperdiet justo in nulla malesuada fermentum. Etiam ultricies, lorem non suscipit ornare, dui ex tincidunt sem, id viverra risus nisi sodales felis.', 1)
INSERT [dbo].[Posts] ([Id], [CreateTime], [UpdateTime], [IsDeleted], [Title], [Text], [UserId]) VALUES (7, CAST(N'2019-09-07T17:59:29.930' AS DateTime), CAST(N'2019-09-07T18:01:54.543' AS DateTime), 0, N'test7', N'Donec erat dolor, bibendum sit amet ultrices a, cursus ut ligula. Nunc pulvinar urna id risus mattis lacinia. Praesent consectetur laoreet nunc a commodo. In at condimentum libero. Cras augue sapien, laoreet sit amet ultrices tempus, elementum id lorem. Duis venenatis molestie lorem. Suspendisse aliquet feugiat placerat. In a leo turpis. Aenean consequat varius est. Sed imperdiet augue eu posuere malesuada. Pellentesque dignissim dui at quam vehicula, eu euismod lectus auctor. Vivamus nibh ligula, facilisis id interdum et, varius efficitur quam. Etiam pellentesque finibus nulla vel bibendum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.', 1)
INSERT [dbo].[Posts] ([Id], [CreateTime], [UpdateTime], [IsDeleted], [Title], [Text], [UserId]) VALUES (8, CAST(N'2019-09-08T15:28:00.503' AS DateTime), CAST(N'2019-09-08T15:34:24.260' AS DateTime), 1, N'test1', N'Ut varius, quam nec maximus cursus, libero purus dictum augue, in accumsan ante mi in massa. Suspendisse quis pellentesque ipsum, sit amet tempor sem. Nullam sed dolor scelerisque, ornare metus eu, cursus justo. Quisque imperdiet risus quis dui facilisis fringilla. Donec id pellentesque felis. Donec facilisis lorem nunc, quis placerat libero tristique a. Fusce porta ut urna auctor dapibus. Nunc pretium sagittis turpis, eu gravida orci rutrum et. Nam vel elementum felis, molestie ornare sapien. Donec eleifend pulvinar risus, a rutrum urna. Morbi elementum pellentesque tempus. Mauris tincidunt sapien quis nisl molestie, in venenatis mauris mattis.

', 1)
INSERT [dbo].[Posts] ([Id], [CreateTime], [UpdateTime], [IsDeleted], [Title], [Text], [UserId]) VALUES (9, CAST(N'2019-09-08T15:43:06.227' AS DateTime), CAST(N'2019-09-08T15:43:06.227' AS DateTime), 0, N'QWERTY', N'iet risus quis dui facilisis fringill Test requesttt asdasd ', 1)
INSERT [dbo].[Posts] ([Id], [CreateTime], [UpdateTime], [IsDeleted], [Title], [Text], [UserId]) VALUES (10, CAST(N'2019-09-08T15:48:53.970' AS DateTime), CAST(N'2019-09-08T15:48:53.970' AS DateTime), 0, N'QWERTYj', N'iet risus quis dui facilisis fringill Test requesttt asdasd ', 1)
INSERT [dbo].[Posts] ([Id], [CreateTime], [UpdateTime], [IsDeleted], [Title], [Text], [UserId]) VALUES (11, CAST(N'2019-09-08T15:58:50.533' AS DateTime), CAST(N'2019-09-08T15:58:50.533' AS DateTime), 0, N'QWERTYj', N'iet risus quis dui facilisis fringill Test requesttt asdasd ', 1)
INSERT [dbo].[Posts] ([Id], [CreateTime], [UpdateTime], [IsDeleted], [Title], [Text], [UserId]) VALUES (12, CAST(N'2019-09-08T15:59:55.590' AS DateTime), CAST(N'2019-09-08T15:59:55.590' AS DateTime), 0, N'2QWERTYj', N'iet risus quis dui facilisis fringill Test requesttt asdasd ', 1)
INSERT [dbo].[Posts] ([Id], [CreateTime], [UpdateTime], [IsDeleted], [Title], [Text], [UserId]) VALUES (13, CAST(N'2019-09-08T16:00:33.320' AS DateTime), CAST(N'2019-09-08T16:00:33.320' AS DateTime), 0, N'2QWERTYj', N'iet risus quis dui facilisis fringill Test requesttt asdasd ', 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [CreateTime], [UpdateTime], [IsDeleted], [Username], [Email], [Password], [Bio]) VALUES (1, CAST(N'2019-09-07T16:32:03.550' AS DateTime), CAST(N'2019-09-07T16:32:03.550' AS DateTime), 0, N'eray', N'eray@eray.com', N'aaa', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[CategoriesPosts]  WITH CHECK ADD  CONSTRAINT [FK_CategoriesPosts_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[CategoriesPosts] CHECK CONSTRAINT [FK_CategoriesPosts_Categories]
GO
ALTER TABLE [dbo].[CategoriesPosts]  WITH CHECK ADD  CONSTRAINT [FK_CategoriesPosts_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[CategoriesPosts] CHECK CONSTRAINT [FK_CategoriesPosts_Posts]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Posts] FOREIGN KEY([UserId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Posts]
GO
