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
	[FlagYear] [Int] NOT NULL
	CONSTRAINT [PK_EventFlags] PRIMARY KEY CLUSTERED 
(
	[EventFlagId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
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
