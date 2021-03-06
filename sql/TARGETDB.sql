USE [master]
GO
/****** Object:  Database [TARGETDB]    Script Date: 11/14/2018 17:35:34 ******/
CREATE DATABASE [TARGETDB] ON  PRIMARY 
( NAME = N'cjsw_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TARGETDB.mdf' , SIZE = 619840KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'cjsw_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TARGETDB_1.LDF' , SIZE = 5184KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [TARGETDB] SET COMPATIBILITY_LEVEL = 80
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TARGETDB].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [TARGETDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TARGETDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TARGETDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TARGETDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TARGETDB] SET ARITHABORT OFF
GO
ALTER DATABASE [TARGETDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TARGETDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TARGETDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TARGETDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TARGETDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TARGETDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TARGETDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TARGETDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TARGETDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TARGETDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TARGETDB] SET  ENABLE_BROKER
GO
ALTER DATABASE [TARGETDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TARGETDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TARGETDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TARGETDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TARGETDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TARGETDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TARGETDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TARGETDB] SET  READ_WRITE
GO
ALTER DATABASE [TARGETDB] SET RECOVERY FULL
GO
ALTER DATABASE [TARGETDB] SET  MULTI_USER
GO
ALTER DATABASE [TARGETDB] SET PAGE_VERIFY NONE
GO
ALTER DATABASE [TARGETDB] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'TARGETDB', N'ON'
GO
USE [TARGETDB]
GO
/****** Object:  User [yxd]    Script Date: 11/14/2018 17:35:34 ******/
CREATE USER [yxd] WITH DEFAULT_SCHEMA=[yxd]
GO
/****** Object:  User [swkys]    Script Date: 11/14/2018 17:35:34 ******/
CREATE USER [swkys] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[swkys]
GO
/****** Object:  User [Domain Admins]    Script Date: 11/14/2018 17:35:34 ******/
CREATE USER [Domain Admins]
GO
/****** Object:  User [cw]    Script Date: 11/14/2018 17:35:34 ******/
CREATE USER [cw] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[cw]
GO
/****** Object:  Schema [yxd]    Script Date: 11/14/2018 17:35:34 ******/
CREATE SCHEMA [yxd] AUTHORIZATION [yxd]
GO
/****** Object:  Schema [swkys]    Script Date: 11/14/2018 17:35:34 ******/
CREATE SCHEMA [swkys] AUTHORIZATION [swkys]
GO
/****** Object:  Schema [Domain Admins]    Script Date: 11/14/2018 17:35:34 ******/
CREATE SCHEMA [Domain Admins] AUTHORIZATION [Domain Admins]
GO
/****** Object:  Schema [cw]    Script Date: 11/14/2018 17:35:34 ******/
CREATE SCHEMA [cw] AUTHORIZATION [cw]
GO
/****** Object:  Table [dbo].[ROUTINES]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROUTINES](
	[SPECIFIC_CATALOG] [nvarchar](128) NULL,
	[SPECIFIC_SCHEMA] [nvarchar](128) NULL,
	[SPECIFIC_NAME] [nvarchar](128) NOT NULL,
	[ROUTINE_CATALOG] [nvarchar](128) NULL,
	[ROUTINE_SCHEMA] [nvarchar](128) NULL,
	[ROUTINE_NAME] [nvarchar](128) NOT NULL,
	[ROUTINE_TYPE] [nvarchar](20) NULL,
	[MODULE_CATALOG] [nvarchar](128) NULL,
	[MODULE_SCHEMA] [nvarchar](128) NULL,
	[MODULE_NAME] [nvarchar](128) NULL,
	[UDT_CATALOG] [nvarchar](128) NULL,
	[UDT_SCHEMA] [nvarchar](128) NULL,
	[UDT_NAME] [nvarchar](128) NULL,
	[DATA_TYPE] [nvarchar](128) NULL,
	[CHARACTER_MAXIMUM_LENGTH] [int] NULL,
	[CHARACTER_OCTET_LENGTH] [int] NULL,
	[COLLATION_CATALOG] [nvarchar](128) NULL,
	[COLLATION_SCHEMA] [nvarchar](128) NULL,
	[COLLATION_NAME] [nvarchar](128) NULL,
	[CHARACTER_SET_CATALOG] [nvarchar](128) NULL,
	[CHARACTER_SET_SCHEMA] [nvarchar](128) NULL,
	[CHARACTER_SET_NAME] [nvarchar](128) NULL,
	[NUMERIC_PRECISION] [tinyint] NULL,
	[NUMERIC_PRECISION_RADIX] [smallint] NULL,
	[NUMERIC_SCALE] [int] NULL,
	[DATETIME_PRECISION] [smallint] NULL,
	[INTERVAL_TYPE] [nvarchar](30) NULL,
	[INTERVAL_PRECISION] [smallint] NULL,
	[TYPE_UDT_CATALOG] [nvarchar](128) NULL,
	[TYPE_UDT_SCHEMA] [nvarchar](128) NULL,
	[TYPE_UDT_NAME] [nvarchar](128) NULL,
	[SCOPE_CATALOG] [nvarchar](128) NULL,
	[SCOPE_SCHEMA] [nvarchar](128) NULL,
	[SCOPE_NAME] [nvarchar](128) NULL,
	[MAXIMUM_CARDINALITY] [bigint] NULL,
	[DTD_IDENTIFIER] [nvarchar](128) NULL,
	[ROUTINE_BODY] [nvarchar](30) NULL,
	[ROUTINE_DEFINITION] [nvarchar](4000) NULL,
	[EXTERNAL_NAME] [nvarchar](128) NULL,
	[EXTERNAL_LANGUAGE] [nvarchar](30) NULL,
	[PARAMETER_STYLE] [nvarchar](30) NULL,
	[IS_DETERMINISTIC] [nvarchar](10) NULL,
	[SQL_DATA_ACCESS] [nvarchar](30) NULL,
	[IS_NULL_CALL] [nvarchar](10) NULL,
	[SQL_PATH] [nvarchar](128) NULL,
	[SCHEMA_LEVEL_ROUTINE] [nvarchar](10) NULL,
	[MAX_DYNAMIC_RESULT_SETS] [smallint] NULL,
	[IS_USER_DEFINED_CAST] [nvarchar](10) NULL,
	[IS_IMPLICITLY_INVOCABLE] [nvarchar](10) NULL,
	[CREATED] [datetime] NOT NULL,
	[LAST_ALTERED] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROUTINE_COLUMNS]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ROUTINE_COLUMNS](
	[TABLE_CATALOG] [nvarchar](128) NULL,
	[TABLE_SCHEMA] [nvarchar](128) NULL,
	[TABLE_NAME] [nvarchar](128) NOT NULL,
	[COLUMN_NAME] [nvarchar](128) NOT NULL,
	[ORDINAL_POSITION] [smallint] NOT NULL,
	[COLUMN_DEFAULT] [nvarchar](4000) NULL,
	[IS_NULLABLE] [varchar](3) NULL,
	[DATA_TYPE] [nvarchar](128) NULL,
	[CHARACTER_MAXIMUM_LENGTH] [int] NULL,
	[CHARACTER_OCTET_LENGTH] [int] NULL,
	[NUMERIC_PRECISION] [tinyint] NOT NULL,
	[NUMERIC_PRECISION_RADIX] [smallint] NULL,
	[NUMERIC_SCALE] [int] NULL,
	[DATETIME_PRECISION] [smallint] NULL,
	[CHARACTER_SET_CATALOG] [nvarchar](128) NULL,
	[CHARACTER_SET_SCHEMA] [nvarchar](128) NULL,
	[CHARACTER_SET_NAME] [nvarchar](128) NULL,
	[COLLATION_CATALOG] [nvarchar](128) NULL,
	[COLLATION_SCHEMA] [nvarchar](128) NULL,
	[COLLATION_NAME] [nvarchar](128) NULL,
	[DOMAIN_CATALOG] [nvarchar](128) NULL,
	[DOMAIN_SCHEMA] [nvarchar](128) NULL,
	[DOMAIN_NAME] [nvarchar](128) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[roles]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roles](
	[roleid] [decimal](11, 0) NOT NULL,
	[rolename] [varchar](30) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [cw].[RNFL_R]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[RNFL_R](
	[STCD] [char](8) NOT NULL,
	[YMDHM] [datetime] NOT NULL,
	[RNTM] [numeric](4, 1) NULL,
	[DTRN] [numeric](5, 1) NULL,
 CONSTRAINT [PK_RNFL_R] PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[YMDHM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'雨量计固存数据' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'RNFL_R', @level2type=N'COLUMN',@level2name=N'STCD'
GO
/****** Object:  Table [cw].[RIVER_R]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[RIVER_R](
	[STCD] [char](8) NOT NULL,
	[YMDHM] [datetime] NOT NULL,
	[Z] [numeric](7, 3) NULL,
	[Q] [numeric](9, 3) NULL,
	[CS] [numeric](9, 3) NULL,
	[QMES] [char](1) NULL,
 CONSTRAINT [PK_RIVER_R] PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[YMDHM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'水位计固存数据' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'RIVER_R', @level2type=N'COLUMN',@level2name=N'STCD'
GO
/****** Object:  Table [dbo].[REFERENTIAL_CONSTRAINTS]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REFERENTIAL_CONSTRAINTS](
	[CONSTRAINT_CATALOG] [nvarchar](128) NULL,
	[CONSTRAINT_SCHEMA] [nvarchar](128) NULL,
	[CONSTRAINT_NAME] [nvarchar](128) NOT NULL,
	[UNIQUE_CONSTRAINT_CATALOG] [nvarchar](128) NULL,
	[UNIQUE_CONSTRAINT_SCHEMA] [nvarchar](128) NULL,
	[UNIQUE_CONSTRAINT_NAME] [nvarchar](128) NOT NULL,
	[MATCH_OPTION] [varchar](4) NOT NULL,
	[UPDATE_RULE] [varchar](9) NOT NULL,
	[DELETE_RULE] [varchar](9) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [cw].[RAIN_R]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[RAIN_R](
	[STCD] [char](8) NOT NULL,
	[YMDHM] [datetime] NOT NULL,
	[DATAPLUS] [numeric](5, 1) NULL,
	[DATA] [numeric](5, 1) NULL,
	[RTIME] [datetime] NULL,
	[WEATHER] [char](1) NULL,
	[TRANTYPE] [char](1) NULL,
	[SOURCETYPE] [char](1) NULL,
	[DEVICEID] [char](10) NULL,
 CONSTRAINT [PK_RAIN_R] PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[YMDHM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实测雨量表' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'RAIN_R', @level2type=N'COLUMN',@level2name=N'STCD'
GO
/****** Object:  Table [cw].[RAIN_ORGNIZE]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[RAIN_ORGNIZE](
	[STCD] [char](8) NOT NULL,
	[YMHDM] [datetime] NOT NULL,
	[DATAPLUS] [numeric](5, 1) NULL,
	[DATA] [numeric](5, 1) NULL,
	[RTIME] [datetime] NULL,
	[WEATHER] [char](1) NULL,
	[TRANTYPE] [char](1) NULL,
	[SOURCETYPE] [char](1) NULL,
	[DEVICEID] [char](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [cw].[q_para]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[q_para](
	[id] [char](3) NOT NULL,
	[stcd] [char](8) NULL,
	[s_datetime] [datetime] NULL,
	[e_datetime] [datetime] NULL,
	[ls] [char](8) NULL,
	[la] [numeric](6, 1) NULL,
	[lb] [numeric](6, 2) NULL,
	[ala] [numeric](6, 1) NULL,
	[alb] [numeric](6, 2) NULL,
	[rs] [char](8) NULL,
	[ra] [numeric](6, 1) NULL,
	[rb] [numeric](6, 2) NULL,
	[ara] [numeric](6, 1) NULL,
	[arb] [numeric](6, 2) NULL,
	[mv2s] [char](8) NULL,
	[mv3s] [char](8) NULL,
	[mv4s] [char](8) NULL,
	[mv5s] [char](8) NULL,
	[m4a] [numeric](6, 1) NULL,
	[m4b] [numeric](6, 2) NULL,
	[am4a] [numeric](6, 1) NULL,
	[am4b] [numeric](6, 2) NULL,
	[m4k1] [numeric](5, 4) NULL,
	[m4k2] [numeric](5, 4) NULL,
	[m4k3] [numeric](5, 4) NULL,
	[m4k4] [numeric](5, 4) NULL,
	[m3pa] [numeric](6, 1) NULL,
	[m3pb] [numeric](6, 2) NULL,
	[am3pa] [numeric](6, 1) NULL,
	[am3pb] [numeric](6, 2) NULL,
	[m3pk1] [numeric](5, 4) NULL,
	[m3pk2] [numeric](5, 4) NULL,
	[m3pk3] [numeric](5, 4) NULL,
	[m3sa] [numeric](6, 1) NULL,
	[m3sb] [numeric](6, 2) NULL,
	[am3sa] [numeric](6, 1) NULL,
	[am3sb] [numeric](6, 2) NULL,
	[m3sk1] [numeric](5, 4) NULL,
	[m3sk2] [numeric](5, 4) NULL,
	[m3sk3] [numeric](5, 4) NULL,
	[m2pa] [numeric](6, 1) NULL,
	[m2pb] [numeric](6, 2) NULL,
	[am2pa] [numeric](6, 1) NULL,
	[am2pb] [numeric](6, 2) NULL,
	[m2pk1] [numeric](5, 4) NULL,
	[m2pk2] [numeric](5, 4) NULL,
	[m2sa] [numeric](6, 1) NULL,
	[m2sb] [numeric](6, 2) NULL,
	[am2sa] [numeric](6, 1) NULL,
	[am2sb] [numeric](6, 2) NULL,
	[m2sk1] [numeric](5, 4) NULL,
	[m2sk2] [numeric](5, 4) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [cw].[person]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[person](
	[person_id] [char](10) NOT NULL,
	[person_name] [char](8) NULL,
	[age] [char](3) NULL,
	[sex] [char](1) NULL,
	[belong_zd] [char](8) NULL,
 CONSTRAINT [person_id] PRIMARY KEY CLUSTERED 
(
	[person_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pbcatvld]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pbcatvld](
	[pbv_name] [varchar](30) NOT NULL,
	[pbv_vald] [varchar](254) NULL,
	[pbv_type] [smallint] NULL,
	[pbv_cntr] [int] NULL,
	[pbv_msg] [varchar](254) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [pbcatv_x] ON [dbo].[pbcatvld] 
(
	[pbv_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pbcattbl]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pbcattbl](
	[pbt_tnam] [char](129) NOT NULL,
	[pbt_tid] [int] NULL,
	[pbt_ownr] [char](129) NOT NULL,
	[pbd_fhgt] [smallint] NULL,
	[pbd_fwgt] [smallint] NULL,
	[pbd_fitl] [char](1) NULL,
	[pbd_funl] [char](1) NULL,
	[pbd_fchr] [smallint] NULL,
	[pbd_fptc] [smallint] NULL,
	[pbd_ffce] [char](18) NULL,
	[pbh_fhgt] [smallint] NULL,
	[pbh_fwgt] [smallint] NULL,
	[pbh_fitl] [char](1) NULL,
	[pbh_funl] [char](1) NULL,
	[pbh_fchr] [smallint] NULL,
	[pbh_fptc] [smallint] NULL,
	[pbh_ffce] [char](18) NULL,
	[pbl_fhgt] [smallint] NULL,
	[pbl_fwgt] [smallint] NULL,
	[pbl_fitl] [char](1) NULL,
	[pbl_funl] [char](1) NULL,
	[pbl_fchr] [smallint] NULL,
	[pbl_fptc] [smallint] NULL,
	[pbl_ffce] [char](18) NULL,
	[pbt_cmnt] [varchar](254) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [pbcatt_x] ON [dbo].[pbcattbl] 
(
	[pbt_tnam] ASC,
	[pbt_ownr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pbcatfmt]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pbcatfmt](
	[pbf_name] [varchar](30) NOT NULL,
	[pbf_frmt] [varchar](254) NULL,
	[pbf_type] [smallint] NULL,
	[pbf_cntr] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [pbcatf_x] ON [dbo].[pbcatfmt] 
(
	[pbf_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pbcatedt]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pbcatedt](
	[pbe_name] [varchar](30) NOT NULL,
	[pbe_edit] [varchar](254) NULL,
	[pbe_type] [smallint] NULL,
	[pbe_cntr] [int] NULL,
	[pbe_seqn] [smallint] NOT NULL,
	[pbe_flag] [int] NULL,
	[pbe_work] [char](32) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [pbcate_x] ON [dbo].[pbcatedt] 
(
	[pbe_name] ASC,
	[pbe_seqn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pbcatcol]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pbcatcol](
	[pbc_tnam] [char](129) NOT NULL,
	[pbc_tid] [int] NULL,
	[pbc_ownr] [char](129) NOT NULL,
	[pbc_cnam] [char](129) NOT NULL,
	[pbc_cid] [smallint] NULL,
	[pbc_labl] [varchar](254) NULL,
	[pbc_lpos] [smallint] NULL,
	[pbc_hdr] [varchar](254) NULL,
	[pbc_hpos] [smallint] NULL,
	[pbc_jtfy] [smallint] NULL,
	[pbc_mask] [varchar](31) NULL,
	[pbc_case] [smallint] NULL,
	[pbc_hght] [smallint] NULL,
	[pbc_wdth] [smallint] NULL,
	[pbc_ptrn] [varchar](31) NULL,
	[pbc_bmap] [char](1) NULL,
	[pbc_init] [varchar](254) NULL,
	[pbc_cmnt] [varchar](254) NULL,
	[pbc_edit] [varchar](31) NULL,
	[pbc_tag] [varchar](254) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [pbcatc_x] ON [dbo].[pbcatcol] 
(
	[pbc_tnam] ASC,
	[pbc_ownr] ASC,
	[pbc_cnam] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PARAMETERS]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PARAMETERS](
	[SPECIFIC_CATALOG] [nvarchar](128) NULL,
	[SPECIFIC_SCHEMA] [nvarchar](128) NULL,
	[SPECIFIC_NAME] [nvarchar](128) NOT NULL,
	[ORDINAL_POSITION] [smallint] NOT NULL,
	[PARAMETER_MODE] [nvarchar](10) NULL,
	[IS_RESULT] [nvarchar](10) NULL,
	[AS_LOCATOR] [nvarchar](10) NULL,
	[PARAMETER_NAME] [nvarchar](128) NOT NULL,
	[DATA_TYPE] [nvarchar](128) NULL,
	[CHARACTER_MAXIMUM_LENGTH] [int] NULL,
	[CHARACTER_OCTET_LENGTH] [int] NULL,
	[COLLATION_CATALOG] [nvarchar](128) NULL,
	[COLLATION_SCHEMA] [nvarchar](128) NULL,
	[COLLATION_NAME] [nvarchar](128) NULL,
	[CHARACTER_SET_CATALOG] [nvarchar](128) NULL,
	[CHARACTER_SET_SCHEMA] [nvarchar](128) NULL,
	[CHARACTER_SET_NAME] [nvarchar](128) NULL,
	[NUMERIC_PRECISION] [tinyint] NOT NULL,
	[NUMERIC_PRECISION_RADIX] [smallint] NULL,
	[NUMERIC_SCALE] [int] NULL,
	[DATETIME_PRECISION] [smallint] NULL,
	[INTERVAL_TYPE] [nvarchar](30) NULL,
	[INTERVAL_PRECISION] [smallint] NULL,
	[USER_DEFINED_TYPE_CATALOG] [nvarchar](128) NULL,
	[USER_DEFINED_TYPE_SCHEMA] [nvarchar](128) NULL,
	[USER_DEFINED_TYPE_NAME] [nvarchar](128) NULL,
	[SCOPE_CATALOG] [nvarchar](128) NULL,
	[SCOPE_SCHEMA] [nvarchar](128) NULL,
	[SCOPE_NAME] [nvarchar](128) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MSreplication_options]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MSreplication_options](
	[optname] [nvarchar](128) NOT NULL,
	[value] [bit] NOT NULL,
	[major_version] [int] NOT NULL,
	[minor_version] [int] NOT NULL,
	[revision] [int] NOT NULL,
	[install_failures] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [cw].[monitor_timer]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[monitor_timer](
	[stcd] [char](8) NOT NULL,
	[timer] [char](6) NULL,
 CONSTRAINT [stcd_timer] PRIMARY KEY CLUSTERED 
(
	[stcd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'监控界面自动刷新时间表' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'monitor_timer', @level2type=N'COLUMN',@level2name=N'stcd'
GO
/****** Object:  Table [cw].[LOG_R]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[LOG_R](
	[ID] [numeric](9, 0) NOT NULL,
	[DT] [datetime] NULL,
	[IP] [char](15) NULL,
	[USERNAME] [char](20) NULL,
 CONSTRAINT [PK_LOG_R] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户登录日志表' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'LOG_R', @level2type=N'COLUMN',@level2name=N'ID'
GO
/****** Object:  Table [dbo].[KEY_COLUMN_USAGE]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KEY_COLUMN_USAGE](
	[CONSTRAINT_CATALOG] [nvarchar](128) NULL,
	[CONSTRAINT_SCHEMA] [nvarchar](128) NULL,
	[CONSTRAINT_NAME] [nvarchar](128) NOT NULL,
	[TABLE_CATALOG] [nvarchar](128) NULL,
	[TABLE_SCHEMA] [nvarchar](128) NULL,
	[TABLE_NAME] [nvarchar](128) NOT NULL,
	[COLUMN_NAME] [nvarchar](128) NOT NULL,
	[ORDINAL_POSITION] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [cw].[HLTDZ]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[HLTDZ](
	[STCD] [char](8) NOT NULL,
	[YR] [numeric](4, 0) NOT NULL,
	[MD] [numeric](4, 0) NOT NULL,
	[TDOCT] [numeric](4, 0) NULL,
	[TDZ] [numeric](4, 2) NULL,
	[TDRM] [char](5) NULL,
	[YMDHM] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [cw].[FV_R]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[FV_R](
	[STCD] [char](8) NOT NULL,
	[YMDHM] [datetime] NOT NULL,
	[DEPTH] [numeric](5, 2) NULL,
	[AV] [numeric](5, 2) NULL,
	[AD] [numeric](3, 0) NULL,
	[V00] [numeric](5, 2) NULL,
	[V02] [numeric](5, 2) NULL,
	[V04] [numeric](5, 2) NULL,
	[V06] [numeric](5, 2) NULL,
	[V08] [numeric](5, 2) NULL,
	[V10] [numeric](5, 2) NULL,
	[D00] [numeric](3, 0) NULL,
	[D02] [numeric](3, 0) NULL,
	[D04] [numeric](3, 0) NULL,
	[D06] [numeric](3, 0) NULL,
	[D08] [numeric](3, 0) NULL,
	[D10] [numeric](3, 0) NULL,
	[Q] [numeric](9, 3) NULL,
 CONSTRAINT [PK_FV_R] PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[YMDHM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'垂线流速表' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'FV_R', @level2type=N'COLUMN',@level2name=N'STCD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'垂线平均速度' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'FV_R', @level2type=N'COLUMN',@level2name=N'AV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'垂线平均流向' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'FV_R', @level2type=N'COLUMN',@level2name=N'AD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'水面流速' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'FV_R', @level2type=N'COLUMN',@level2name=N'V00'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0.2H流速' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'FV_R', @level2type=N'COLUMN',@level2name=N'V02'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'水底流速' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'FV_R', @level2type=N'COLUMN',@level2name=N'V10'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'水面流向' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'FV_R', @level2type=N'COLUMN',@level2name=N'D00'
GO
/****** Object:  Table [cw].[FV_ORGNIZE]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[FV_ORGNIZE](
	[STCD] [char](8) NOT NULL,
	[YMDHM] [datetime] NOT NULL,
	[DEPTH] [numeric](5, 2) NULL,
	[AV] [numeric](5, 2) NULL,
	[AD] [numeric](5, 2) NULL,
	[V00] [numeric](5, 2) NULL,
	[V02] [numeric](5, 2) NULL,
	[V04] [numeric](5, 2) NULL,
	[V06] [numeric](5, 2) NULL,
	[V08] [numeric](5, 2) NULL,
	[V10] [numeric](5, 2) NULL,
	[D00] [numeric](3, 0) NULL,
	[D02] [numeric](3, 0) NULL,
	[D04] [numeric](3, 0) NULL,
	[D06] [numeric](3, 0) NULL,
	[D08] [numeric](3, 0) NULL,
	[D10] [numeric](3, 0) NULL,
	[Q] [numeric](9, 3) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [cw].[fb_location]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[fb_location](
	[stcd] [char](8) NOT NULL,
	[gps_x] [numeric](11, 6) NULL,
	[gps_y] [numeric](10, 6) NULL,
	[normal_r] [numeric](8, 3) NULL,
	[alert_r] [numeric](8, 3) NULL,
	[fault_r] [numeric](8, 3) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[employees]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employees](
	[sno] [decimal](11, 0) NULL,
	[username] [varchar](15) NOT NULL,
	[password] [varchar](15) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[phone] [varchar](15) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[depid] [varchar](100) NOT NULL,
	[address] [varchar](100) NULL,
	[corp] [varchar](100) NULL,
	[roleid] [decimal](11, 0) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [cw].[DZ_R]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[DZ_R](
	[STCD] [char](8) NOT NULL,
	[YMD] [datetime] NOT NULL,
	[Z] [numeric](7, 3) NULL,
 CONSTRAINT [PK_DZ_R] PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[YMD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逐日水位表' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'DZ_R', @level2type=N'COLUMN',@level2name=N'STCD'
GO
/****** Object:  Table [cw].[DP_R]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[DP_R](
	[STCD] [char](8) NOT NULL,
	[YMD] [datetime] NOT NULL,
	[P] [numeric](4, 1) NULL,
 CONSTRAINT [PK_DP_R] PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[YMD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逐日降水量表' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'DP_R', @level2type=N'COLUMN',@level2name=N'STCD'
GO
/****** Object:  Table [dbo].[DOMAINS]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOMAINS](
	[DOMAIN_CATALOG] [nvarchar](128) NULL,
	[DOMAIN_SCHEMA] [nvarchar](128) NULL,
	[DOMAIN_NAME] [nvarchar](128) NOT NULL,
	[DATA_TYPE] [nvarchar](128) NULL,
	[CHARACTER_MAXIMUM_LENGTH] [int] NULL,
	[CHARACTER_OCTET_LENGTH] [int] NULL,
	[COLLATION_CATALOG] [nvarchar](128) NULL,
	[COLLATION_SCHEMA] [nvarchar](128) NULL,
	[COLLATION_NAME] [nvarchar](128) NULL,
	[CHARACTER_SET_CATALOG] [nvarchar](128) NULL,
	[CHARACTER_SET_SCHEMA] [nvarchar](128) NULL,
	[CHARACTER_SET_NAME] [nvarchar](128) NULL,
	[NUMERIC_PRECISION] [tinyint] NULL,
	[NUMERIC_PRECISION_RADIX] [smallint] NULL,
	[NUMERIC_SCALE] [int] NULL,
	[DATETIME_PRECISION] [smallint] NULL,
	[DOMAIN_DEFAULT] [nvarchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOMAIN_CONSTRAINTS]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DOMAIN_CONSTRAINTS](
	[CONSTRAINT_CATALOG] [nvarchar](128) NULL,
	[CONSTRAINT_SCHEMA] [nvarchar](128) NULL,
	[CONSTRAINT_NAME] [nvarchar](128) NOT NULL,
	[DOMAIN_CATALOG] [nvarchar](128) NULL,
	[DOMAIN_SCHEMA] [nvarchar](128) NULL,
	[DOMAIN_NAME] [nvarchar](128) NOT NULL,
	[IS_DEFERRABLE] [varchar](2) NOT NULL,
	[INITIALLY_DEFERRED] [varchar](2) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CONSTRAINT_TABLE_USAGE]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONSTRAINT_TABLE_USAGE](
	[TABLE_CATALOG] [nvarchar](128) NULL,
	[TABLE_SCHEMA] [nvarchar](128) NULL,
	[TABLE_NAME] [nvarchar](128) NOT NULL,
	[CONSTRAINT_CATALOG] [nvarchar](128) NULL,
	[CONSTRAINT_SCHEMA] [nvarchar](128) NULL,
	[CONSTRAINT_NAME] [nvarchar](128) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONSTRAINT_COLUMN_USAGE]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONSTRAINT_COLUMN_USAGE](
	[TABLE_CATALOG] [nvarchar](128) NULL,
	[TABLE_SCHEMA] [nvarchar](128) NULL,
	[TABLE_NAME] [nvarchar](128) NOT NULL,
	[COLUMN_NAME] [nvarchar](128) NOT NULL,
	[CONSTRAINT_CATALOG] [nvarchar](128) NULL,
	[CONSTRAINT_SCHEMA] [nvarchar](128) NULL,
	[CONSTRAINT_NAME] [nvarchar](128) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COLUMNS]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COLUMNS](
	[TABLE_CATALOG] [nvarchar](128) NULL,
	[TABLE_SCHEMA] [nvarchar](128) NULL,
	[TABLE_NAME] [nvarchar](128) NOT NULL,
	[COLUMN_NAME] [nvarchar](128) NOT NULL,
	[ORDINAL_POSITION] [smallint] NOT NULL,
	[COLUMN_DEFAULT] [nvarchar](4000) NULL,
	[IS_NULLABLE] [varchar](3) NOT NULL,
	[DATA_TYPE] [nvarchar](128) NULL,
	[CHARACTER_MAXIMUM_LENGTH] [int] NULL,
	[CHARACTER_OCTET_LENGTH] [int] NULL,
	[NUMERIC_PRECISION] [tinyint] NULL,
	[NUMERIC_PRECISION_RADIX] [smallint] NULL,
	[NUMERIC_SCALE] [int] NULL,
	[DATETIME_PRECISION] [smallint] NULL,
	[CHARACTER_SET_CATALOG] [nvarchar](128) NULL,
	[CHARACTER_SET_SCHEMA] [nvarchar](128) NULL,
	[CHARACTER_SET_NAME] [nvarchar](128) NULL,
	[COLLATION_CATALOG] [nvarchar](128) NULL,
	[COLLATION_SCHEMA] [nvarchar](128) NULL,
	[COLLATION_NAME] [nvarchar](128) NULL,
	[DOMAIN_CATALOG] [nvarchar](128) NULL,
	[DOMAIN_SCHEMA] [nvarchar](128) NULL,
	[DOMAIN_NAME] [nvarchar](128) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COLUMN_PRIVILEGES]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COLUMN_PRIVILEGES](
	[GRANTOR] [nvarchar](128) NULL,
	[GRANTEE] [nvarchar](128) NULL,
	[TABLE_CATALOG] [nvarchar](128) NULL,
	[TABLE_SCHEMA] [nvarchar](128) NULL,
	[TABLE_NAME] [nvarchar](128) NOT NULL,
	[COLUMN_NAME] [nvarchar](128) NOT NULL,
	[PRIVILEGE_TYPE] [varchar](10) NOT NULL,
	[IS_GRANTABLE] [varchar](3) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COLUMN_DOMAIN_USAGE]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COLUMN_DOMAIN_USAGE](
	[DOMAIN_CATALOG] [nvarchar](128) NULL,
	[DOMAIN_SCHEMA] [nvarchar](128) NULL,
	[DOMAIN_NAME] [nvarchar](128) NOT NULL,
	[TABLE_CATALOG] [nvarchar](128) NULL,
	[TABLE_SCHEMA] [nvarchar](128) NULL,
	[TABLE_NAME] [nvarchar](128) NOT NULL,
	[COLUMN_NAME] [nvarchar](128) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [cw].[CJK_TZD]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[CJK_TZD](
	[STCD] [char](8) NOT NULL,
	[YR] [numeric](4, 0) NOT NULL,
	[MD] [numeric](4, 0) NOT NULL,
	[LMD] [char](6) NULL,
	[WZ00] [numeric](4, 2) NULL,
	[WZ01] [numeric](4, 2) NULL,
	[WZ02] [numeric](4, 2) NULL,
	[WZ03] [numeric](4, 2) NULL,
	[WZ04] [numeric](4, 2) NULL,
	[WZ05] [numeric](4, 2) NULL,
	[WZ06] [numeric](4, 2) NULL,
	[WZ07] [numeric](4, 2) NULL,
	[WZ08] [numeric](4, 2) NULL,
	[WZ09] [numeric](4, 2) NULL,
	[WZ10] [numeric](4, 2) NULL,
	[WZ11] [numeric](4, 2) NULL,
	[WZ12] [numeric](4, 2) NULL,
	[WZ13] [numeric](4, 2) NULL,
	[WZ14] [numeric](4, 2) NULL,
	[WZ15] [numeric](4, 2) NULL,
	[WZ16] [numeric](4, 2) NULL,
	[WZ17] [numeric](4, 2) NULL,
	[WZ18] [numeric](4, 2) NULL,
	[WZ19] [numeric](4, 2) NULL,
	[WZ20] [numeric](4, 2) NULL,
	[WZ21] [numeric](4, 2) NULL,
	[WZ22] [numeric](4, 2) NULL,
	[WZ23] [numeric](4, 2) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHECK_CONSTRAINTS]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHECK_CONSTRAINTS](
	[CONSTRAINT_CATALOG] [nvarchar](128) NULL,
	[CONSTRAINT_SCHEMA] [nvarchar](128) NULL,
	[CONSTRAINT_NAME] [nvarchar](128) NOT NULL,
	[CHECK_CLAUSE] [nvarchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [cw].[adp_para]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[adp_para](
	[ID] [char](4) NOT NULL,
	[STCD] [char](8) NULL,
	[SELFHIGH] [numeric](4, 3) NULL,
	[ZERO] [numeric](7, 3) NULL,
	[BLANK] [numeric](4, 3) NULL,
	[CELLNUM] [numeric](3, 0) NULL,
	[ALO] [char](1) NULL,
	[STARTTIME] [datetime] NULL,
	[direction] [numeric](3, 0) NULL,
	[ADP_DIRE] [char](1) NULL,
	[WATER_RELA] [char](8) NULL,
	[CELL_HIGH] [numeric](5, 2) NULL,
	[PRE_K] [numeric](5, 1) NULL,
	[POST_K] [numeric](6, 1) NULL,
	[LAY_H] [numeric](7, 2) NULL,
 CONSTRAINT [PK_adp_para] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ADP自身高度' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'adp_para', @level2type=N'COLUMN',@level2name=N'SELFHIGH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'零点高程' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'adp_para', @level2type=N'COLUMN',@level2name=N'ZERO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下盲区' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'adp_para', @level2type=N'COLUMN',@level2name=N'BLANK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'cell单元数目，1-100' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'adp_para', @level2type=N'COLUMN',@level2name=N'CELLNUM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'算法选择' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'adp_para', @level2type=N'COLUMN',@level2name=N'ALO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参数有效开始时间' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'adp_para', @level2type=N'COLUMN',@level2name=N'STARTTIME'
GO
/****** Object:  Table [cw].[adp_data]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[adp_data](
	[stcd] [char](8) NOT NULL,
	[profile_time] [datetime] NOT NULL,
	[relative_hight] [numeric](5, 2) NOT NULL,
	[velocity] [numeric](5, 2) NULL,
	[direction] [numeric](3, 0) NULL,
	[a_ss] [numeric](5, 2) NULL,
 CONSTRAINT [PK_adp_data] PRIMARY KEY CLUSTERED 
(
	[stcd] ASC,
	[profile_time] ASC,
	[relative_hight] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实测ADP数据表' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'adp_data', @level2type=N'COLUMN',@level2name=N'stcd'
GO
/****** Object:  Table [cw].[adcp_data]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[adcp_data](
	[stcd] [char](8) NOT NULL,
	[profile_time] [datetime] NOT NULL,
	[relative_hight] [numeric](6, 2) NULL,
	[velocity] [numeric](6, 3) NULL,
	[direction] [numeric](5, 2) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [cw].[adcp_Block]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[adcp_Block](
	[stcd] [char](8) NOT NULL,
	[FileTime] [datetime] NOT NULL,
	[BinData] [varbinary](8000) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ZQ_B]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZQ_B](
	[STCD] [char](8) NOT NULL,
	[BGTM] [datetime] NOT NULL,
	[NO] [decimal](4, 0) NOT NULL,
	[Z] [decimal](7, 3) NULL,
	[Q] [decimal](9, 0) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [cw].[WVWD_R]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[WVWD_R](
	[STCD] [char](8) NOT NULL,
	[YMDHM] [datetime] NOT NULL,
	[WV0] [numeric](5, 2) NULL,
	[WD0] [numeric](4, 0) NULL,
	[WV2] [numeric](5, 2) NULL,
	[WD2] [numeric](4, 0) NULL,
	[WV10] [numeric](5, 2) NULL,
	[WD10] [numeric](4, 0) NULL,
 CONSTRAINT [PK_WVWD_R] PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[YMDHM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实测风速风向表' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'WVWD_R', @level2type=N'COLUMN',@level2name=N'STCD'
GO
/****** Object:  Table [cw].[WVWD_ORGNIZE]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[WVWD_ORGNIZE](
	[STCD] [char](8) NOT NULL,
	[YMDHM] [datetime] NOT NULL,
	[WV0] [numeric](5, 2) NULL,
	[WD0] [numeric](4, 0) NULL,
	[WV2] [numeric](5, 2) NULL,
	[WD2] [numeric](4, 0) NULL,
	[WV10] [numeric](5, 2) NULL,
	[WD10] [numeric](4, 0) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [cw].[WATER_R_TEST]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[WATER_R_TEST](
	[STCD] [char](8) NOT NULL,
	[YMDHM] [datetime] NOT NULL,
	[DATA] [numeric](7, 3) NULL,
	[WATERPROOF] [char](1) NULL,
	[RTIME] [datetime] NULL,
	[TRANTYPE] [char](1) NULL,
	[CHKTYPE] [char](1) NULL,
	[SOURCETYPE] [char](1) NULL,
	[DEVICEID] [char](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [cw].[WATER_R]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[WATER_R](
	[STCD] [char](8) NOT NULL,
	[YMDHM] [datetime] NOT NULL,
	[DATA] [numeric](7, 3) NULL,
	[WATERPROOF] [char](1) NULL,
	[RTIME] [datetime] NULL,
	[TRANTYPE] [char](1) NULL,
	[CHKTYPE] [char](1) NULL,
	[SOURCETYPE] [char](1) NULL,
	[DEVICEID] [char](10) NULL,
 CONSTRAINT [PK_WATER_R] PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[YMDHM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实测水位表' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'WATER_R', @level2type=N'COLUMN',@level2name=N'STCD'
GO
/****** Object:  Table [cw].[WATER_ORGNIZE]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[WATER_ORGNIZE](
	[STCD] [char](8) NOT NULL,
	[YMDHM] [datetime] NOT NULL,
	[DATA] [numeric](7, 3) NULL,
	[WATERPROOF] [char](1) NULL,
	[RTIME] [datetime] NULL,
	[TRANTYPE] [char](1) NULL,
	[CHKTYPE] [char](1) NULL,
	[SORCETYPE] [char](1) NULL,
	[DEVICEID] [char](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VIEWS]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VIEWS](
	[TABLE_CATALOG] [nvarchar](128) NULL,
	[TABLE_SCHEMA] [nvarchar](128) NULL,
	[TABLE_NAME] [nvarchar](128) NOT NULL,
	[VIEW_DEFINITION] [nvarchar](4000) NULL,
	[CHECK_OPTION] [varchar](7) NOT NULL,
	[IS_UPDATABLE] [varchar](2) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VIEW_TABLE_USAGE]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIEW_TABLE_USAGE](
	[VIEW_CATALOG] [nvarchar](128) NULL,
	[VIEW_SCHEMA] [nvarchar](128) NULL,
	[VIEW_NAME] [nvarchar](128) NOT NULL,
	[TABLE_CATALOG] [nvarchar](128) NULL,
	[TABLE_SCHEMA] [nvarchar](128) NULL,
	[TABLE_NAME] [nvarchar](128) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VIEW_COLUMN_USAGE]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIEW_COLUMN_USAGE](
	[VIEW_CATALOG] [nvarchar](128) NULL,
	[VIEW_SCHEMA] [nvarchar](128) NULL,
	[VIEW_NAME] [nvarchar](128) NOT NULL,
	[TABLE_CATALOG] [nvarchar](128) NULL,
	[TABLE_SCHEMA] [nvarchar](128) NULL,
	[TABLE_NAME] [nvarchar](128) NOT NULL,
	[COLUMN_NAME] [nvarchar](128) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [cw].[USERS_R]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[USERS_R](
	[ID] [char](9) NOT NULL,
	[USERNAME] [char](20) NULL,
	[PASSWORD] [char](20) NULL,
	[FLAG] [char](1) NULL,
	[ADDDT] [datetime] NULL,
	[LASTDT] [datetime] NULL,
	[TIMES] [numeric](9, 0) NULL,
	[IP] [char](15) NULL,
	[MEMO] [char](50) NULL,
	[COMPANY] [char](50) NULL,
 CONSTRAINT [id] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户管理表' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'USERS_R', @level2type=N'COLUMN',@level2name=N'ID'
GO
/****** Object:  Table [cw].[TB_R]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[TB_R](
	[STCD] [char](8) NOT NULL,
	[YMDHM] [datetime] NOT NULL,
	[H] [numeric](7, 3) NULL,
	[TB] [numeric](6, 2) NULL,
	[DNS] [numeric](6, 2) NULL,
	[PR] [numeric](6, 2) NULL,
	[WT] [numeric](5, 2) NULL,
	[EC] [numeric](4, 2) NULL,
	[CS] [numeric](7, 3) NULL,
 CONSTRAINT [PK_TB_R] PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[YMDHM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实测浊度盐度表' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'TB_R', @level2type=N'COLUMN',@level2name=N'STCD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'相对水深' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'TB_R', @level2type=N'COLUMN',@level2name=N'H'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浊度' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'TB_R', @level2type=N'COLUMN',@level2name=N'TB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'压力  1dBar' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'TB_R', @level2type=N'COLUMN',@level2name=N'PR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'水温' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'TB_R', @level2type=N'COLUMN',@level2name=N'WT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电导率 mS/cm' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'TB_R', @level2type=N'COLUMN',@level2name=N'EC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'含沙量' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'TB_R', @level2type=N'COLUMN',@level2name=N'CS'
GO
/****** Object:  Table [cw].[TB_CS_R]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[TB_CS_R](
	[STCD] [char](8) NOT NULL,
	[X0] [numeric](18, 14) NULL,
	[X1] [numeric](18, 14) NULL,
	[X2] [numeric](18, 14) NULL,
	[X3] [numeric](18, 14) NULL,
	[ALO] [char](1) NULL,
	[STARTTIME] [datetime] NULL,
 CONSTRAINT [stcd] PRIMARY KEY CLUSTERED 
(
	[STCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浊度含沙量关系表' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'TB_CS_R', @level2type=N'COLUMN',@level2name=N'STCD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系数1' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'TB_CS_R', @level2type=N'COLUMN',@level2name=N'X1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'算法' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'TB_CS_R', @level2type=N'COLUMN',@level2name=N'ALO'
GO
/****** Object:  Table [dbo].[TABLES]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TABLES](
	[TABLE_CATALOG] [nvarchar](128) NULL,
	[TABLE_SCHEMA] [nvarchar](128) NULL,
	[TABLE_NAME] [nvarchar](128) NOT NULL,
	[TABLE_TYPE] [varchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TABLE_PRIVILEGES]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TABLE_PRIVILEGES](
	[GRANTOR] [nvarchar](128) NULL,
	[GRANTEE] [nvarchar](128) NULL,
	[TABLE_CATALOG] [nvarchar](128) NULL,
	[TABLE_SCHEMA] [nvarchar](128) NULL,
	[TABLE_NAME] [nvarchar](128) NOT NULL,
	[PRIVILEGE_TYPE] [varchar](10) NULL,
	[IS_GRANTABLE] [varchar](3) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TABLE_CONSTRAINTS]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TABLE_CONSTRAINTS](
	[CONSTRAINT_CATALOG] [nvarchar](128) NULL,
	[CONSTRAINT_SCHEMA] [nvarchar](128) NULL,
	[CONSTRAINT_NAME] [nvarchar](128) NOT NULL,
	[TABLE_CATALOG] [nvarchar](128) NULL,
	[TABLE_SCHEMA] [nvarchar](128) NULL,
	[TABLE_NAME] [nvarchar](128) NOT NULL,
	[CONSTRAINT_TYPE] [varchar](11) NULL,
	[IS_DEFERRABLE] [varchar](2) NOT NULL,
	[INITIALLY_DEFERRED] [varchar](2) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Systxt]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Systxt](
	[Name] [char](10) NULL,
	[Content] [char](255) NULL,
	[LastM] [datetime] NULL,
	[memo] [char](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysremotelogins]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysremotelogins](
	[remoteserverid] [smallint] NULL,
	[remoteusername] [nvarchar](128) NULL,
	[status] [smallint] NULL,
	[sid] [varbinary](85) NULL,
	[changedate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysopentapes]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysopentapes](
	[openTape] [nvarchar](64) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysoledbusers]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysoledbusers](
	[rmtsrvid] [smallint] NULL,
	[rmtloginame] [nvarchar](128) NULL,
	[rmtpassword] [nvarchar](128) NULL,
	[loginsid] [varbinary](85) NULL,
	[status] [smallint] NULL,
	[changedate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sysmenu]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sysmenu](
	[Menuid] [char](10) NULL,
	[Menuname] [char](50) NULL,
	[Menutype] [char](10) NULL,
	[memo] [char](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[syslogins]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[syslogins](
	[sid] [varbinary](85) NULL,
	[status] [smallint] NULL,
	[createdate] [datetime] NULL,
	[updatedate] [datetime] NULL,
	[accdate] [datetime] NULL,
	[totcpu] [int] NULL,
	[totio] [int] NULL,
	[spacelimit] [int] NULL,
	[timelimit] [int] NULL,
	[resultlimit] [int] NULL,
	[name] [nvarchar](128) NULL,
	[dbname] [nvarchar](128) NULL,
	[password] [nvarchar](128) NULL,
	[language] [nvarchar](128) NULL,
	[denylogin] [int] NULL,
	[hasaccess] [int] NULL,
	[isntname] [int] NULL,
	[isntgroup] [int] NULL,
	[isntuser] [int] NULL,
	[sysadmin] [int] NULL,
	[securityadmin] [int] NULL,
	[serveradmin] [int] NULL,
	[setupadmin] [int] NULL,
	[processadmin] [int] NULL,
	[diskadmin] [int] NULL,
	[dbcreator] [int] NULL,
	[bulkadmin] [int] NULL,
	[loginname] [nvarchar](128) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STINF_B]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STINF_B](
	[STCDT] [float] NULL,
	[STCD] [float] NULL,
	[STNM] [nvarchar](255) NULL,
	[Ctype] [float] NULL,
	[ESLO] [float] NULL,
	[NRLA] [float] NULL,
	[RVNM] [nvarchar](255) NULL,
	[STLC] [nvarchar](255) NULL,
	[ADCD] [nvarchar](255) NULL,
	[BASE] [nvarchar](255) NULL,
	[MDRR] [bit] NOT NULL,
	[ESSTYM] [bit] NOT NULL,
	[WTSTYM] [bit] NOT NULL,
	[NT] [bit] NOT NULL,
	[STTP] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [cw].[STCOND_R]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[STCOND_R](
	[STCD] [char](8) NOT NULL,
	[YMDHM] [datetime] NOT NULL,
	[VOL] [numeric](7, 3) NULL,
	[ESLG] [numeric](11, 6) NULL,
	[NTLT] [numeric](10, 6) NULL,
	[CCCT] [numeric](9, 0) NULL,
	[UNCCT] [numeric](9, 0) NULL,
	[CCRT] [numeric](5, 2) NULL,
	[DEV] [char](10) NOT NULL,
	[GPS_TIME] [datetime] NULL,
 CONSTRAINT [PK_STCOND_R] PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[YMDHM] ASC,
	[DEV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测站状态表' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'STCOND_R', @level2type=N'COLUMN',@level2name=N'STCD'
GO
/****** Object:  Table [cw].[STATIONS_R]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[STATIONS_R](
	[STCD] [char](8) NOT NULL,
	[STCD_ID] [char](4) NULL,
	[STNM] [varchar](20) NULL,
	[ADDRESS] [varchar](30) NULL,
	[P_TRANPATH] [char](1) NOT NULL,
	[S_TRANPATH] [char](1) NULL,
	[STTP] [char](2) NULL,
	[ARTWATER] [numeric](1, 0) NULL,
	[FZWATEER] [numeric](1, 0) NULL,
	[YLWATER] [numeric](1, 0) NULL,
	[CSBWATER] [numeric](1, 0) NULL,
	[RAIN] [numeric](1, 0) NULL,
	[FLOW] [numeric](1, 0) NULL,
	[XX] [char](6) NULL,
	[YY] [char](6) NULL,
	[LXR] [char](10) NULL,
	[ZIP] [char](6) NULL,
	[PHONE] [char](20) NULL,
	[MEMO] [char](200) NULL,
	[BAOXUEN] [char](5) NULL,
	[BXTF] [int] NULL,
	[BZLX] [char](2) NULL,
 CONSTRAINT [zh] PRIMARY KEY CLUSTERED 
(
	[STCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'站的编号' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'STATIONS_R', @level2type=N'COLUMN',@level2name=N'STCD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'站的名称' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'STATIONS_R', @level2type=N'COLUMN',@level2name=N'STNM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'站的地址' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'STATIONS_R', @level2type=N'COLUMN',@level2name=N'ADDRESS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'站的主通信方式' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'STATIONS_R', @level2type=N'COLUMN',@level2name=N'P_TRANPATH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'站的备用通信方式' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'STATIONS_R', @level2type=N'COLUMN',@level2name=N'S_TRANPATH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测站信息表' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'STATIONS_R', @level2type=N'COLUMN',@level2name=N'MEMO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报汛站码' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'STATIONS_R', @level2type=N'COLUMN',@level2name=N'BAOXUEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标记该站是否报汛(1为报 0为不报)' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'STATIONS_R', @level2type=N'COLUMN',@level2name=N'BXTF'
GO
/****** Object:  Table [cw].[STATIONS_KIND]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[STATIONS_KIND](
	[STTP] [char](2) NOT NULL,
	[STYP] [char](20) NULL,
	[MAP] [char](60) NULL,
 CONSTRAINT [zkindid] PRIMARY KEY CLUSTERED 
(
	[STTP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测站类型表' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'STATIONS_KIND', @level2type=N'COLUMN',@level2name=N'STTP'
GO
/****** Object:  Table [cw].[STATION_DEV]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[STATION_DEV](
	[dev_id] [char](10) NOT NULL,
	[dev_com_port] [char](8) NOT NULL,
	[dev_name] [varchar](12) NOT NULL,
	[dev_owner] [char](8) NOT NULL,
 CONSTRAINT [dev_id] PRIMARY KEY CLUSTERED 
(
	[dev_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测站设备表' , @level0type=N'SCHEMA',@level0name=N'cw', @level1type=N'TABLE',@level1name=N'STATION_DEV', @level2type=N'COLUMN',@level2name=N'dev_id'
GO
/****** Object:  Table [dbo].[spt_values]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[spt_values](
	[name] [nvarchar](35) NULL,
	[number] [int] NOT NULL,
	[type] [nchar](3) NOT NULL,
	[low] [int] NULL,
	[high] [int] NULL,
	[status] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[spt_server_info]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[spt_server_info](
	[attribute_id] [int] NOT NULL,
	[attribute_name] [varchar](60) NOT NULL,
	[attribute_value] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[spt_provider_types]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[spt_provider_types](
	[ss_dtype] [tinyint] NOT NULL,
	[fixlen] [int] NULL,
	[type_name] [nvarchar](128) NOT NULL,
	[oledb_data_type] [smallint] NOT NULL,
	[best_match] [bit] NOT NULL,
	[is_nullable] [bit] NULL,
	[case_sensitive] [bit] NOT NULL,
	[fixed_prec_scale] [bit] NOT NULL,
	[is_long] [bit] NOT NULL,
	[auto_unique_value] [tinyint] NOT NULL,
	[data_precision] [int] NULL,
	[numeric_scale] [smallint] NULL,
	[column_size] [int] NULL,
	[literal_prefix] [nvarchar](32) NULL,
	[literal_suffix] [nvarchar](32) NULL,
	[searchable] [int] NOT NULL,
	[unsigned_attribute] [tinyint] NULL,
	[local_type_name] [nvarchar](128) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[spt_monitor]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[spt_monitor](
	[lastrun] [datetime] NOT NULL,
	[cpu_busy] [int] NOT NULL,
	[io_busy] [int] NOT NULL,
	[idle] [int] NOT NULL,
	[pack_received] [int] NOT NULL,
	[pack_sent] [int] NOT NULL,
	[connections] [int] NOT NULL,
	[pack_errors] [int] NOT NULL,
	[total_read] [int] NOT NULL,
	[total_write] [int] NOT NULL,
	[total_errors] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[spt_fallback_usg]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[spt_fallback_usg](
	[xserver_name] [varchar](30) NOT NULL,
	[xdttm_ins] [datetime] NOT NULL,
	[xdttm_last_ins_upd] [datetime] NOT NULL,
	[xfallback_vstart] [int] NULL,
	[dbid] [smallint] NOT NULL,
	[segmap] [int] NOT NULL,
	[lstart] [int] NOT NULL,
	[sizepg] [int] NOT NULL,
	[vstart] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[spt_fallback_dev]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[spt_fallback_dev](
	[xserver_name] [varchar](30) NOT NULL,
	[xdttm_ins] [datetime] NOT NULL,
	[xdttm_last_ins_upd] [datetime] NOT NULL,
	[xfallback_low] [int] NULL,
	[xfallback_drive] [char](2) NULL,
	[low] [int] NOT NULL,
	[high] [int] NOT NULL,
	[status] [smallint] NOT NULL,
	[name] [varchar](30) NOT NULL,
	[phyname] [varchar](127) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[spt_fallback_db]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[spt_fallback_db](
	[xserver_name] [varchar](30) NOT NULL,
	[xdttm_ins] [datetime] NOT NULL,
	[xdttm_last_ins_upd] [datetime] NOT NULL,
	[xfallback_dbid] [smallint] NULL,
	[name] [varchar](30) NOT NULL,
	[dbid] [smallint] NOT NULL,
	[status] [smallint] NOT NULL,
	[version] [smallint] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[spt_datatype_info_ext]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[spt_datatype_info_ext](
	[user_type] [smallint] NOT NULL,
	[CREATE_PARAMS] [varchar](32) NULL,
	[AUTO_INCREMENT] [smallint] NULL,
	[typename] [nvarchar](128) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[spt_datatype_info]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[spt_datatype_info](
	[ss_dtype] [tinyint] NOT NULL,
	[fixlen] [int] NULL,
	[ODBCVer] [tinyint] NULL,
	[TYPE_NAME] [nvarchar](128) NOT NULL,
	[DATA_TYPE] [smallint] NOT NULL,
	[data_precision] [int] NULL,
	[numeric_scale] [smallint] NULL,
	[RADIX] [smallint] NULL,
	[length] [int] NULL,
	[LITERAL_PREFIX] [varchar](32) NULL,
	[LITERAL_SUFFIX] [varchar](32) NULL,
	[CREATE_PARAMS] [varchar](32) NULL,
	[NULLABLE] [smallint] NOT NULL,
	[CASE_SENSITIVE] [smallint] NOT NULL,
	[SEARCHABLE] [smallint] NOT NULL,
	[UNSIGNED_ATTRIBUTE] [smallint] NULL,
	[MONEY] [smallint] NOT NULL,
	[AUTO_INCREMENT] [smallint] NULL,
	[LOCAL_TYPE_NAME] [nvarchar](128) NULL,
	[charbin] [tinyint] NULL,
	[SQL_DATA_TYPE] [smallint] NOT NULL,
	[SQL_DATETIME_SUB] [smallint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SCHEMATA]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCHEMATA](
	[CATALOG_NAME] [nvarchar](128) NOT NULL,
	[SCHEMA_NAME] [nvarchar](128) NULL,
	[SCHEMA_OWNER] [nvarchar](128) NULL,
	[DEFAULT_CHARACTER_SET_CATALOG] [nvarchar](128) NULL,
	[DEFAULT_CHARACTER_SET_SCHEMA] [nvarchar](128) NULL,
	[DEFAULT_CHARACTER_SET_NAME] [nvarchar](128) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salinity_R]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Salinity_R](
	[STCD] [char](8) NOT NULL,
	[YMDHM] [datetime] NOT NULL,
	[WT] [numeric](7, 3) NULL,
	[EC] [numeric](7, 3) NULL,
	[Salinity] [numeric](7, 3) NULL,
 CONSTRAINT [PK_TB_R] PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[YMDHM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [cw].[Salinity_R]    Script Date: 11/14/2018 17:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cw].[Salinity_R](
	[STCD] [char](8) NOT NULL,
	[YMDHM] [datetime] NOT NULL,
	[WT] [numeric](7, 3) NULL,
	[EC] [numeric](7, 3) NULL,
	[Salinity] [numeric](7, 3) NULL,
 CONSTRAINT [PK_Salinity_R] PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[YMDHM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_FV_R_Q]    Script Date: 11/14/2018 17:35:35 ******/
ALTER TABLE [cw].[FV_R] ADD  CONSTRAINT [DF_FV_R_Q]  DEFAULT (0) FOR [Q]
GO
