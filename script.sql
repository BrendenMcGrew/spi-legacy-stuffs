USE [master]
GO
/****** Object:  Database [Dev_SPI]    Script Date: 7/8/2021 9:21:33 AM ******/
CREATE DATABASE [Dev_SPI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Dev_SPI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DOUPSQLSERVER\MSSQL\DATA\Dev_SPI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Dev_SPI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DOUPSQLSERVER\MSSQL\DATA\Dev_SPI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Dev_SPI] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dev_SPI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dev_SPI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Dev_SPI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Dev_SPI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Dev_SPI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Dev_SPI] SET ARITHABORT OFF 
GO
ALTER DATABASE [Dev_SPI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Dev_SPI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Dev_SPI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Dev_SPI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Dev_SPI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Dev_SPI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Dev_SPI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Dev_SPI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Dev_SPI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Dev_SPI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Dev_SPI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Dev_SPI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Dev_SPI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Dev_SPI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Dev_SPI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Dev_SPI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Dev_SPI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Dev_SPI] SET RECOVERY FULL 
GO
ALTER DATABASE [Dev_SPI] SET  MULTI_USER 
GO
ALTER DATABASE [Dev_SPI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Dev_SPI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Dev_SPI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Dev_SPI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Dev_SPI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Dev_SPI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Dev_SPI', N'ON'
GO
ALTER DATABASE [Dev_SPI] SET QUERY_STORE = OFF
GO
USE [Dev_SPI]
GO
/****** Object:  Table [dbo].[tblArea]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblArea](
	[MemberID] [int] NOT NULL,
	[AreaID] [int] NULL,
	[AreaName] [varchar](50) NULL,
	[AreaType] [int] NULL,
	[AreaEmail] [varchar](50) NULL,
	[AreaEscort] [bit] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedWhen] [date] NULL,
	[TouchedBy] [varchar](50) NULL,
	[TouchedWhen] [date] NULL,
 CONSTRAINT [PK_tblArea_1] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBadgeInfo]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBadgeInfo](
	[MemID] [int] NOT NULL,
	[BadgeID] [int] NULL,
	[LineBadgeNumber] [varchar](20) NULL,
	[Height] [varchar](20) NULL,
	[Weight] [int] NULL,
	[ColorEyes] [int] NULL,
	[ColorHair] [int] NULL,
	[NewLineBadge] [bit] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedWhen] [date] NULL,
	[TouchedBy] [varchar](50) NULL,
	[TouchedWhen] [date] NULL,
 CONSTRAINT [PK_tblBadgeInfo] PRIMARY KEY CLUSTERED 
(
	[MemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClearance]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClearance](
	[MemberID] [int] NULL,
	[ClearanceID] [int] NULL,
	[ClearanceStatus] [int] NULL,
	[Eligibility] [varchar](5) NULL,
	[EligibleDate] [date] NULL,
	[SCI_Access] [date] NULL,
	[InvestigationOpenDate] [date] NULL,
	[InvestigationCloseDate] [date] NULL,
	[InvestigationID] [int] NULL,
	[CE_DefermentDate] [date] NULL,
	[ClearanceLevel] [int] NULL,
	[PR_Submitted] [date] NULL,
	[PR_Emailed] [date] NULL,
	[PR_RemarksID] [int] NULL,
	[EQIPStatus] [varchar](50) NULL,
	[DaysUntilTerminatioin] [int] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedWhen] [date] NULL,
	[TouchedBy] [varchar](50) NULL,
	[TouchedWhen] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLkup_AreaType]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLkup_AreaType](
	[AreaTypeID] [int] NULL,
	[AreaTypeName] [varchar](12) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLkup_Citizenship]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLkup_Citizenship](
	[CitizenshipID] [int] NOT NULL,
	[CitizenshipType] [varchar](50) NULL,
 CONSTRAINT [PK_tblLkup_Citizenship] PRIMARY KEY CLUSTERED 
(
	[CitizenshipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLkup_ClearanceLevel]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLkup_ClearanceLevel](
	[ClearanceID] [int] NOT NULL,
	[ClearanceLevel] [varchar](50) NULL,
	[ClearanceOrder] [varchar](2) NULL,
	[SAR_Code] [varchar](2) NULL,
	[Inv_Type] [varchar](6) NULL,
 CONSTRAINT [PK_tblLkup_ClearanceLevel] PRIMARY KEY CLUSTERED 
(
	[ClearanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLkup_ClearenceStatus]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLkup_ClearenceStatus](
	[ClearenceID] [int] NOT NULL,
	[ClearenceStatusDescription] [varchar](50) NULL,
 CONSTRAINT [PK_tblLkup_ClearenceStatus] PRIMARY KEY CLUSTERED 
(
	[ClearenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLkup_CoManners]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLkup_CoManners](
	[CoMannerID] [int] NOT NULL,
	[CoMannerName] [varchar](50) NULL,
 CONSTRAINT [PK_tblLkup_CoManners] PRIMARY KEY CLUSTERED 
(
	[CoMannerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLkup_CrewPosition]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLkup_CrewPosition](
	[CrewID] [int] NULL,
	[CrewPositionType] [varchar](8) NULL,
	[CrewDuties] [varchar](500) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedWhen] [date] NULL,
	[TouchedBy] [varchar](50) NULL,
	[TouchedWhen] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLkup_EyeColor]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLkup_EyeColor](
	[EyeID] [int] NOT NULL,
	[EyeColor] [varchar](10) NULL,
 CONSTRAINT [PK_tblLkup_EyeColor] PRIMARY KEY CLUSTERED 
(
	[EyeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLkup_Forms]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLkup_Forms](
	[FormsID] [int] NOT NULL,
	[FormName] [varchar](10) NULL,
 CONSTRAINT [PK_tblLkup_Forms] PRIMARY KEY CLUSTERED 
(
	[FormsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLkup_HairColor]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLkup_HairColor](
	[HairID] [int] NOT NULL,
	[HairColor] [varchar](10) NULL,
 CONSTRAINT [PK_tblLkup_HairColor] PRIMARY KEY CLUSTERED 
(
	[HairID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLkup_Height]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLkup_Height](
	[HeightID] [int] NOT NULL,
	[HeightDescription] [varchar](20) NULL,
 CONSTRAINT [PK_tblLkup_Height] PRIMARY KEY CLUSTERED 
(
	[HeightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLkup_InvestigationType]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLkup_InvestigationType](
	[InvestigationID] [int] NULL,
	[InvestigationType] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLkup_Office]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLkup_Office](
	[OfficeID] [int] NOT NULL,
	[OfficeName] [nchar](10) NOT NULL,
	[OfficePhone] [nchar](10) NOT NULL,
	[OfficeBuilding] [nchar](10) NOT NULL,
	[OfficeRoom] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tblLkup_Office] PRIMARY KEY CLUSTERED 
(
	[OfficeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLkup_Rank]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLkup_Rank](
	[RankID] [int] NULL,
	[Rank] [varchar](10) NULL,
	[RankOrder] [nchar](10) NULL,
	[Grade] [varchar](8) NULL,
	[ABRV_Rank] [varchar](10) NULL,
	[UMD_Rank] [varchar](10) NULL,
	[Full_Rank] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLkup_States]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLkup_States](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](20) NULL,
	[StateCode] [char](2) NULL,
 CONSTRAINT [PK_tblLkup_States] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMemberStatusChecks]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMemberStatusChecks](
	[MemberID] [int] NULL,
	[JPAS] [bit] NULL,
	[NATO_Indoc] [bit] NULL,
	[NDA_Signed] [bit] NULL,
	[NATO] [bit] NULL,
	[SCI] [bit] NULL,
	[SIPRToken] [bit] NULL,
	[FlightLinePhotographer] [bit] NULL,
	[SAP] [bit] NULL,
	[RMA] [bit] NULL,
	[RMA_NonCurrent] [bit] NULL,
	[ProximityCard] [bit] NULL,
	[Comsec_NonCurrent] [bit] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedWhen] [date] NULL,
	[TouchedBy] [varchar](50) NULL,
	[TouchedWhen] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSafeAccessStatus]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSafeAccessStatus](
	[MemberID] [int] NULL,
	[SARMSafeAccess] [bit] NULL,
	[SARMSafeCustodian] [bit] NULL,
	[DOWSafeCustodian] [bit] NULL,
	[DOWSafeAccess] [bit] NULL,
	[IntelSafeAccess] [bit] NULL,
	[IntelSafeCustodian] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSCODates]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSCODates](
	[MemberID] [int] NULL,
	[SCO1Last] [date] NULL,
	[SCO2Last] [date] NULL,
	[SCO3Last] [date] NULL,
	[SCO4Last] [date] NULL,
	[OPSECDate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSecuirtyManager]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSecuirtyManager](
	[SecurityManagerID] [int] NOT NULL,
	[SecurityManagerName] [varchar](50) NULL,
	[SecurityLogon] [varchar](50) NULL,
	[SecuritySignature] [varchar](50) NULL,
	[SecurityUnitPasscode] [varchar](20) NULL,
	[SecurityUnitPasscode2] [varchar](20) NULL,
	[SecurityUnitPasscode3] [varchar](20) NULL,
 CONSTRAINT [PK_tblSecuirtyManager] PRIMARY KEY CLUSTERED 
(
	[SecurityManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSquadronRoster]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSquadronRoster](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[MiddleName] [varchar](20) NULL,
	[LastName] [varchar](20) NOT NULL,
	[SSN] [varchar](12) NOT NULL,
	[DOD_ID_Number] [varchar](15) NOT NULL,
	[RankID] [int] NOT NULL,
	[OfficeID] [int] NOT NULL,
	[PersonCategory] [varchar](50) NOT NULL,
	[MBRLastUpdate] [date] NOT NULL,
	[InitDate] [date] NOT NULL,
	[DutyPhone] [varchar](15) NULL,
	[Remarks] [varchar](100) NULL,
	[Forms] [int] NULL,
	[InProcessedBy] [varchar](100) NULL,
	[LastJPASUpdate] [date] NULL,
	[Form9] [bit] NULL,
	[Attached] [varchar](50) NULL,
	[CoManners] [bit] NULL,
	[CrewID] [int] NULL,
	[Unit] [varchar](8) NULL,
	[Location] [varchar](50) NULL,
	[AtLevel1Last] [date] NULL,
	[BadgeID] [int] NULL,
	[ForeignTravel] [int] NULL,
	[NewLineBadge] [bit] NULL,
	[InprocessDate] [date] NULL,
	[Photo] [int] NULL,
	[BirthCity] [varchar](50) NULL,
	[BirthState] [int] NULL,
	[BirthCountry] [varchar](50) NULL,
	[EmailAddress] [varchar](100) NULL,
	[BirthDate] [date] NULL,
	[Citizenship] [varchar](50) NULL,
	[SVROSTETrainingDate] [date] NULL,
	[SVROSTETrained] [bit] NULL,
	[CurrentStreetAddress] [varchar](100) NULL,
	[CurrentCityAddress] [varchar](50) NULL,
	[CurrentStateAddress] [int] NULL,
	[CurrentZipCode] [varchar](10) NULL,
	[HomePhone] [varchar](15) NOT NULL,
	[AlphaRoster] [bit] NULL,
	[AutoImport] [bit] NULL,
	[OtherRemarks] [varchar](50) NULL,
	[Accesses] [varchar](10) NULL,
	[PAFSC] [varchar](20) NULL,
	[SecurityAssistant] [bit] NULL,
	[BilletNumber] [varchar](20) NULL,
	[BilletSar] [numeric](18, 0) NULL,
	[CUI_TrainingDate] [date] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedWhen] [date] NULL,
	[TouchedBy] [varchar](50) NULL,
	[TouchedWhen] [date] NULL,
 CONSTRAINT [PK_tblSquadronRoster] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSquadrons]    Script Date: 7/8/2021 9:21:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSquadrons](
	[Squad_ID] [int] IDENTITY(1,1) NOT NULL,
	[SquadPasscode] [varchar](15) NULL,
	[SquadAbbrv] [varchar](15) NULL,
	[SquadSH] [varchar](10) NULL,
	[SquadName] [varchar](100) NULL,
	[SquadPhone] [varchar](10) NULL,
	[SquadEmail] [varchar](100) NULL,
	[SquadYN] [bit] NULL,
 CONSTRAINT [PK_tblSquadrons] PRIMARY KEY CLUSTERED 
(
	[Squad_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblArea] ([MemberID], [AreaID], [AreaName], [AreaType], [AreaEmail], [AreaEscort], [CreatedBy], [CreatedWhen], [TouchedBy], [TouchedWhen]) VALUES (3, 126, N'3', 1, N'Tinker.Area.3@Tinker.af.mil', 1, N'Dean St. Onge', CAST(N'2021-04-05' AS Date), N'Dean St. Onge', CAST(N'2021-04-05' AS Date))
GO
INSERT [dbo].[tblBadgeInfo] ([MemID], [BadgeID], [LineBadgeNumber], [Height], [Weight], [ColorEyes], [ColorHair], [NewLineBadge], [CreatedBy], [CreatedWhen], [TouchedBy], [TouchedWhen]) VALUES (3, 1, N'R023483', N'4', 220, 3, 4, 1, N'Dean St. Onge', CAST(N'2021-04-05' AS Date), N'Dean St. Onge', CAST(N'2021-04-05' AS Date))
INSERT [dbo].[tblBadgeInfo] ([MemID], [BadgeID], [LineBadgeNumber], [Height], [Weight], [ColorEyes], [ColorHair], [NewLineBadge], [CreatedBy], [CreatedWhen], [TouchedBy], [TouchedWhen]) VALUES (4, 2, N'R042355', N'5', 180, 2, 3, 1, N'A1C Goni', CAST(N'2021-07-07' AS Date), N'A1C Goni', CAST(N'2021-07-07' AS Date))
GO
INSERT [dbo].[tblClearance] ([MemberID], [ClearanceID], [ClearanceStatus], [Eligibility], [EligibleDate], [SCI_Access], [InvestigationOpenDate], [InvestigationCloseDate], [InvestigationID], [CE_DefermentDate], [ClearanceLevel], [PR_Submitted], [PR_Emailed], [PR_RemarksID], [EQIPStatus], [DaysUntilTerminatioin], [CreatedBy], [CreatedWhen], [TouchedBy], [TouchedWhen]) VALUES (3, 1, 1, N'SCI', CAST(N'2018-02-09' AS Date), CAST(N'2020-04-04' AS Date), NULL, CAST(N'2020-07-09' AS Date), 3, CAST(N'2021-02-02' AS Date), 2, CAST(N'2021-04-05' AS Date), CAST(N'2021-04-05' AS Date), 1, N'XXXXXXXX', 5, N'Dean St. Onge', CAST(N'2021-04-05' AS Date), N'Dean St. Onge', CAST(N'2021-04-05' AS Date))
INSERT [dbo].[tblClearance] ([MemberID], [ClearanceID], [ClearanceStatus], [Eligibility], [EligibleDate], [SCI_Access], [InvestigationOpenDate], [InvestigationCloseDate], [InvestigationID], [CE_DefermentDate], [ClearanceLevel], [PR_Submitted], [PR_Emailed], [PR_RemarksID], [EQIPStatus], [DaysUntilTerminatioin], [CreatedBy], [CreatedWhen], [TouchedBy], [TouchedWhen]) VALUES (4, 2, 1, N'SCI', CAST(N'2018-09-19' AS Date), CAST(N'2020-02-03' AS Date), NULL, CAST(N'2020-07-04' AS Date), 3, CAST(N'2021-02-03' AS Date), 4, CAST(N'2021-05-05' AS Date), CAST(N'2021-03-04' AS Date), 1, N'XXXXXXXX', 3, N'Dean St. Onge', CAST(N'2021-06-29' AS Date), N'Dean St. Onge', CAST(N'2021-06-29' AS Date))
GO
INSERT [dbo].[tblLkup_AreaType] ([AreaTypeID], [AreaTypeName]) VALUES (1, N'CONTROLLED')
INSERT [dbo].[tblLkup_AreaType] ([AreaTypeID], [AreaTypeName]) VALUES (2, N'RESTRICTED')
GO
INSERT [dbo].[tblLkup_Citizenship] ([CitizenshipID], [CitizenshipType]) VALUES (1, N'US CITIZEN')
INSERT [dbo].[tblLkup_Citizenship] ([CitizenshipID], [CitizenshipType]) VALUES (2, N'NON-US CITIZEN')
GO
INSERT [dbo].[tblLkup_ClearanceLevel] ([ClearanceID], [ClearanceLevel], [ClearanceOrder], [SAR_Code], [Inv_Type]) VALUES (1, N'Interim SCI', N'5', NULL, NULL)
INSERT [dbo].[tblLkup_ClearanceLevel] ([ClearanceID], [ClearanceLevel], [ClearanceOrder], [SAR_Code], [Inv_Type]) VALUES (2, N'Interim Secret', N'1', NULL, NULL)
INSERT [dbo].[tblLkup_ClearanceLevel] ([ClearanceID], [ClearanceLevel], [ClearanceOrder], [SAR_Code], [Inv_Type]) VALUES (3, N'Interim Top Secret', N'3', NULL, NULL)
INSERT [dbo].[tblLkup_ClearanceLevel] ([ClearanceID], [ClearanceLevel], [ClearanceOrder], [SAR_Code], [Inv_Type]) VALUES (4, N'N/A', N'6', N'0', NULL)
INSERT [dbo].[tblLkup_ClearanceLevel] ([ClearanceID], [ClearanceLevel], [ClearanceOrder], [SAR_Code], [Inv_Type]) VALUES (5, N'Secret', N'2', N'6', N'NACLC')
INSERT [dbo].[tblLkup_ClearanceLevel] ([ClearanceID], [ClearanceLevel], [ClearanceOrder], [SAR_Code], [Inv_Type]) VALUES (6, N'Top Secret', N'4', N'5', N'SSBI')
GO
INSERT [dbo].[tblLkup_ClearenceStatus] ([ClearenceID], [ClearenceStatusDescription]) VALUES (1, N'Active')
INSERT [dbo].[tblLkup_ClearenceStatus] ([ClearenceID], [ClearenceStatusDescription]) VALUES (2, N'Adjudication Pending')
INSERT [dbo].[tblLkup_ClearenceStatus] ([ClearenceID], [ClearenceStatusDescription]) VALUES (3, N'DENIED/REVOKED')
INSERT [dbo].[tblLkup_ClearenceStatus] ([ClearenceID], [ClearenceStatusDescription]) VALUES (4, N'LOR/LOD ISSUE')
INSERT [dbo].[tblLkup_ClearenceStatus] ([ClearenceID], [ClearenceStatusDescription]) VALUES (5, N'No Determination Made')
INSERT [dbo].[tblLkup_ClearenceStatus] ([ClearenceID], [ClearenceStatusDescription]) VALUES (6, N'REMOVED(Locally)')
INSERT [dbo].[tblLkup_ClearenceStatus] ([ClearenceID], [ClearenceStatusDescription]) VALUES (7, N'SOR Pending')
INSERT [dbo].[tblLkup_ClearenceStatus] ([ClearenceID], [ClearenceStatusDescription]) VALUES (8, N'SUSPENDED')
GO
INSERT [dbo].[tblLkup_CoManners] ([CoMannerID], [CoMannerName]) VALUES (1, N'Foreign')
INSERT [dbo].[tblLkup_CoManners] ([CoMannerID], [CoMannerName]) VALUES (2, N'Non-Foreign')
INSERT [dbo].[tblLkup_CoManners] ([CoMannerID], [CoMannerName]) VALUES (3, N'No Idea')
GO
INSERT [dbo].[tblLkup_CrewPosition] ([CrewID], [CrewPositionType], [CrewDuties], [CreatedBy], [CreatedWhen], [TouchedBy], [TouchedWhen]) VALUES (1, N'ART', N'Duties as an AIRBORNE RADAR TECHNICIAN requires frequent unescorted access to the areas listed in Section IV.', N'Dean St. Onge', CAST(N'2021-04-05' AS Date), N'Dean St. Onge', CAST(N'2021-04-05' AS Date))
INSERT [dbo].[tblLkup_CrewPosition] ([CrewID], [CrewPositionType], [CrewDuties], [CreatedBy], [CreatedWhen], [TouchedBy], [TouchedWhen]) VALUES (2, N'ASO', N'CrewDuties
Duties as an AIR SURVEILLANCE OFFICER requires frequent unescorted access to the areas listed in Section IV.', N'Dean St. Onge', CAST(N'2021-04-05' AS Date), N'Dean St. Onge', CAST(N'2021-04-05' AS Date))
INSERT [dbo].[tblLkup_CrewPosition] ([CrewID], [CrewPositionType], [CrewDuties], [CreatedBy], [CreatedWhen], [TouchedBy], [TouchedWhen]) VALUES (3, N'AST', N'CrewDuties
Duties as an AIR SURVEILLANCE TECHNICIAN requires frequent unescorted access to the areas listed in Section IV.', N'Dean St. Onge', CAST(N'2021-04-05' AS Date), N'Dean St. Onge', CAST(N'2021-04-05' AS Date))
INSERT [dbo].[tblLkup_CrewPosition] ([CrewID], [CrewPositionType], [CrewDuties], [CreatedBy], [CreatedWhen], [TouchedBy], [TouchedWhen]) VALUES (4, N'AWO', N'CrewDuties
Duties as an AIR WEAPONS OFFICER requires frequent unescorted access to the areas listed in Section IV.', N'Dean St. Onge', CAST(N'2021-04-05' AS Date), N'Dean St. Onge', CAST(N'2021-04-05' AS Date))
INSERT [dbo].[tblLkup_CrewPosition] ([CrewID], [CrewPositionType], [CrewDuties], [CreatedBy], [CreatedWhen], [TouchedBy], [TouchedWhen]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblLkup_EyeColor] ([EyeID], [EyeColor]) VALUES (1, N'Green')
INSERT [dbo].[tblLkup_EyeColor] ([EyeID], [EyeColor]) VALUES (2, N'Blue')
INSERT [dbo].[tblLkup_EyeColor] ([EyeID], [EyeColor]) VALUES (3, N'Brown')
INSERT [dbo].[tblLkup_EyeColor] ([EyeID], [EyeColor]) VALUES (4, N'Hazel')
INSERT [dbo].[tblLkup_EyeColor] ([EyeID], [EyeColor]) VALUES (5, N'White')
INSERT [dbo].[tblLkup_EyeColor] ([EyeID], [EyeColor]) VALUES (6, N'Bloodshot')
GO
INSERT [dbo].[tblLkup_Forms] ([FormsID], [FormName]) VALUES (1, N'2586')
INSERT [dbo].[tblLkup_Forms] ([FormsID], [FormName]) VALUES (2, N'2587')
INSERT [dbo].[tblLkup_Forms] ([FormsID], [FormName]) VALUES (3, N'2586/2587')
GO
INSERT [dbo].[tblLkup_HairColor] ([HairID], [HairColor]) VALUES (1, N'Black')
INSERT [dbo].[tblLkup_HairColor] ([HairID], [HairColor]) VALUES (2, N'Drk Brown')
INSERT [dbo].[tblLkup_HairColor] ([HairID], [HairColor]) VALUES (3, N'White')
INSERT [dbo].[tblLkup_HairColor] ([HairID], [HairColor]) VALUES (4, N'Blonde')
INSERT [dbo].[tblLkup_HairColor] ([HairID], [HairColor]) VALUES (5, N'Yellow')
INSERT [dbo].[tblLkup_HairColor] ([HairID], [HairColor]) VALUES (6, N'Red')
INSERT [dbo].[tblLkup_HairColor] ([HairID], [HairColor]) VALUES (7, N'Other')
GO
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (1, N'4''0"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (2, N'4''1"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (3, N'4''2"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (4, N'4''3"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (5, N'4''4"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (6, N'4''5"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (7, N'4''6"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (8, N'4''7"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (9, N'4''8"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (10, N'4''9"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (11, N'4''10"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (12, N'4''11"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (13, N'5''0"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (14, N'5''1"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (15, N'5''2"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (16, N'5''3"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (17, N'5''4"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (18, N'5''5"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (19, N'5''6"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (20, N'5''7"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (21, N'5''8"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (22, N'5''9"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (23, N'5''10"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (24, N'5''11"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (25, N'6''0"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (26, N'6''1"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (27, N'6''2"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (28, N'6''3"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (29, N'6''4"')
INSERT [dbo].[tblLkup_Height] ([HeightID], [HeightDescription]) VALUES (30, N'6''5"')
GO
INSERT [dbo].[tblLkup_InvestigationType] ([InvestigationID], [InvestigationType]) VALUES (1, N'ANACI')
INSERT [dbo].[tblLkup_InvestigationType] ([InvestigationID], [InvestigationType]) VALUES (2, N'SSBI')
INSERT [dbo].[tblLkup_InvestigationType] ([InvestigationID], [InvestigationType]) VALUES (3, N'T5')
INSERT [dbo].[tblLkup_InvestigationType] ([InvestigationID], [InvestigationType]) VALUES (4, N'S')
GO
INSERT [dbo].[tblLkup_Office] ([OfficeID], [OfficeName], [OfficePhone], [OfficeBuilding], [OfficeRoom]) VALUES (1, N'ADO       ', N'884-0819  ', N'255       ', N'314       ')
INSERT [dbo].[tblLkup_Office] ([OfficeID], [OfficeName], [OfficePhone], [OfficeBuilding], [OfficeRoom]) VALUES (2, N'CCV       ', N'884-6711  ', N'255       ', N'304       ')
GO
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (1, N'1LT', N'13        ', N'O2', N'1Lt', N'1LT', N'First Lieutenant')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (2, N'2LT', N'12        ', N'O1', N'2Lt', N'2LT', N'Second Lietenant')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (3, N'A1C', N'3         ', N'E3', N'A1C', N'A1C', N'Airman First Class')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (4, N'AB', N'1         ', N'E1', N'AB', N'AB', N'Airman Basic')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (5, N'AMN', N'2         ', N'E2', N'Amn', N'AMN', N'Airman')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (6, N'BGEN', N'18        ', N'O7', N'Brig Gen', N'BGN', N'Brigadier General')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (7, N'CAPT', N'14        ', N'O3', N'Capt', N'CPT', N'Captain')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (8, N'CIV', N'23        ', N'CIV', N'Civ', N'Civ', N'Civilian')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (9, N'CMSGT', N'10        ', N'E9', N'CMSgt', N'CMS', N'Chief Master Sergeant')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (10, N'COL', N'17        ', N'O6', N'Col', N'COL', N'Colonel')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (11, N'CTR', N'24        ', N'CTR', N'CTR', N'CTR', N'Contractor')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (12, N'FLT OFF', N'22        ', N'FLT OFF', N'Flt Off', N'FLT OFF', N'FLT OFF')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (13, N'GEN', N'21        ', N'O10', N'Gen', N'GEN', N'General')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (14, N'LT COL', N'16        ', N'O5', N'Lt. Col', N'LTC', N'Lieutenant Colonel')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (15, N'LT GEN', N'20        ', N'09', N'Lt. Gen', N'LGN', N'Lieutenant General')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (16, N'MAJ', N'15        ', N'O4', N'Maj', N'MAJ', N'Major')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (17, N'MAJ GEN', N'19        ', N'O8', N'Maj Gen', N'MGN', N'Major General')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (18, N'MCPL', N'5         ', N'MCPL', N'MCPL', N'MCPL', N'MCPL')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (19, N'MSGT', N'8         ', N'E7', N'MSgt', N'MSG', N'Master Sergeant')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (20, N'SMSGT', N'9         ', N'E8', N'SMSgt', N'SMS', N'Senior Master Sergeant')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (21, N'SRA', N'4         ', N'E4', N'SrA', N'SRA', N'Senior Airman')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (22, N'SSGT', N'6         ', N'E5', N'SSgt', N'SSG', N'Staff Sergeant')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (23, N'TSGT', N'7         ', N'E6', N'TSgt', N'TSG', N'Technical Sergeant')
INSERT [dbo].[tblLkup_Rank] ([RankID], [Rank], [RankOrder], [Grade], [ABRV_Rank], [UMD_Rank], [Full_Rank]) VALUES (24, N'WO', N'11        ', N'WO', N'WO', N'WO', N'Warrant Officer')
GO
SET IDENTITY_INSERT [dbo].[tblLkup_States] ON 

INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (1, N'Alabama', N'AL')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (2, N'Arkansas', N'AR')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (3, N'Arizona', N'AZ')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (4, N'California', N'CA')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (5, N'Colorado', N'CO')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (6, N'Connecticut', N'CT')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (7, N'District of Columbia', N'DC')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (8, N'Delaware', N'DE')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (9, N'Florida', N'FL')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (10, N'Georgia', N'GA')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (11, N'Hawaii', N'HI')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (12, N'Iowa', N'IA')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (13, N'Idaho', N'ID')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (14, N'Illinios', N'IL')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (15, N'Indiana', N'IN')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (16, N'Kansas', N'KS')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (17, N'Kentucy', N'KY')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (18, N'Louisiana', N'LA')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (19, N'Masschusetts', N'MA')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (20, N'Maryland', N'MD')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (21, N'Maine', N'ME')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (22, N'Michigan', N'MI')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (23, N'Minnesota', N'MN')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (24, N'Missouri', N'MO')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (25, N'Mississippi', N'MS')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (26, N'Montana', N'MT')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (27, N'North Carolina', N'NC')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (28, N'North Dakota', N'ND')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (29, N'Nebraska', N'NE')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (30, N'New Hampshire', N'NH')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (31, N'New Jersey', N'NJ')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (32, N'New Mexico', N'NM')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (33, N'Nevada', N'NV')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (34, N'New York', N'NY')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (35, N'Ohio', N'OH')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (36, N'Oklahoma', N'OK')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (37, N'Oregon', N'OR')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (38, N'Pennsylvania', N'PA')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (39, N'Rhode Island', N'RI')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (40, N'South Carolina', N'SC')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (41, N'South Dakota', N'SD')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (42, N'Tennessee', N'TN')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (43, N'Texas', N'TX')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (44, N'Utah', N'UT')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (45, N'Virginia', N'VA')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (46, N'Vermont', N'VT')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (47, N'Washington', N'WA')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (48, N'Wisconsin', N'WI')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (49, N'West Virginia', N'WV')
INSERT [dbo].[tblLkup_States] ([StateID], [StateName], [StateCode]) VALUES (50, N'Wyoming', N'WY')
SET IDENTITY_INSERT [dbo].[tblLkup_States] OFF
GO
INSERT [dbo].[tblMemberStatusChecks] ([MemberID], [JPAS], [NATO_Indoc], [NDA_Signed], [NATO], [SCI], [SIPRToken], [FlightLinePhotographer], [SAP], [RMA], [RMA_NonCurrent], [ProximityCard], [Comsec_NonCurrent], [CreatedBy], [CreatedWhen], [TouchedBy], [TouchedWhen]) VALUES (3, 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 1, N'Dean St. Onge', CAST(N'2021-04-05' AS Date), N'Dean St. Onge', CAST(N'2021-04-05' AS Date))
GO
INSERT [dbo].[tblSafeAccessStatus] ([MemberID], [SARMSafeAccess], [SARMSafeCustodian], [DOWSafeCustodian], [DOWSafeAccess], [IntelSafeAccess], [IntelSafeCustodian]) VALUES (3, 1, 1, 1, 1, 0, 1)
GO
INSERT [dbo].[tblSCODates] ([MemberID], [SCO1Last], [SCO2Last], [SCO3Last], [SCO4Last], [OPSECDate]) VALUES (3, CAST(N'2021-04-06' AS Date), CAST(N'2021-04-06' AS Date), CAST(N'2021-04-06' AS Date), CAST(N'2021-04-06' AS Date), CAST(N'2021-04-06' AS Date))
GO
INSERT [dbo].[tblSecuirtyManager] ([SecurityManagerID], [SecurityManagerName], [SecurityLogon], [SecuritySignature], [SecurityUnitPasscode], [SecurityUnitPasscode2], [SecurityUnitPasscode3]) VALUES (1, N'GOAD, TYLER D A1C USAF', N'1555857183A', N'GOAD.TYLER.D.1555857183.A', N'TE1CFJ9', NULL, NULL)
INSERT [dbo].[tblSecuirtyManager] ([SecurityManagerID], [SecurityManagerName], [SecurityLogon], [SecuritySignature], [SecurityUnitPasscode], [SecurityUnitPasscode2], [SecurityUnitPasscode3]) VALUES (2, N'GONI, DEREK E A1C USAF', N'
1551173174A', N'
GONI.DEREK.E.1551173174.A', N'TE1CFJ9', NULL, NULL)
INSERT [dbo].[tblSecuirtyManager] ([SecurityManagerID], [SecurityManagerName], [SecurityLogon], [SecuritySignature], [SecurityUnitPasscode], [SecurityUnitPasscode2], [SecurityUnitPasscode3]) VALUES (3, N'GOYER, ZACHARY O SSgt USAF', N'1514066279A', N'GOYER.ZACHARY.O.1514066279.A', N'TE1CFJ9', NULL, NULL)
INSERT [dbo].[tblSecuirtyManager] ([SecurityManagerID], [SecurityManagerName], [SecurityLogon], [SecuritySignature], [SecurityUnitPasscode], [SecurityUnitPasscode2], [SecurityUnitPasscode3]) VALUES (4, N'ESKRIDGE, PRESTON M GS-12 USAF', N'1176118985C', N'ESKRIDGE.PRESTON.M.1176118985.C', N'TE1CFJ9', NULL, NULL)
INSERT [dbo].[tblSecuirtyManager] ([SecurityManagerID], [SecurityManagerName], [SecurityLogon], [SecuritySignature], [SecurityUnitPasscode], [SecurityUnitPasscode2], [SecurityUnitPasscode3]) VALUES (5, N'HICKEY, MICHAEL T A1C USAF', N'1287478409.A', N'HICKEY.MICHAEL.T.1287478409.A', N'TE1CFJ9', NULL, NULL)
INSERT [dbo].[tblSecuirtyManager] ([SecurityManagerID], [SecurityManagerName], [SecurityLogon], [SecuritySignature], [SecurityUnitPasscode], [SecurityUnitPasscode2], [SecurityUnitPasscode3]) VALUES (6, N'ST ONGE, DEAN GS-11 USAF', N'1516328572C', N'ST_ONGE.DEAN.1516328572.C', N'TE1CFJ9', NULL, NULL)
INSERT [dbo].[tblSecuirtyManager] ([SecurityManagerID], [SecurityManagerName], [SecurityLogon], [SecuritySignature], [SecurityUnitPasscode], [SecurityUnitPasscode2], [SecurityUnitPasscode3]) VALUES (7, N'MCGREW, BRENDEN J A1C USAF', N'1556746849A', N'MCGREW, BRENDEN J.1556746849.A', N'TE1CFJ9', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[tblSquadronRoster] ON 

INSERT [dbo].[tblSquadronRoster] ([MemberID], [Name], [MiddleName], [LastName], [SSN], [DOD_ID_Number], [RankID], [OfficeID], [PersonCategory], [MBRLastUpdate], [InitDate], [DutyPhone], [Remarks], [Forms], [InProcessedBy], [LastJPASUpdate], [Form9], [Attached], [CoManners], [CrewID], [Unit], [Location], [AtLevel1Last], [BadgeID], [ForeignTravel], [NewLineBadge], [InprocessDate], [Photo], [BirthCity], [BirthState], [BirthCountry], [EmailAddress], [BirthDate], [Citizenship], [SVROSTETrainingDate], [SVROSTETrained], [CurrentStreetAddress], [CurrentCityAddress], [CurrentStateAddress], [CurrentZipCode], [HomePhone], [AlphaRoster], [AutoImport], [OtherRemarks], [Accesses], [PAFSC], [SecurityAssistant], [BilletNumber], [BilletSar], [CUI_TrainingDate], [CreatedBy], [CreatedWhen], [TouchedBy], [TouchedWhen]) VALUES (3, N'James', N'L', N'Howlett', N'444345678', N'1234567890', 5, 1, N'CIV', CAST(N'2020-03-05' AS Date), CAST(N'2021-01-01' AS Date), N'14056783456', N'This is a remark', 1, N'Charles Xavier', CAST(N'2021-02-02' AS Date), 1, N'552 ACW', 1, 1, N'221', N'Tinker', CAST(N'2019-04-03' AS Date), 1, 1, 1, CAST(N'2021-03-04' AS Date), 1, N'Oklahoma City', 37, N'USA', N'james.howlett@us.af.mil', CAST(N'1974-04-06' AS Date), N'US CITIZEN', CAST(N'2021-03-03' AS Date), 1, N'123 Street Name', N'Del City', 37, N'73525', N'1405678-0898', 1, 1, N'This is the other remark.', N'TS', N'3D173', 1, N'00429841C', CAST(5 AS Numeric(18, 0)), CAST(N'2021-01-01' AS Date), N'Dean St. Onge', CAST(N'2021-04-05' AS Date), N'Dean St. Onge', CAST(N'2021-04-05' AS Date))
INSERT [dbo].[tblSquadronRoster] ([MemberID], [Name], [MiddleName], [LastName], [SSN], [DOD_ID_Number], [RankID], [OfficeID], [PersonCategory], [MBRLastUpdate], [InitDate], [DutyPhone], [Remarks], [Forms], [InProcessedBy], [LastJPASUpdate], [Form9], [Attached], [CoManners], [CrewID], [Unit], [Location], [AtLevel1Last], [BadgeID], [ForeignTravel], [NewLineBadge], [InprocessDate], [Photo], [BirthCity], [BirthState], [BirthCountry], [EmailAddress], [BirthDate], [Citizenship], [SVROSTETrainingDate], [SVROSTETrained], [CurrentStreetAddress], [CurrentCityAddress], [CurrentStateAddress], [CurrentZipCode], [HomePhone], [AlphaRoster], [AutoImport], [OtherRemarks], [Accesses], [PAFSC], [SecurityAssistant], [BilletNumber], [BilletSar], [CUI_TrainingDate], [CreatedBy], [CreatedWhen], [TouchedBy], [TouchedWhen]) VALUES (4, N'John', N'F', N'Powers', N'444557788', N'1234568876', 2, 2, N'CIV', CAST(N'2020-04-07' AS Date), CAST(N'2021-01-01' AS Date), N'40567776543', N'This is another remark', 1, N'Chris Walker', CAST(N'2021-04-05' AS Date), 1, N'552ACW', 1, 1, N'221', N'Tinker', CAST(N'2019-05-06' AS Date), 1, 1, 1, CAST(N'2021-04-04' AS Date), 1, N'Oklahoma City', 22, N'USA', N'John.Powers@gmail.com', CAST(N'1974-07-09' AS Date), N'US CITIZEN', CAST(N'2021-04-05' AS Date), 1, N'234 Birch', N'Midwest City', 37, N'73160', N'14056770987', 1, 1, N'This is', N'TS', N'3D173', 1, N'00342532C', CAST(5 AS Numeric(18, 0)), CAST(N'2021-09-08' AS Date), N'Dean St. Onge', CAST(N'2021-06-29' AS Date), N'Dean St. Onge', CAST(N'2021-06-29' AS Date))
SET IDENTITY_INSERT [dbo].[tblSquadronRoster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSquadrons] ON 

INSERT [dbo].[tblSquadrons] ([Squad_ID], [SquadPasscode], [SquadAbbrv], [SquadSH], [SquadName], [SquadPhone], [SquadEmail], [SquadYN]) VALUES (1, N'TE1CFDFP', N'960 AACS', N'960', N'960th AIRBORNE AIR CONTROL SQUADRON (ACC)', N' 739-3349', N'960.aacs.spp@us.af.mil', 0)
INSERT [dbo].[tblSquadrons] ([Squad_ID], [SquadPasscode], [SquadAbbrv], [SquadSH], [SquadName], [SquadPhone], [SquadEmail], [SquadYN]) VALUES (2, N'TE1CFYRY', N'963 AACS', N'963', N'963rd AIRBORNE AIR CONTROL SQUADRON (ACC)', N' 734-7342', N'963aacs.security@us.af.mil', 0)
INSERT [dbo].[tblSquadrons] ([Squad_ID], [SquadPasscode], [SquadAbbrv], [SquadSH], [SquadName], [SquadPhone], [SquadEmail], [SquadYN]) VALUES (3, N'TE1CFYRZ', N'964 AACS', N'964', N'964th AIRBORNE AIR CONTROL SQUADRON (ACC)', N'734-3824', N'964aacs.security2@us.af.mil', 0)
SET IDENTITY_INSERT [dbo].[tblSquadrons] OFF
GO
ALTER TABLE [dbo].[tblSafeAccessStatus] ADD  CONSTRAINT [DF_tblSafeAccessStatus_SARMSafeAccess]  DEFAULT ((0)) FOR [SARMSafeAccess]
GO
ALTER TABLE [dbo].[tblSafeAccessStatus] ADD  CONSTRAINT [DF_tblSafeAccessStatus_SARMSafeCustodian]  DEFAULT ((0)) FOR [SARMSafeCustodian]
GO
ALTER TABLE [dbo].[tblSafeAccessStatus] ADD  CONSTRAINT [DF_tblSafeAccessStatus_DOWSafeCustodian]  DEFAULT ((0)) FOR [DOWSafeCustodian]
GO
ALTER TABLE [dbo].[tblSafeAccessStatus] ADD  CONSTRAINT [DF_tblSafeAccessStatus_DOWSafeAccess]  DEFAULT ((0)) FOR [DOWSafeAccess]
GO
ALTER TABLE [dbo].[tblSafeAccessStatus] ADD  CONSTRAINT [DF_tblSafeAccessStatus_IntelSafeAccess]  DEFAULT ((0)) FOR [IntelSafeAccess]
GO
ALTER TABLE [dbo].[tblSafeAccessStatus] ADD  CONSTRAINT [DF_tblSafeAccessStatus_IntelSafeCustodian]  DEFAULT ((0)) FOR [IntelSafeCustodian]
GO
/****** Object:  StoredProcedure [dbo].[spBackSlashTest]    Script Date: 7/8/2021 9:21:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spBackSlashTest] 	
@jsonOutput NVARCHAR(MAX) OUTPUT
AS
BEGIN

SET @jsonOutput = (select sq.Name as 'FirstName'
FROM tblSquadronRoster sq
);

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

END
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployeeDetails]    Script Date: 7/8/2021 9:21:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[spGetEmployeeDetails]
	-- Add the parameters for the stored procedure here
	@MemID int	
AS
BEGIN
SELECT sq.SSN as 'SSN',sq.DOD_ID_Number as 'DODID',sq.Unit as 'Unit',sq.Attached as 'Attached',sq.PAFSC as 'PAFSC',sq.TouchedWhen as 'RecordLastUpdated',
sq.InprocessDate as 'InProcessDate',sq.InProcessedBy as 'InProcessedBy',sq.BirthDate as 'BirthDate',sq.BirthCity as 'BirthCity',
sq.BirthCountry as 'BirthCountry',sq.Citizenship as 'Citizenship', sq.EmailAddress as 'WorkEmail',sq.LastName + ', ' + sq.Name + ' '+ sq.MiddleName as 'FullName',
rk.Rank as 'Rank',
clr.Eligibility as 'Eligibility',
clr.InvestigationCloseDate as 'InvestigationCloseDate',
clr.EligibleDate as 'EligibleDate',
clr.CE_DefermentDate as 'CRDefermentDate',
clr.PR_RemarksID as 'PRRemarks',
clr.EQIPStatus as 'EQUIPStatus',
clr.DaysUntilTerminatioin as 'DaysLeft',
bdg.LineBadgeNumber as 'LineBadgeNumber',
bdg.Height as 'Height',
bdg.Weight as 'Weight',
hc.HairColor as 'HairColor',
ec.EyeColor as 'EyeColor',
ofc.OfficeName as 'OfficeName',
ofc.OfficePhone as 'DSN',
cp.CrewPositionType as 'CrewPosition',
cl.ClearanceLevel as 'ClearanceLevel',
cl.Inv_Type as 'InvestigationType',
cs.ClearenceStatusDescription as 'ClearanceStatus',
st.StateCode as 'BirthState'
FROM tblSquadronRoster sq
JOIN tblClearance clr on clr.MemberID = sq.MemberID
JOIN tblBadgeInfo bdg on bdg.MemID = sq.MemberID
JOIN tblLkup_Office ofc on ofc.OfficeID = sq.OfficeID
JOIN tblLkup_CrewPosition cp on cp.CrewID = sq.CrewID
JOIN tblLkup_ClearanceLevel cl on cl.ClearanceID = clr.ClearanceID
JOIN tblLkup_ClearenceStatus cs on cs.ClearenceID = clr.ClearanceID
JOIN tblLkup_States st on st.StateID = sq.BirthState
JOIN tblLkup_Rank rk on rk.RankID = sq.RankID
JOIN tblLkup_HairColor hc on hc.HairID = bdg.ColorHair
JOIN tblLkup_EyeColor ec on ec.EyeID = bdg.ColorEyes
WHERE sq.MemberID = @MemID
	SET NOCOUNT ON;

    -- Insert statements for procedure here
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSquadronRoster]    Script Date: 7/8/2021 9:21:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetSquadronRoster] 	
--@jsonOutput NVARCHAR(MAX) OUTPUT
AS
BEGIN
SELECT
sq.MemberID as 'UniqueKey',
sq.LastName + ', ' + sq.Name + ' '+ sq.MiddleName as 'FullName',
r.Rank as 'Rank',
clev.ClearanceLevel as 'Clearance',
i.InvestigationType as 'InvestType',
c.InvestigationCloseDate as 'InvestigationCloseDate'
FROM tblSquadronRoster sq
JOIN tblLkup_Rank r on r.RankID = sq.RankID
JOIN tblClearance c on c.MemberID = sq.MemberID
JOIN tblLkup_ClearanceLevel clev on clev.ClearanceID = c.ClearanceLevel
JOIN tblLkup_InvestigationType i on  c.InvestigationID = i.InvestigationID


	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

END
GO
USE [master]
GO
ALTER DATABASE [Dev_SPI] SET  READ_WRITE 
GO
