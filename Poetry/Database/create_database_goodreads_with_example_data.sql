USE [goodreads]
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 1/27/2017 7:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 1/27/2017 7:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL DEFAULT ((0)),
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 1/27/2017 7:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 1/27/2017 7:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL DEFAULT (NULL),
	[IsAnonymous] [bit] NOT NULL DEFAULT ((0)),
	[LastActivityDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 1/27/2017 7:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[PoemId] [int] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Poems]    Script Date: 1/27/2017 7:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[PartialBody] [nvarchar](300) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Poems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'GoodReads', N'goodreads', N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'3f0c4cca-a723-4a67-bd82-f08f390cbb99', N'ryOEvBNRYZjiM9HmCuJJFGJFyiI=', 1, N'3ADt57ekf1mGrCGvw+p2VA==', NULL, N'a', N'a', NULL, NULL, 1, 0, CAST(N'2017-01-21 21:49:47.000' AS DateTime), CAST(N'2017-01-21 21:49:47.000' AS DateTime), CAST(N'2017-01-21 21:49:47.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'50c6ee43-72cf-4836-bb45-79d4718a6bdd', N'zAi/d4OXQcGFQrHNzT1eABXgasI=', 1, N'LkOxujXR4Rdd9zWsei+qmg==', NULL, N'asd@asf.bg', N'asd@asf.bg', NULL, NULL, 1, 0, CAST(N'2017-01-23 10:42:31.000' AS DateTime), CAST(N'2017-01-23 10:42:31.000' AS DateTime), CAST(N'2017-01-23 10:42:31.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'88dc4a84-8c7d-48be-9cf9-e8b199fbd322', N'XguxbQYGraR4KnzNqVnH7oz5H1Q=', 1, N'bvNnkQqxTzDwLozIUsA9Pw==', NULL, N'CannotRemember123@abv.bg', N'cannotremember123@abv.bg', NULL, NULL, 1, 0, CAST(N'2017-01-27 07:45:44.000' AS DateTime), CAST(N'2017-01-27 07:45:44.000' AS DateTime), CAST(N'2017-01-27 07:45:44.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'9229d453-50b3-4eb3-96c0-ec3014c82daa', N'muJjma+qnNAJCrH9mbO5fwv0QSM=', 1, N'2Ft1k0JRwZcWLzSrBcWeBw==', NULL, N'georgi.vorobiov@gmail.com', N'georgi.vorobiov@gmail.com', NULL, NULL, 1, 0, CAST(N'2017-01-27 16:13:43.000' AS DateTime), CAST(N'2017-01-27 16:13:43.000' AS DateTime), CAST(N'2017-01-27 16:13:43.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'bba75192-ea87-4e47-baaa-eab8e3ae72b7', N'HFR6Lh/c2P7WlUWA7Azj5Lxt6h8=', 1, N'2UMw5dUAQJ05S86ZEp5+fQ==', NULL, N'ideaA123@abv.bg', N'ideaa123@abv.bg', NULL, NULL, 1, 0, CAST(N'2017-01-21 08:48:40.000' AS DateTime), CAST(N'2017-01-21 08:48:40.000' AS DateTime), CAST(N'2017-01-21 08:48:40.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'87736792-82a6-47d1-a3fb-8b13385513dc', N'+zDFn9NxVVLR3QgqnRKEgv/a0C0=', 1, N'1UzlEONuAnyYQLAbKPoBSg==', NULL, N'IvanIvanov123asd.as', N'ivanivanov123asd.as', NULL, NULL, 1, 0, CAST(N'2017-01-27 15:45:18.000' AS DateTime), CAST(N'2017-01-27 15:45:18.000' AS DateTime), CAST(N'2017-01-27 15:45:18.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'1915714c-1d63-4bd9-b183-3fe06e901dda', N'dn+6OTvaNzZmhgOEtzT+cgLPI8A=', 1, N'MIHxo20ZT1o0J6lIfrMI8A==', NULL, N'ivanVazov70@abv.bg', N'ivanvazov70@abv.bg', NULL, NULL, 1, 0, CAST(N'2017-01-27 15:33:01.000' AS DateTime), CAST(N'2017-01-27 15:33:01.000' AS DateTime), CAST(N'2017-01-27 15:33:01.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'25d4a850-1e78-4a4e-a273-fc96ea54d4a2', N'9Z0VSD8ZOMizGk+SCBlUaPLG0Z8=', 1, N'pcxxS4UpoW6H14+MmcaMjA==', NULL, N'jnhkgfds43A@aszf.bg', N'jnhkgfds43a@aszf.bg', NULL, NULL, 1, 0, CAST(N'2017-01-21 10:47:58.000' AS DateTime), CAST(N'2017-01-21 10:53:24.530' AS DateTime), CAST(N'2017-01-21 10:47:58.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'9e97a7e2-a05d-4482-9f42-5a51a726aea7', N'hWq/+PUfL849K9O4Eebvzsln4zU=', 1, N'UGBx55EkfJHDWTpzhLlxLQ==', NULL, N'kiyfuS2@abv.bg', N'kiyfus2@abv.bg', NULL, NULL, 1, 0, CAST(N'2017-01-21 09:00:46.000' AS DateTime), CAST(N'2017-01-21 09:00:46.583' AS DateTime), CAST(N'2017-01-21 09:00:46.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'282bf0da-3a7f-44ed-9588-73b57a8a92df', N'3lx8ox1YqGVeKPftdLR6o4DzMXA=', 1, N'oOiFLdPnP6bD4hhLxmUexw==', NULL, N'Kor123@abv.bg', N'kor123@abv.bg', NULL, NULL, 1, 0, CAST(N'2017-01-21 08:52:19.000' AS DateTime), CAST(N'2017-01-21 08:52:19.000' AS DateTime), CAST(N'2017-01-21 08:52:19.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'6c69a720-ca12-4c0d-85db-970f1c2b8882', N'KXD0SbWM60F5AQXJSaQs3xgujAw=', 1, N'lFM0Qm//YOOBNAwcPW+85A==', NULL, N'Kur123@abv.bg', N'kur123@abv.bg', NULL, NULL, 1, 0, CAST(N'2017-01-21 09:14:17.000' AS DateTime), CAST(N'2017-01-21 09:14:17.000' AS DateTime), CAST(N'2017-01-21 09:14:17.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'ddf1c272-a612-473b-b2cd-6de82e87c2f7', N'2MR34xf/4hbd12pH1p8S2syu0No=', 1, N'7VJmW5GrM3QzOX/csoacig==', NULL, N'KurJ2@abvf.bg', N'kurj2@abvf.bg', NULL, NULL, 1, 0, CAST(N'2017-01-21 09:16:26.000' AS DateTime), CAST(N'2017-01-21 09:16:26.000' AS DateTime), CAST(N'2017-01-21 09:16:26.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'99fd00d8-e4a1-4abf-86df-6b422a3d1533', N'+4Ta/xArfdWqquA2lLWUjswC5t8=', 1, N'8Hf1lxH+aHJpbyvQrIxAqw==', NULL, N'KurKur123@abv.bg', N'kurkur123@abv.bg', NULL, NULL, 1, 0, CAST(N'2017-01-22 09:52:41.000' AS DateTime), CAST(N'2017-01-22 09:52:41.000' AS DateTime), CAST(N'2017-01-22 09:52:41.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'0d047aa0-538e-4b74-b4c7-0a85735bdd0f', N'RunuGWICV+B7leMVb8m21CGDNfM=', 1, N'dgv9a+6aw4f3KiPJRjKNjA==', NULL, N'KurMa1@abv.bg', N'kurma1@abv.bg', NULL, NULL, 1, 0, CAST(N'2017-01-21 09:13:36.000' AS DateTime), CAST(N'2017-01-21 09:13:36.000' AS DateTime), CAST(N'2017-01-21 09:13:36.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'd4185d0a-e73e-45e3-a602-e5576257f7a6', N'yG6NKtOhuaSvGcR8dxEqm4GF4vs=', 1, N'HTHtFBaZ04i8NLdECKl1jA==', NULL, N'KurOOO1@abv.bg', N'kurooo1@abv.bg', NULL, NULL, 1, 0, CAST(N'2017-01-21 09:07:39.000' AS DateTime), CAST(N'2017-01-21 09:07:39.000' AS DateTime), CAST(N'2017-01-21 09:07:39.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'56727e02-6edc-4694-9557-1f95fe9e5202', N'wgiAdsfVq2RsR0THBVWm+mTSfjc=', 1, N'7V1WXeRXi0a7fW7HDpB6xA==', NULL, N'KurrR1@abv.bg', N'kurrr1@abv.bg', NULL, NULL, 1, 0, CAST(N'2017-01-21 09:05:04.000' AS DateTime), CAST(N'2017-01-21 09:05:04.000' AS DateTime), CAST(N'2017-01-21 09:05:04.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'378492c6-0995-49ff-a227-189537c7da8c', N'M+fVFrDs7J5Yt9Wb/rCu5li0NBg=', 1, N'9/oECCH/Ko+O8cN3u/fQ3Q==', NULL, N'peterPetrov123@abv.bg', N'peterpetrov123@abv.bg', NULL, NULL, 1, 0, CAST(N'2017-01-27 15:50:04.000' AS DateTime), CAST(N'2017-01-27 15:50:04.000' AS DateTime), CAST(N'2017-01-27 15:50:04.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'3f0c4cca-a723-4a67-bd82-f08f390cbb99', N'a', N'a', NULL, 0, CAST(N'2017-01-21 21:49:47.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'88dc4a84-8c7d-48be-9cf9-e8b199fbd322', N'CannotRemember123', N'cannotremember123', NULL, 0, CAST(N'2017-01-27 07:52:40.400' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'9229d453-50b3-4eb3-96c0-ec3014c82daa', N'GeorgiVorobyov', N'georgivorobyov', NULL, 0, CAST(N'2017-01-27 16:13:43.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'bba75192-ea87-4e47-baaa-eab8e3ae72b7', N'ideaA123', N'ideaa123', NULL, 0, CAST(N'2017-01-21 08:48:40.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'1915714c-1d63-4bd9-b183-3fe06e901dda', N'ivan_vazov', N'ivan_vazov', NULL, 0, CAST(N'2017-01-27 15:36:13.820' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'87736792-82a6-47d1-a3fb-8b13385513dc', N'IvanIvanov', N'ivanivanov', NULL, 0, CAST(N'2017-01-27 15:48:51.103' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'25d4a850-1e78-4a4e-a273-fc96ea54d4a2', N'jnhkgfds43A', N'jnhkgfds43a', NULL, 0, CAST(N'2017-01-21 10:53:24.530' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'9e97a7e2-a05d-4482-9f42-5a51a726aea7', N'kiyfuS2', N'kiyfus2', NULL, 0, CAST(N'2017-01-21 09:00:46.583' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'282bf0da-3a7f-44ed-9588-73b57a8a92df', N'Kor123', N'kor123', NULL, 0, CAST(N'2017-01-21 08:52:19.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'6c69a720-ca12-4c0d-85db-970f1c2b8882', N'Kur123', N'kur123', NULL, 0, CAST(N'2017-01-21 09:14:17.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'ddf1c272-a612-473b-b2cd-6de82e87c2f7', N'KurJ!2', N'kurj!2', NULL, 0, CAST(N'2017-01-21 09:16:26.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'99fd00d8-e4a1-4abf-86df-6b422a3d1533', N'KurKur123', N'kurkur123', NULL, 0, CAST(N'2017-01-22 20:05:41.540' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'0d047aa0-538e-4b74-b4c7-0a85735bdd0f', N'KurMa@1', N'kurma@1', NULL, 0, CAST(N'2017-01-21 09:13:36.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'd4185d0a-e73e-45e3-a602-e5576257f7a6', N'KurOOO1', N'kurooo1', NULL, 0, CAST(N'2017-01-21 09:07:39.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'56727e02-6edc-4694-9557-1f95fe9e5202', N'KurrR1', N'kurrr1', NULL, 0, CAST(N'2017-01-21 09:05:04.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'378492c6-0995-49ff-a227-189537c7da8c', N'PeterPetrov', N'peterpetrov', NULL, 0, CAST(N'2017-01-27 15:56:28.687' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'e54e3fcd-fdfc-4c98-9b56-31d7eb3fa5fd', N'50c6ee43-72cf-4836-bb45-79d4718a6bdd', N'sdf', N'sdf', NULL, 0, CAST(N'2017-01-23 10:49:08.597' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [Comment], [PoemId], [UserId], [CreateDate]) VALUES (1002, N'В това стихотворение с Патриарха на българската литература се случва особена промяна. Неузнаваем, той започва да говори като гуру на позитивното мислене. Поставя ръка върху уморената ти глава и прошепва: "Ако мислиш сразен си, сразен си..."', 1006, N'87736792-82a6-47d1-a3fb-8b13385513dc', CAST(N'2017-01-27 15:48:51.117' AS DateTime))
INSERT [dbo].[Comments] ([Id], [Comment], [PoemId], [UserId], [CreateDate]) VALUES (1003, N'Ако напишете "Иван Вазов" в Гугъл, търсачката ще направи машинно предположение и ще ви насочи към най-търсенето и четено нещо, свързано с писателя. А то най-често е следното - стихотворението "Аз мога".', 1006, N'378492c6-0995-49ff-a227-189537c7da8c', CAST(N'2017-01-27 15:51:56.063' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Poems] ON 

INSERT [dbo].[Poems] ([Id], [Title], [Body], [PartialBody], [UserId], [CreateDate]) VALUES (1004, N'ЗАХОД И ИЗХОД СЛЪНЦЕ', N'Слънцето на заход бега,
а със него люта жега;
доста вече то греяло,
доста вече се лутало
и нагоре, и надолу
по небето синьо, голо,
както всички божи хора
и то сеща труд, умора:
требуват му сили нови;
сетни си зари, огньове
на небето то ги дава
и с земята се прощава.
Скоро то накрай небето
ще пропадне във полето,
във полето, под земята,
в свойта люлка непозната,
да си легне, попочине,
в сън приятен да премине,
дор се месечко насити,
месец, още и звездите
по небето да светлукат,
да си греят и блещукат.
Утре рано изпод земя
пак ще пътя си подземе
и из темни, нощни бездни
то на изток ще възлезне,
ясно лице ще покаже
и "Добрутро!" ще ни каже...
 ', N'Слънцето на заход бега,
а със него люта жега;
доста вече то греяло,
доста вече се лутало
и нагоре, и надолу
по небето синьо, голо,
както всички божи хора
и то сеща труд, умора:
требуват му сили нови;
сетни си зари, огньове
на небето то ги дава
и с земята се прощава.
Скоро то накрай небет', N'1915714c-1d63-4bd9-b183-3fe06e901dda', CAST(N'2017-01-27 15:34:11.103' AS DateTime))
INSERT [dbo].[Poems] ([Id], [Title], [Body], [PartialBody], [UserId], [CreateDate]) VALUES (1005, N'ПРОЛЕТЕН ДЪЖД', N'- Ситен дъжд вали, дечица,
всяка капка е желтица!
Деца припкат и крещят,
злато в поли да берат.
 
- Потърпете, вий, дечица,
сбра-щем първен ний пшеница,
а пък златото тогаз
ще самичко до при нас!', N'- Ситен дъжд вали, дечица,
всяка капка е желтица!
Деца припкат и крещят,
злато в поли да берат.
 
- Потърпете, вий, дечица,
сбра-щем първен ний пшеница,
а пък златото тогаз
ще самичко до при нас!', N'1915714c-1d63-4bd9-b183-3fe06e901dda', CAST(N'2017-01-27 15:35:25.563' AS DateTime))
INSERT [dbo].[Poems] ([Id], [Title], [Body], [PartialBody], [UserId], [CreateDate]) VALUES (1006, N'УЛОВЕНА ПТИЧКА', N'Деца
 
Видиш, птиченце крилато,
ние в примка те държим
и със тебе цяло лято
няма да се разделим.
 
Птичка
 
Ах, защо ви съм? Бъдете
милостиви тоя час,
да си хвръкна ме пуснете,
в примката ще умра аз!
 
Деца
 
Не грижи се, мила птичко,
дор си в нашите ръце;
ще те храниме със всичко,
с захарчица, с млечице.
 
Птичка
 
Мляко що е не разбирам,
захар ази не кълвя,
само зрънца знам да сбирам
и мушици да ловя.
 
Деца
 
Ти зимъска ще загинеш
на полето там сама!
По-добре да си починеш
в нашта клетка у дома.
 
Птичка
 
Не се бойте, аз щъ хвръкна
татък в топлите места,
в ваш''та клетка ще издъхна,
макар златна да е тя.
 
Деца
 
Мила птичко, ти не знаеш
как е харно тука, виж -
ти със нас ще си играеш,
няма що да се боиш.
 
Птичка
 
Мен, дечица, по е харно
да си хвъркам по светът,
тук щъ умра аз навярно,
тясно ми е в тоя кът!
 
Деца
 
Право казваш, пиле клето,
тук на мъка ще живейш,
хай хвръкни си към небето,
на свобода да си пейш!', N'Деца
 
Видиш, птиченце крилато,
ние в примка те държим
и със тебе цяло лято
няма да се разделим.
 
Птичка
 
Ах, защо ви съм? Бъдете
милостиви тоя час,
да си хвръкна ме пуснете,
в примката ще умра аз!
 
Деца
 
Не грижи се, мила птичко,
дор си в нашите ръце;
ще те храниме със всичко,', N'1915714c-1d63-4bd9-b183-3fe06e901dda', CAST(N'2017-01-27 15:36:13.827' AS DateTime))
SET IDENTITY_INSERT [dbo].[Poems] OFF
/****** Object:  Index [PK__aspnet_A__C93A4C986C7EA4C6]    Script Date: 1/27/2017 7:00:31 PM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__17477DE4D3CE5FC1]    Script Date: 1/27/2017 7:00:31 PM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__309103310CB6E3DA]    Script Date: 1/27/2017 7:00:31 PM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_M__1788CC4DCAC4A008]    Script Date: 1/27/2017 7:00:31 PM ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_U__1788CC4D9E891380]    Script Date: 1/27/2017 7:00:31 PM ******/
ALTER TABLE [dbo].[aspnet_Users] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_aspnet_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_aspnet_Users]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Poems] FOREIGN KEY([PoemId])
REFERENCES [dbo].[Poems] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Poems]
GO
ALTER TABLE [dbo].[Poems]  WITH CHECK ADD  CONSTRAINT [FK_Poems_aspnet_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[Poems] CHECK CONSTRAINT [FK_Poems_aspnet_Users]
GO
