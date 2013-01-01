USE [BAPSLansdale]
GO
/****** Object:  Table [dbo].[PersonRelationships]    Script Date: 11/23/2012 18:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PersonRelationships](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[RelatedPersonID] [int] NOT NULL,
	[RelationshipTypeID] [int] NOT NULL,
 CONSTRAINT [PK_PersonRelationships] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC,
	[RelatedPersonID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PersonEventFlags]    Script Date: 11/23/2012 18:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonEventFlags](
    [PersonEventFlagID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[EventFlagID] [int] NOT NULL,
	CONSTRAINT [PK_PersonEventFlags] PRIMARY KEY CLUSTERED 
(
	[PersonEventFlagID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventFlags]    Script Date: 11/23/2012 18:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventFlags](
	[EventFlagID] [int] IDENTITY(1,1) NOT NULL,
	[FlagName] [nvarchar](255) NOT NULL,
	CONSTRAINT [PK_EventFlags] PRIMARY KEY CLUSTERED 
(
	[EventFlagId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DevarshibhaiAddresses]    Script Date: 11/23/2012 18:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DevarshibhaiAddresses](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[SurName] [varchar](50) NULL,
	[Address] [varchar](150) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](10) NULL,
	[home_phone] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cityNames]    Script Date: 11/23/2012 18:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
Create table CityNames(
CityId Int IDENTITY(1,1) NOT NULL,
CityName nvarchar(255)NOT NULL,
State nvarchar(10) NOT NULL
 CONSTRAINT [PK_CityNames] PRIMARY KEY CLUSTERED 
(
	[CityId]
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/23/2012 18:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 11/23/2012 18:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[StreetNo] [nvarchar](25) NULL,
	[Address] [nvarchar](255) NULL,
	[ApartmentNo] [nvarchar](25) NULL,
	[CityId] [int] NULL,
	[State] [nchar](10) NULL,
	[Zip] [nchar](10) NULL,
CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[address_list]    Script Date: 11/23/2012 18:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[address_list](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [varchar](50) NULL,
	[Firstname] [varchar](50) NULL,
	[Middlename] [varchar](50) NULL,
	[home_phone] [varchar](20) NULL,
	[address] [varchar](150) NULL,
	[city] [varchar](35) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[zones]    Script Date: 11/23/2012 18:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Zones](
	[ZoneId] [int] IDENTITY(1,1) NOT NULL,
	[ZoneName] [varchar](100) NOT NULL,
	[ZoneLeadId] [int] NULL,
 CONSTRAINT [PK_zones] PRIMARY KEY CLUSTERED 
(
	[ZoneId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RelationshipTypes]    Script Date: 11/23/2012 18:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelationshipTypes](
	[RelationshipTypeID] [int] NOT NULL,
	[RelationshipType] [nvarchar](255) NULL,
	CONSTRAINT [PK_RelationshipTypes] PRIMARY KEY CLUSTERED 
(
	[RelationshipTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Roles]    Script Date: 11/23/2012 18:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE Roles(
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Users]    Script Date: 11/23/2012 18:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[LastLogin] [datetime] NULL,
	[PasswordSalt] [nvarchar](max) NOT NULL,
	[NeedsPasswordChange] [bit] NOT NULL,
CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ZoneCities]    Script Date: 11/23/2012 18:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZoneCities](
	[ZoneCityId] [int] IDENTITY(1,1) NOT NULL,
	[ZoneId] [int] NULL,
	[CityName] [varchar](20) NULL,
	[CityId] [int] NULL,
 CONSTRAINT [PK_ZoneCities] PRIMARY KEY CLUSTERED 
(
	[ZoneCityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [unqcities] UNIQUE NONCLUSTERED 
(
	[CityName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_address_02_19_2012]    Script Date: 11/23/2012 18:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_address_02_19_2012](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[IsBadAddress] [bit] NULL,
	[categoryId] [int] NULL,
	[surname] [varchar](50) NULL,
	[firstname] [varchar](50) NULL,
	[middlename] [varchar](50) NULL,
	[dateofbirth] [datetime] NULL,
	[gender] [char](1) NULL,
	[karykar] [bit] NULL,
	[address] [varchar](150) NULL,
	[city] [varchar](20) NULL,
	[state] [char](2) NULL,
	[zip] [varchar](10) NULL,
	[home_phone] [varchar](20) NULL,
	[cell_phone] [varchar](20) NULL,
	[other_phone] [varchar](20) NULL,
	[email_address] [varchar](100) NULL,
	[native] [varchar](30) NULL,
	[type] [varchar](20) NULL,
	[entry_date] [datetime] NULL,
	[modify_date] [datetime] NULL,
	[karykar_id] [int] NULL,
	[active] [bit] NULL,
	[ctg] [char](1) NULL,
	[bal] [bit] NULL,
	[balika] [bit] NULL,
	[kishor] [bit] NULL,
	[kishori] [bit] NULL,
	[yuvak] [bit] NULL,
	[yuvati] [bit] NULL,
	[access_id] [int] NULL,
	[Old_PhoneNumber] [varchar](200) NULL,
	[cityid] [int] NULL,
	[consider_for_sampark] [varchar](50) NULL,
	[Notes] [varchar](max) NULL,
	[CalendarIssued] [bit] NULL,
	[RelationshipTypeID] [int] NULL,
	[Relation_address_id] [int] NULL,
 CONSTRAINT [PK_tb_address_old] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 11/23/2012 18:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Persons](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[MiddleName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[CategoryId] [int] NULL,
	[IsBadAddress] [Bit] NULL,
	[DateOfBirth] [Datetime] NULL,
	[Gender] [nchar](1) NULL,
	[IsKarykar] [bit] NULL,
	[AddressId] [int] NOT NULL,
	[HomePhone] [nvarchar](20) NULL,
	[CellPhone] [nvarchar](20) NULL,
	[Email] [nvarchar](255) NULL,
	[Native] [nvarchar](255) NULL,
	[Type] [nvarchar](20) NULL,
	[EntryDate] [Datetime] NULL,
	[ModifyDate] [Datetime] NULL,
	[KarykarId] [int] NULL,
	[Active] [bit] NULL,
	[OldPhoneNo] [nvarchar](20) NULL,
	[ConsiderForSampark] [bit] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[zoneKaryakar]    Script Date: 11/23/2012 18:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZoneKaryakar](
	[ZoneKarykarId] [int] IDENTITY(1,1) NOT NULL,
	[ZoneId] [int] NULL,
	[AddressId] [int] NULL,
	[Notes] [varchar](6000) NULL,
	[Note1] [varchar](6000) NULL,
	[Note2] [varchar](6000) NULL,
	[Note3] [varchar](6000) NULL,
 CONSTRAINT [PK_ZoneKaryakar] PRIMARY KEY CLUSTERED 
(
	[ZoneKarykarId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  ForeignKey [FK_Persons_AddressID]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_AddressID] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_AddressId]
GO

/****** Object:  ForeignKey [FK_Persons_CategoryID]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_CategoryId]
GO

/****** Object:  ForeignKey [FK_Persons_CityId]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[cityNames] ([CityId])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_CityId]
GO

/****** Object:  ForeignKey [FK_PersonRelationShips_RelationshipTypeID]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[PersonRelationShips]  WITH CHECK ADD  CONSTRAINT [FK_PersonRelationShips_RelationshipTypeID] FOREIGN KEY([RelationshipTypeID])
REFERENCES [dbo].[RelationshipTypes] ([RelationshipTypeID])
GO
ALTER TABLE [dbo].[PersonRelationShips] CHECK CONSTRAINT [FK_PersonRelationShips_RelationshipTypeID]
GO

/****** Object:  ForeignKey [FK_ZoneKaryakar_AddressID]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[ZoneKaryakar]  WITH CHECK ADD  CONSTRAINT [FK_ZoneKaryakar_AddressID] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
GO
ALTER TABLE [dbo].[ZoneKaryakar] CHECK CONSTRAINT [FK_ZoneKaryakar_AddressId]
GO

/****** Object:  ForeignKey [FK_PersonRelationShips_PersonId]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[PersonRelationShips]  WITH CHECK ADD  CONSTRAINT [FK_PersonRelationShips_PersonId] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([PersonId])
GO
ALTER TABLE [dbo].[PersonRelationShips] CHECK CONSTRAINT [FK_PersonRelationShips_PersonId]
GO

/****** Object:  ForeignKey [FK_PersonRelationShips_RelatedPersonId]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[PersonRelationShips]  WITH CHECK ADD  CONSTRAINT [FK_PersonRelationShips_RelatedPersonId] FOREIGN KEY([RelatedPersonId])
REFERENCES [dbo].[Persons] ([PersonId])
GO
ALTER TABLE [dbo].[PersonRelationShips] CHECK CONSTRAINT [FK_PersonRelationShips_RelatedPersonId]
GO

/****** Object:  ForeignKey [FK_PersonEventFlags_PersonId]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[PersonEventFlags]  WITH CHECK ADD  CONSTRAINT [FK_PersonEventFlags_PersonId] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([PersonId])
GO
ALTER TABLE [dbo].[PersonEventFlags] CHECK CONSTRAINT [FK_PersonEventFlags_PersonId]
GO

/****** Object:  ForeignKey [FK_PersonEventFlags_EventFlagId]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[PersonEventFlags]  WITH CHECK ADD  CONSTRAINT [FK_PersonEventFlags_EventFlagId] FOREIGN KEY([EventFlagId])
REFERENCES [dbo].[EventFlags] ([EventFlagID])
GO
ALTER TABLE [dbo].[PersonEventFlags] CHECK CONSTRAINT [FK_PersonEventFlags_EventFlagId]
GO




/****** Object:  Default [DF__tb_addres__surna__08EA5793]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__surna__08EA5793]  DEFAULT (NULL) FOR [surname]
GO
/****** Object:  Default [DF__tb_addres__first__09DE7BCC]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__first__09DE7BCC]  DEFAULT (NULL) FOR [firstname]
GO
/****** Object:  Default [DF__tb_addres__middl__0AD2A005]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__middl__0AD2A005]  DEFAULT (NULL) FOR [middlename]
GO
/****** Object:  Default [DF__tb_addres__dateo__0BC6C43E]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__dateo__0BC6C43E]  DEFAULT (NULL) FOR [dateofbirth]
GO
/****** Object:  Default [DF__tb_addres__gende__0CBAE877]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__gende__0CBAE877]  DEFAULT (NULL) FOR [gender]
GO
/****** Object:  Default [DF__tb_addres__karyk__0DAF0CB0]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__karyk__0DAF0CB0]  DEFAULT (NULL) FOR [karykar]
GO
/****** Object:  Default [DF__tb_addres__addre__0EA330E9]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__addre__0EA330E9]  DEFAULT (NULL) FOR [address]
GO
/****** Object:  Default [DF__tb_address__city__0F975522]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_address__city__0F975522]  DEFAULT (NULL) FOR [city]
GO
/****** Object:  Default [DF__tb_addres__state__108B795B]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__state__108B795B]  DEFAULT (NULL) FOR [state]
GO
/****** Object:  Default [DF__tb_address__zip__117F9D94]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_address__zip__117F9D94]  DEFAULT (NULL) FOR [zip]
GO
/****** Object:  Default [DF__tb_addres__home___1273C1CD]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__home___1273C1CD]  DEFAULT (NULL) FOR [home_phone]
GO
/****** Object:  Default [DF__tb_addres__cell___1367E606]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__cell___1367E606]  DEFAULT (NULL) FOR [cell_phone]
GO
/****** Object:  Default [DF__tb_addres__other__145C0A3F]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__other__145C0A3F]  DEFAULT (NULL) FOR [other_phone]
GO
/****** Object:  Default [DF__tb_addres__email__15502E78]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__email__15502E78]  DEFAULT (NULL) FOR [email_address]
GO
/****** Object:  Default [DF__tb_addres__nativ__164452B1]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__nativ__164452B1]  DEFAULT (NULL) FOR [native]
GO
/****** Object:  Default [DF__tb_address__type__173876EA]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_address__type__173876EA]  DEFAULT (NULL) FOR [type]
GO
/****** Object:  Default [DF__tb_addres__entry__182C9B23]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__entry__182C9B23]  DEFAULT (NULL) FOR [entry_date]
GO
/****** Object:  Default [DF__tb_addres__modif__1920BF5C]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__modif__1920BF5C]  DEFAULT (NULL) FOR [modify_date]
GO
/****** Object:  Default [DF__tb_addres__karyk__1A14E395]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__karyk__1A14E395]  DEFAULT (NULL) FOR [karykar_id]
GO
/****** Object:  Default [DF__tb_addres__activ__1B0907CE]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__activ__1B0907CE]  DEFAULT (NULL) FOR [active]
GO
/****** Object:  Default [DF__tb_address__ctg__1BFD2C07]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_address__ctg__1BFD2C07]  DEFAULT (NULL) FOR [ctg]
GO
/****** Object:  Default [DF__tb_address__bal__1CF15040]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_address__bal__1CF15040]  DEFAULT (NULL) FOR [bal]
GO
/****** Object:  Default [DF__tb_addres__balik__1DE57479]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__balik__1DE57479]  DEFAULT (NULL) FOR [balika]
GO
/****** Object:  Default [DF__tb_addres__kisho__1ED998B2]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__kisho__1ED998B2]  DEFAULT (NULL) FOR [kishor]
GO
/****** Object:  Default [DF__tb_addres__kisho__1FCDBCEB]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__kisho__1FCDBCEB]  DEFAULT (NULL) FOR [kishori]
GO
/****** Object:  Default [DF__tb_addres__yuvak__20C1E124]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__yuvak__20C1E124]  DEFAULT (NULL) FOR [yuvak]
GO
/****** Object:  Default [DF__tb_addres__yuvat__21B6055D]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__yuvat__21B6055D]  DEFAULT (NULL) FOR [yuvati]
GO
/****** Object:  Default [DF__tb_addres__acces__22AA2996]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  CONSTRAINT [DF__tb_addres__acces__22AA2996]  DEFAULT (NULL) FOR [access_id]
GO
/****** Object:  Default [DF__tb_addres__Calen__2022C2A6]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012] ADD  DEFAULT ((0)) FOR [CalendarIssued]
GO
/****** Object:  Default [DF__tb_users__enct_p__014935CB]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_users] ADD  DEFAULT (NULL) FOR [enct_passwd]
GO
/****** Object:  Default [DF__tb_users__firstn__023D5A04]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_users] ADD  DEFAULT (NULL) FOR [firstname]
GO
/****** Object:  Default [DF__tb_users__lastna__03317E3D]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_users] ADD  DEFAULT (NULL) FOR [lastname]
GO
/****** Object:  Default [DF__tb_users__active__0425A276]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_users] ADD  DEFAULT (NULL) FOR [active]
GO
/****** Object:  Default [DF__tb_users__lastlo__0519C6AF]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_users] ADD  DEFAULT (NULL) FOR [lastlogin]
GO
ALTER TABLE [dbo].[tb_address_02_19_2012] CHECK CONSTRAINT [FK_tb_address_Category_old]
GO
/****** Object:  ForeignKey [FK_tb_address_CityNames_old]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012]  WITH CHECK ADD  CONSTRAINT [FK_tb_address_CityNames_old] FOREIGN KEY([cityid])
REFERENCES [dbo].[cityNames] ([CityId])
GO
ALTER TABLE [dbo].[tb_address_02_19_2012] CHECK CONSTRAINT [FK_tb_address_CityNames_old]
GO
/****** Object:  ForeignKey [FK_tb_address_RelationshipTypeID_old]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[tb_address_02_19_2012]  WITH CHECK ADD  CONSTRAINT [FK_tb_address_RelationshipTypeID_old] FOREIGN KEY([RelationshipTypeID])
REFERENCES [dbo].[RelationshipTypesOld] ([RelationshipTypeID])
GO
ALTER TABLE [dbo].[tb_address_02_19_2012] CHECK CONSTRAINT [FK_tb_address_RelationshipTypeID_old]
GO
/****** Object:  ForeignKey [FK_zonecities_CityNames]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[zonecities]  WITH CHECK ADD  CONSTRAINT [FK_zonecities_CityNames] FOREIGN KEY([CityId])
REFERENCES [dbo].[cityNames] ([CityId])
GO
ALTER TABLE [dbo].[zonecities] CHECK CONSTRAINT [FK_zonecities_CityNames]
GO
/****** Object:  ForeignKey [FK_zonecities_zones]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[zonecities]  WITH CHECK ADD  CONSTRAINT [FK_zonecities_zones] FOREIGN KEY([ZoneId])
REFERENCES [dbo].[zones] ([ZoneId])
GO
ALTER TABLE [dbo].[zonecities] CHECK CONSTRAINT [FK_zonecities_zones]
GO
/****** Object:  ForeignKey [FK_ZoneKaryakar_tb_address]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[zoneKaryakar]  WITH CHECK ADD  CONSTRAINT [FK_ZoneKaryakar_tb_address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[tb_address_02_19_2012] ([address_id])
GO
ALTER TABLE [dbo].[zoneKaryakar] CHECK CONSTRAINT [FK_ZoneKaryakar_tb_address]
GO
/****** Object:  ForeignKey [FK_ZoneKaryakar_zones]    Script Date: 11/23/2012 18:44:44 ******/
ALTER TABLE [dbo].[zoneKaryakar]  WITH CHECK ADD  CONSTRAINT [FK_ZoneKaryakar_zones] FOREIGN KEY([ZoneId])
REFERENCES [dbo].[zones] ([ZoneId])
GO
ALTER TABLE [dbo].[zoneKaryakar] CHECK CONSTRAINT [FK_ZoneKaryakar_zones]
GO
