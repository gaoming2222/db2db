USE [master]
GO
/****** Object:  Database [SOURCEDB]    Script Date: 11/14/2018 17:34:53 ******/
CREATE DATABASE [SOURCEDB] ON  PRIMARY 
( NAME = N'YNQJRRDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\SOURCEDB.mdf' , SIZE = 7424KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'YNQJRRDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\SOURCEDB_1.ldf' , SIZE = 22144KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SOURCEDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SOURCEDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SOURCEDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [SOURCEDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [SOURCEDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [SOURCEDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [SOURCEDB] SET ARITHABORT OFF
GO
ALTER DATABASE [SOURCEDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [SOURCEDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [SOURCEDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [SOURCEDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [SOURCEDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [SOURCEDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [SOURCEDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [SOURCEDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [SOURCEDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [SOURCEDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [SOURCEDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [SOURCEDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [SOURCEDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [SOURCEDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [SOURCEDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [SOURCEDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [SOURCEDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [SOURCEDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [SOURCEDB] SET  READ_WRITE
GO
ALTER DATABASE [SOURCEDB] SET RECOVERY FULL
GO
ALTER DATABASE [SOURCEDB] SET  MULTI_USER
GO
ALTER DATABASE [SOURCEDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [SOURCEDB] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'SOURCEDB', N'ON'
GO
USE [SOURCEDB]
GO
/****** Object:  Table [dbo].[WarningInfo]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WarningInfo](
	[InfoID] [bigint] IDENTITY(1,1) NOT NULL,
	[StationID] [char](4) NULL,
	[DataTime] [datetime] NULL,
	[InfoDetail] [varchar](400) NULL,
	[ErroCode] [char](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[InfoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WaterToFlow]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WaterToFlow](
	[Stationid] [char](4) NOT NULL,
	[Water] [decimal](18, 2) NOT NULL,
	[Flow] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Administrator] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tswater]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tswater](
	[stationid] [char](4) NOT NULL,
	[datatime] [datetime] NOT NULL,
	[dataplus] [decimal](18, 2) NULL,
	[data] [decimal](18, 2) NULL,
	[rdatatime] [datetime] NOT NULL,
	[trantype] [char](2) NULL,
	[chktype] [char](1) NULL,
	[sourcetype] [char](1) NULL,
	[deviceid] [char](2) NULL,
	[WaterProof] [char](1) NULL,
	[Qmes] [char](1) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tsvoltage]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tsvoltage](
	[stationid] [char](4) NOT NULL,
	[datatime] [datetime] NOT NULL,
	[data] [decimal](18, 2) NULL,
	[rdatatime] [datetime] NOT NULL,
	[trantype] [char](2) NULL,
	[sourcetype] [char](1) NULL,
	[deviceid] [char](2) NULL,
	[Dataplus] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TsStatus]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TsStatus](
	[stationid] [char](4) NOT NULL,
	[number] [char](6) NULL,
	[datatime] [datetime] NOT NULL,
	[voltage] [decimal](18, 2) NULL,
	[rdatatime] [datetime] NOT NULL,
	[trantype] [char](2) NULL,
	[Sourcetype] [char](1) NULL,
	[Data] [decimal](18, 2) NULL,
	[Dataplus] [decimal](18, 2) NULL,
	[Status] [char](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCenter]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubCenter](
	[SubCenterID] [int] IDENTITY(1,1) NOT NULL,
	[SubCenterName] [varchar](50) NOT NULL,
	[Comment] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCenterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_ZQ_B]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_ZQ_B](
	[stationid] [char](4) NOT NULL,
	[BGTM] [datetime] NOT NULL,
	[PTNO] [int] NOT NULL,
	[ZR] [numeric](18, 2) NULL,
	[Q1] [numeric](18, 3) NULL,
	[Q2] [numeric](18, 3) NULL,
	[Q3] [numeric](18, 3) NULL,
	[Q4] [numeric](18, 3) NULL,
	[Q5] [numeric](18, 3) NULL,
	[Q6] [numeric](18, 3) NULL,
	[currQ] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[stationid] ASC,
	[BGTM] ASC,
	[PTNO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[EL_Procedure] [char](20) NULL,
	[EL_OperateTime] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CurrentSanility]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CurrentSanility](
	[CName] [nvarchar](50) NOT NULL,
	[StationID] [nvarchar](8) NOT NULL,
	[CType] [varchar](50) NULL,
	[DataTime] [datetime] NOT NULL,
	[Sanility] [numeric](18, 3) NULL,
	[Temp] [numeric](18, 3) NULL,
	[Conductivity] [numeric](18, 3) NULL,
	[CurrentState] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[StationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SerialPort]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SerialPort](
	[PortNumber] [int] NOT NULL,
	[TransType] [char](2) NULL,
	[Baudrate] [int] NULL,
	[Databit] [int] NULL,
	[Stopbit] [int] NULL,
	[Parity] [char](1) NULL,
	[Stream] [int] NULL,
	[Break] [bit] NULL,
	[Open] [bit] NULL,
	[dataprotocol] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[PortNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sanility]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanility](
	[stationid] [nvarchar](8) NOT NULL,
	[datatime] [datetime] NOT NULL,
	[temperature] [numeric](18, 3) NULL,
	[conductivity] [numeric](18, 3) NULL,
	[sanility] [numeric](18, 3) NULL,
	[recvdatatime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[stationid] ASC,
	[datatime] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ID_CD]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ID_CD](
	[StationId] [nvarchar](8) NOT NULL,
	[STCD] [char](8) NULL,
	[ltime] [datetime] NULL,
 CONSTRAINT [PK_ID_CD] PRIMARY KEY CLUSTERED 
(
	[StationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'站号_站码对应表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ID_CD'
GO
/****** Object:  Table [dbo].[hydlstation]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[hydlstation](
	[StationID] [nvarchar](8) NOT NULL,
	[SubCenterID] [int] NOT NULL,
	[CName] [varchar](50) NULL,
	[CType] [char](2) NULL,
	[WBase] [numeric](18, 2) NULL,
	[WMax] [numeric](18, 2) NULL,
	[WMin] [numeric](18, 2) NULL,
	[WChange] [numeric](18, 2) NULL,
	[RAccuracy] [numeric](2, 1) NULL,
	[RChange] [numeric](18, 1) NULL,
	[Gsm] [varchar](20) NULL,
	[Gprs] [varchar](11) NULL,
	[BDSatellite] [varchar](8) NULL,
	[BDmember] [varchar](3) NULL,
	[VoltageMin] [numeric](18, 2) NULL,
	[maintran] [varchar](20) NULL,
	[subtran] [varchar](20) NULL,
	[dataprotocol] [varchar](20) NULL,
	[watersensor] [char](2) NULL,
	[rainsensor] [char](2) NULL,
	[reportinterval] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[StationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[soilstation]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[soilstation](
	[stationid] [char](4) NOT NULL,
	[subcenterid] [int] NOT NULL,
	[cname] [varchar](50) NULL,
	[ctype] [char](2) NULL,
	[A10] [numeric](18, 4) NULL,
	[B10] [numeric](18, 4) NULL,
	[C10] [numeric](18, 4) NULL,
	[D10] [numeric](18, 4) NULL,
	[M10] [numeric](18, 4) NULL,
	[N10] [numeric](18, 4) NULL,
	[A20] [numeric](18, 4) NULL,
	[B20] [numeric](18, 4) NULL,
	[C20] [numeric](18, 4) NULL,
	[D20] [numeric](18, 4) NULL,
	[M20] [numeric](18, 4) NULL,
	[N20] [numeric](18, 4) NULL,
	[A30] [numeric](18, 4) NULL,
	[B30] [numeric](18, 4) NULL,
	[C30] [numeric](18, 4) NULL,
	[D30] [numeric](18, 4) NULL,
	[M30] [numeric](18, 4) NULL,
	[N30] [numeric](18, 4) NULL,
	[A40] [numeric](18, 4) NULL,
	[B40] [numeric](18, 4) NULL,
	[C40] [numeric](18, 4) NULL,
	[D40] [numeric](18, 4) NULL,
	[M40] [numeric](18, 4) NULL,
	[N40] [numeric](18, 4) NULL,
	[A60] [numeric](18, 4) NULL,
	[B60] [numeric](18, 4) NULL,
	[C60] [numeric](18, 4) NULL,
	[D60] [numeric](18, 4) NULL,
	[M60] [numeric](18, 4) NULL,
	[N60] [numeric](18, 4) NULL,
	[voltagemin] [numeric](18, 2) NULL,
	[gsm] [varchar](20) NULL,
	[gprs] [varchar](11) NULL,
	[bdsatellite] [varchar](8) NULL,
	[bdmember] [varchar](3) NULL,
	[maintran] [varchar](20) NULL,
	[subtran] [varchar](20) NULL,
	[dataprotocol] [varchar](20) NULL,
	[reportinterval] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[stationid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[water]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[water](
	[stationid] [nvarchar](8) NOT NULL,
	[datatime] [datetime] NOT NULL,
	[waterstage] [numeric](18, 2) NULL,
	[waterflow] [numeric](18, 3) NULL,
	[transtype] [char](2) NULL,
	[messagetype] [char](1) NULL,
	[recvdatatime] [datetime] NULL,
	[state] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[stationid] ASC,
	[datatime] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[voltage]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[voltage](
	[stationid] [nvarchar](8) NOT NULL,
	[datatime] [datetime] NOT NULL,
	[data] [numeric](18, 2) NULL,
	[transtype] [char](2) NULL,
	[messagetype] [char](1) NULL,
	[recvdatatime] [datetime] NULL,
	[state] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[stationid] ASC,
	[datatime] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[soildata]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[soildata](
	[StationID] [char](4) NOT NULL,
	[DataTime] [datetime] NOT NULL,
	[Voltage] [numeric](18, 2) NULL,
	[Voltage10] [numeric](18, 2) NULL,
	[Moisture10] [numeric](18, 2) NULL,
	[Voltage20] [numeric](18, 2) NULL,
	[Moisture20] [numeric](18, 2) NULL,
	[Voltage30] [numeric](18, 2) NULL,
	[Moistrue30] [numeric](18, 2) NULL,
	[Voltage40] [numeric](18, 2) NULL,
	[Moistrue40] [numeric](18, 2) NULL,
	[Voltage60] [numeric](18, 2) NULL,
	[Moistrue60] [numeric](18, 2) NULL,
	[TransType] [char](2) NULL,
	[MessageType] [char](1) NULL,
	[recvdatatime] [datetime] NULL,
	[state] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StationID] ASC,
	[DataTime] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rain]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rain](
	[stationid] [nvarchar](8) NOT NULL,
	[datatime] [datetime] NOT NULL,
	[periodrain] [numeric](18, 1) NULL,
	[differencerain] [numeric](18, 1) NULL,
	[totalrain] [numeric](18, 1) NULL,
	[dayrain] [numeric](18, 1) NULL,
	[transtype] [char](2) NULL,
	[messagetype] [char](1) NULL,
	[recvdatatime] [datetime] NULL,
	[state] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[stationid] ASC,
	[datatime] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CurrentData]    Script Date: 11/14/2018 17:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CurrentData](
	[CName] [nvarchar](50) NOT NULL,
	[StationID] [nvarchar](8) NOT NULL,
	[CType] [varchar](50) NULL,
	[YesterdayRain] [numeric](18, 1) NULL,
	[TodayRain] [numeric](18, 1) NULL,
	[PeriodRain] [numeric](18, 1) NULL,
	[WaterStage] [numeric](18, 2) NULL,
	[WaterFlow] [numeric](18, 3) NULL,
	[Voltage] [numeric](18, 2) NULL,
	[CurrentState] [varchar](50) NULL,
	[ReportType] [varchar](50) NULL,
	[GPRSType] [varchar](50) NULL,
	[DataTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK__hydlstati__SubCe__36B12243]    Script Date: 11/14/2018 17:34:54 ******/
ALTER TABLE [dbo].[hydlstation]  WITH NOCHECK ADD FOREIGN KEY([SubCenterID])
REFERENCES [dbo].[SubCenter] ([SubCenterID])
GO
/****** Object:  ForeignKey [FK__soilstati__subce__3B75D760]    Script Date: 11/14/2018 17:34:54 ******/
ALTER TABLE [dbo].[soilstation]  WITH CHECK ADD FOREIGN KEY([subcenterid])
REFERENCES [dbo].[SubCenter] ([SubCenterID])
GO
/****** Object:  ForeignKey [FK__water__stationid__534D60F1]    Script Date: 11/14/2018 17:34:54 ******/
ALTER TABLE [dbo].[water]  WITH CHECK ADD  CONSTRAINT [FK__water__stationid__534D60F1] FOREIGN KEY([stationid])
REFERENCES [dbo].[hydlstation] ([StationID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[water] CHECK CONSTRAINT [FK__water__stationid__534D60F1]
GO
/****** Object:  ForeignKey [FK__voltage__station__4E88ABD4]    Script Date: 11/14/2018 17:34:54 ******/
ALTER TABLE [dbo].[voltage]  WITH NOCHECK ADD  CONSTRAINT [FK__voltage__station__4E88ABD4] FOREIGN KEY([stationid])
REFERENCES [dbo].[hydlstation] ([StationID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[voltage] CHECK CONSTRAINT [FK__voltage__station__4E88ABD4]
GO
/****** Object:  ForeignKey [FK__soildata__Statio__5812160E]    Script Date: 11/14/2018 17:34:54 ******/
ALTER TABLE [dbo].[soildata]  WITH CHECK ADD FOREIGN KEY([StationID])
REFERENCES [dbo].[soilstation] ([stationid])
GO
/****** Object:  ForeignKey [FK__rain__stationid__619B8048]    Script Date: 11/14/2018 17:34:54 ******/
ALTER TABLE [dbo].[rain]  WITH NOCHECK ADD  CONSTRAINT [FK__rain__stationid__619B8048] FOREIGN KEY([stationid])
REFERENCES [dbo].[hydlstation] ([StationID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[rain] CHECK CONSTRAINT [FK__rain__stationid__619B8048]
GO
/****** Object:  ForeignKey [FK__CurrentDa__Stati__5CD6CB2B]    Script Date: 11/14/2018 17:34:54 ******/
ALTER TABLE [dbo].[CurrentData]  WITH NOCHECK ADD FOREIGN KEY([StationID])
REFERENCES [dbo].[hydlstation] ([StationID])
GO
