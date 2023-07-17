USE [master]
GO
/****** Object:  Database [APOSDB]    Script Date: 7/17/2023 7:56:11 PM ******/
CREATE DATABASE [APOSDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'APOSDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\APOSDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'APOSDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\APOSDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [APOSDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [APOSDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [APOSDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [APOSDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [APOSDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [APOSDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [APOSDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [APOSDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [APOSDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [APOSDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [APOSDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [APOSDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [APOSDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [APOSDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [APOSDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [APOSDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [APOSDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [APOSDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [APOSDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [APOSDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [APOSDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [APOSDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [APOSDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [APOSDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [APOSDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [APOSDB] SET  MULTI_USER 
GO
ALTER DATABASE [APOSDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [APOSDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [APOSDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [APOSDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [APOSDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [APOSDB]
GO
/****** Object:  Table [dbo].[purchase]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[purchase](
	[product_id] [varchar](250) NOT NULL,
	[product_name] [nvarchar](250) NULL,
	[product_quantity] [decimal](18, 2) NULL,
	[cost_price] [decimal](18, 2) NULL,
	[retail_price] [decimal](18, 2) NULL,
	[total_cost_price] [decimal](18, 2) NULL,
	[total_retail_price] [decimal](18, 2) NULL,
	[category] [nvarchar](150) NULL,
	[supplier] [nvarchar](150) NULL,
	[imagename] [varchar](250) NULL,
	[discount] [decimal](18, 2) NULL,
	[taxapply] [int] NULL,
	[Shopid] [varchar](50) NULL,
	[status] [int] NULL,
	[logDate] [datetime] NULL CONSTRAINT [DF_purchase_logDate]  DEFAULT (getdate()),
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_purchase_UpdateDate]  DEFAULT (getdate()),
	[Updateby] [varchar](150) NULL,
 CONSTRAINT [PK_purchase] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[return_item]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[return_item](
	[return_id] [bigint] IDENTITY(1,1) NOT NULL,
	[item_id] [varchar](150) NULL,
	[itemName] [nvarchar](250) NULL,
	[Qty] [decimal](18, 2) NULL,
	[RetailsPrice] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[return_time] [varchar](150) NULL,
	[custno] [varchar](150) NULL,
	[emp] [varchar](150) NULL,
	[SoldInvoiceNo] [varchar](150) NULL,
	[Comment] [nvarchar](250) NULL,
	[disamt] [decimal](18, 2) NULL,
	[vatamt] [decimal](18, 2) NULL,
	[logdate] [datetime] NULL CONSTRAINT [DF_return_item_logdate]  DEFAULT (getdate()),
	[Shopid] [varchar](50) NULL,
 CONSTRAINT [PK_return_item] PRIMARY KEY CLUSTERED 
(
	[return_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sales_item]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sales_item](
	[sales_id] [varchar](150) NULL,
	[item_id] [bigint] IDENTITY(1,1) NOT NULL,
	[itemName] [nvarchar](250) NULL,
	[Qty] [decimal](18, 2) NULL,
	[RetailsPrice] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[profit] [decimal](18, 2) NULL,
	[sales_time] [varchar](150) NULL,
	[itemcode] [varchar](150) NULL,
	[discount] [decimal](18, 2) NULL,
	[taxapply] [varchar](50) NULL,
	[status] [int] NULL CONSTRAINT [DF_sales_item_status]  DEFAULT ((1)),
	[logDate] [datetime] NULL CONSTRAINT [DF_sales_item_logDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_sales_item] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sales_payment]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sales_payment](
	[sales_id] [bigint] NOT NULL,
	[payment_type] [varchar](150) NULL,
	[payment_amount] [decimal](18, 2) NULL,
	[change_amount] [decimal](18, 2) NULL,
	[due_amount] [decimal](18, 2) NULL,
	[dis] [decimal](18, 2) NULL,
	[vat] [decimal](18, 2) NULL,
	[sales_time] [varchar](150) NULL,
	[c_id] [varchar](150) NULL,
	[emp_id] [varchar](150) NULL,
	[comment] [nvarchar](350) NULL,
	[TrxType] [varchar](50) NULL,
	[Shopid] [varchar](100) NULL,
	[ovdisrate] [decimal](18, 2) NULL,
	[vaterate] [decimal](18, 2) NULL,
	[logdate] [datetime] NULL CONSTRAINT [DF_sales_payment_logdate]  DEFAULT (getdate()),
	[SaleType] [varchar](50) NULL,
 CONSTRAINT [PK_sales_payment] PRIMARY KEY CLUSTERED 
(
	[sales_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[storeconfig]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[storeconfig](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[companyname] [varchar](250) NULL,
	[companyaddress] [varchar](250) NULL,
	[companyphone] [varchar](250) NULL,
	[vatno] [varchar](250) NULL,
	[web] [varchar](250) NULL,
	[vatrate] [decimal](18, 3) NULL,
	[disrate] [decimal](18, 3) NULL,
	[footermsg] [varchar](450) NULL,
	[updatetime] [datetime] NULL CONSTRAINT [DF_storeconfig_updatetime]  DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_adv_sal]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_adv_sal](
	[user_name] [varchar](50) NULL,
	[adv_month] [varchar](50) NULL,
	[adv_year] [varchar](50) NULL,
	[adv_date] [varchar](50) NULL,
	[adv_amount] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_category]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_CustCredit]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_CustCredit](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustID] [bigint] NOT NULL,
	[OrderID] [varchar](250) NULL,
	[Date] [varchar](150) NULL,
	[Credit] [decimal](18, 2) NULL,
	[Description] [varchar](250) NULL,
	[Logtime] [datetime] NULL CONSTRAINT [DF_tbl_CustCredit_Logtime]  DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_customer]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_customer](
	[ID] [bigint] IDENTITY(10000001,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[EmailAddress] [varchar](250) NULL,
	[Phone] [varchar](50) NULL,
	[Address] [varchar](250) NULL,
	[City] [varchar](50) NULL,
	[PeopleType] [varchar](50) NULL,
	[Logtime] [datetime] NULL CONSTRAINT [DF_tbl_customer_Logtime]  DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_duepayment]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_duepayment](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[receivedate] [varchar](50) NULL,
	[sales_id] [bigint] NULL,
	[totalamt] [decimal](18, 2) NULL,
	[dueamt] [decimal](18, 2) NULL,
	[receiveamt] [decimal](18, 2) NULL,
	[custid] [varchar](50) NULL,
	[status] [int] NULL CONSTRAINT [DF_tbl_duepayment_status]  DEFAULT ((1)),
	[Shopid] [varchar](50) NULL,
	[emp_id] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_duepayment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_expense]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_expense](
	[ID] [bigint] IDENTITY(901,1) NOT NULL,
	[Date] [smalldatetime] NULL,
	[ReferenceNo] [varchar](250) NULL,
	[Category] [varchar](150) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Attachment] [varchar](450) NULL,
	[fileextension] [varchar](50) NULL,
	[Note] [varchar](450) NULL,
	[Createdby] [varchar](150) NULL,
 CONSTRAINT [PK_tbl_expense] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_payroll]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_payroll](
	[user_name] [varchar](50) NOT NULL,
	[pay_month] [varchar](50) NOT NULL,
	[pay_year] [varchar](50) NOT NULL,
	[pay_date] [varchar](50) NULL,
	[basic_pay] [varchar](50) NULL,
	[bouns] [varchar](50) NULL,
	[total_salary] [varchar](50) NULL,
	[bal_amount] [varchar](50) NULL,
	[leaves] [varchar](50) NULL,
	[deducations] [varchar](50) NULL,
	[net_amount] [varchar](50) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pay_status] [varchar](50) NULL,
	[paid_amount] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_payroll_1] PRIMARY KEY CLUSTERED 
(
	[user_name] ASC,
	[pay_month] ASC,
	[pay_year] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_purchase_history]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_purchase_history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_id] [varchar](50) NULL,
	[product_name] [nvarchar](150) NULL,
	[product_quantity] [decimal](18, 2) NULL,
	[cost_price] [decimal](18, 2) NULL,
	[retail_price] [decimal](18, 2) NULL,
	[category] [varchar](50) NULL,
	[supplier] [varchar](50) NULL,
	[purchase_date] [varchar](50) NULL,
	[Shopid] [varchar](50) NULL,
	[ptype] [varchar](50) NULL,
	[status] [int] NULL CONSTRAINT [DF__tbl_purch__statu__6A30C649]  DEFAULT ((1)),
 CONSTRAINT [PK_tbl_purchase_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_saleInfo]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_saleInfo](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [varchar](250) NULL,
	[WarehouseNo] [varchar](250) NULL,
	[Biller] [varchar](250) NULL,
	[Customer] [varchar](250) NULL,
	[Note] [varchar](250) NULL,
	[DisRate] [decimal](18, 2) NULL,
	[TaxRate] [decimal](18, 2) NULL,
	[ShippingFee] [decimal](18, 2) NULL,
	[SoldBy] [varchar](250) NULL,
	[DateTime] [smalldatetime] NULL CONSTRAINT [DF_tbl_saleInfo_DateTime]  DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_terminalLocation]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_terminalLocation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](250) NULL,
	[Branchname] [varchar](150) NULL,
	[Location] [varchar](430) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](150) NULL,
	[Web] [varchar](150) NULL,
	[VAT] [decimal](18, 3) NULL,
	[Dis] [decimal](18, 3) NULL,
	[VATRegiNo] [varchar](150) NULL,
	[Shopid] [varchar](110) NULL,
	[Footermsg] [varchar](450) NULL,
 CONSTRAINT [PK__tbl_term__3214EC2732E0915F] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_workrecords]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_workrecords](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](150) NULL,
	[datatype] [varchar](50) NULL,
	[logdate] [smalldatetime] NULL,
	[logtime] [smalldatetime] NULL,
	[logdatetime] [smalldatetime] NULL,
	[status] [int] NULL CONSTRAINT [DF__tbl_workr__statu__5DCAEF64]  DEFAULT ((1)),
 CONSTRAINT [PK_tbl_workrecords] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[test]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[test](
	[id] [int] NOT NULL,
	[testtb] [varchar](150) NULL,
	[testtb2] [varchar](150) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[trincro]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trincro](
	[trno] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[userattendence]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userattendence](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[intime] [varchar](50) NULL,
	[outtime] [varchar](50) NULL,
	[att_date] [varchar](50) NOT NULL,
	[userid] [bigint] NULL,
	[att_status] [varchar](50) NULL,
	[att_month] [varchar](50) NULL,
	[att_year] [varchar](50) NULL,
 CONSTRAINT [PK_userattendence_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usermgt]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usermgt](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Father_name] [varchar](100) NULL,
	[Address] [varchar](220) NULL,
	[Email] [varchar](100) NULL,
	[Contact] [varchar](100) NULL,
	[DOB] [varchar](100) NULL,
	[Username] [varchar](100) NULL,
	[password] [varchar](100) NULL,
	[usertype] [varchar](100) NULL,
	[position] [varchar](100) NULL,
	[imagename] [varchar](100) NULL,
	[Shopid] [varchar](100) NULL,
	[logdate] [datetime] NULL CONSTRAINT [DF_usermgt_logdate]  DEFAULT (getdate()),
	[basic_salary] [varchar](50) NULL,
	[joning_date] [varchar](50) NULL,
	[in_time] [varchar](50) NULL,
	[out_time] [varchar](50) NULL,
	[shopname] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CustomerCredit]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CustomerCredit]
AS
 SELECT Customers.ID, Customers.Name, Customers.Phone as Mobile, Customers.Address ,Customers.EmailAddress, Customers.City,Customers.PeopleType 
	FROM tbl_customer Customers
	LEFT JOIN tbl_CustCredit  cc
	ON CC.CustID=Customers.ID
	group by  Customers.ID, Customers.Name, Customers.Phone, Customers.Address ,Customers.EmailAddress, Customers.City,Customers.PeopleType

GO
/****** Object:  View [dbo].[vw_CustCreditReport]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_CustCreditReport]
AS
		SELECT cc.ID AS TrxID, cc.Date, Customers.ID AS CustID, Customers.Name, cc.OrderID, cc.Credit, cc.Description
		FROM         dbo.tbl_CustCredit AS cc 
		LEFT OUTER JOIN  dbo.tbl_customer AS Customers 
		ON cc.CustID = Customers.ID
		--ORDER BY cc.Date DESC

GO
/****** Object:  View [dbo].[vw_General_Ledger]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_General_Ledger] 
AS 
		SELECT     sp.sales_time AS Date, SUM(sp.payment_amount) AS Sales, ISNULL((SUM(ri.Total) - SUM(ri.disamt)) + SUM(ri.vatamt) ,0)  as 'Return'
		FROM         dbo.sales_payment AS sp LEFT OUTER JOIN
		dbo.return_item AS ri 
		ON sp.sales_id = ri.SoldInvoiceNo
		GROUP BY sp.sales_time

GO
/****** Object:  View [dbo].[vw_itemdisplay_sr]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_itemdisplay_sr]
AS		 
		  select Top 12 * from purchase ORDER BY NEWID()

GO
/****** Object:  View [dbo].[vw_workrecords]    Script Date: 7/17/2023 7:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_workrecords]
AS		 
		-- Get the Result in HH:MI:SS:MMM(24H) format
		--SELECT CONVERT(VARCHAR(12), DATEADD(MS, DATEDIFF(MS, '20:50:59', '21:59:59'), 0), 114) AS TimeDiff

		SELECT  username , logdate as 'Date' ,  min( logtime) as 'IN' , max( logtime)  as 'OUT', 
		 CONVERT(VARCHAR(8), DATEADD(MS, DATEDIFF(MS, MIN(logtime), MAX(logtime)), 0), 114) AS 'HOURS'
		from tbl_workrecords group by username , logdate

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1= Sold 2= Returned' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sales_item', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[31] 4[30] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cc"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 126
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CustomerCredit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CustomerCredit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "cc"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 177
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customers"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 188
               Right = 412
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_CustCreditReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_CustCreditReport'
GO
USE [master]
GO
ALTER DATABASE [APOSDB] SET  READ_WRITE 
GO
