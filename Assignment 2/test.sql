USE [master]
GO
/****** Object:  Database [TEST_ONLINE]    Script Date: 08/12/2019 7:36:50 PM ******/
CREATE DATABASE [TEST_ONLINE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TEST_ONLINE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TEST_ONLINE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TEST_ONLINE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TEST_ONLINE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TEST_ONLINE] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TEST_ONLINE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TEST_ONLINE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TEST_ONLINE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TEST_ONLINE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TEST_ONLINE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TEST_ONLINE] SET ARITHABORT OFF 
GO
ALTER DATABASE [TEST_ONLINE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TEST_ONLINE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TEST_ONLINE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TEST_ONLINE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TEST_ONLINE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TEST_ONLINE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TEST_ONLINE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TEST_ONLINE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TEST_ONLINE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TEST_ONLINE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TEST_ONLINE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TEST_ONLINE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TEST_ONLINE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TEST_ONLINE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TEST_ONLINE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TEST_ONLINE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TEST_ONLINE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TEST_ONLINE] SET RECOVERY FULL 
GO
ALTER DATABASE [TEST_ONLINE] SET  MULTI_USER 
GO
ALTER DATABASE [TEST_ONLINE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TEST_ONLINE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TEST_ONLINE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TEST_ONLINE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TEST_ONLINE] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TEST_ONLINE', N'ON'
GO
ALTER DATABASE [TEST_ONLINE] SET QUERY_STORE = OFF
GO
USE [TEST_ONLINE]
GO
/****** Object:  Table [dbo].[BAI_KIEM_TRA]    Script Date: 08/12/2019 7:36:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAI_KIEM_TRA](
	[ID_BKT] [char](10) NOT NULL,
	[ID_CD] [char](10) NOT NULL,
	[Ten_BKT] [nvarchar](100) NOT NULL,
	[Thoi_gian_lam_bai] [int] NOT NULL,
	[Tong_so_cau_hoi] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_BKT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAU_HOI_TRAC_NGHIEM]    Script Date: 08/12/2019 7:36:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAU_HOI_TRAC_NGHIEM](
	[ID_CH] [char](10) NOT NULL,
	[Noi_dung_CH] [nvarchar](max) NOT NULL,
	[Dap_an_dung] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHU_DE]    Script Date: 08/12/2019 7:36:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHU_DE](
	[ID_CD] [char](10) NOT NULL,
	[Ten_chu_de] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GUI_YEU_CAU]    Script Date: 08/12/2019 7:36:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GUI_YEU_CAU](
	[ID_NV_GUI_YC] [char](10) NOT NULL,
	[ID_NV_NHAN_YC] [char](10) NOT NULL,
	[Noi_dung] [nvarchar](max) NOT NULL,
	[Trang_thai] [nvarchar](20) NOT NULL,
	[Thoi_gian_gui_yc] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_NV_GUI_YC] ASC,
	[ID_NV_NHAN_YC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HO_TRO]    Script Date: 08/12/2019 7:36:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HO_TRO](
	[ID_NV] [char](10) NOT NULL,
	[ID_ND] [char](10) NOT NULL,
	[Noi_dung] [nvarchar](max) NOT NULL,
	[Trang_thai] [nvarchar](20) NOT NULL,
	[Thoi_gian_gui] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_NV] ASC,
	[ID_ND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KET_QUA_LAM_BAI]    Script Date: 08/12/2019 7:36:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KET_QUA_LAM_BAI](
	[ID_ND] [char](10) NOT NULL,
	[ID_BKT] [char](10) NOT NULL,
	[Thoi_gian_lam] [date] NOT NULL,
	[Ket_qua] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ND] ASC,
	[ID_BKT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NGUOI_DUNG]    Script Date: 08/12/2019 7:36:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGUOI_DUNG](
	[ID_ND] [char](10) NOT NULL,
	[Ho] [nvarchar](10) NOT NULL,
	[Ten_dem] [nvarchar](10) NULL,
	[Ten] [nvarchar](10) NOT NULL,
	[Nam_sinh] [date] NULL,
	[Gioi_tinh] [nvarchar](10) NULL,
	[Dia_chi] [nvarchar](200) NULL,
	[Email] [varchar](100) NULL,
	[SDT_ND] [char](10) NULL,
	[Lan_truy_cap_gan_nhat] [date] NOT NULL,
	[Nguoi_ra_de_flag] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHAN_VIEN]    Script Date: 08/12/2019 7:36:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHAN_VIEN](
	[ID_NV] [char](10) NOT NULL,
	[Ho] [nvarchar](10) NOT NULL,
	[Ten_dem] [nvarchar](10) NULL,
	[Ten] [nvarchar](10) NOT NULL,
	[Nam_sinh] [date] NULL,
	[Gioi_tinh] [nvarchar](10) NULL,
	[Email] [varchar](100) NULL,
	[SDT_NV] [char](10) NULL,
	[Admin_flag] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_NV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRA_LOI]    Script Date: 08/12/2019 7:36:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRA_LOI](
	[ID_ND] [char](10) NOT NULL,
	[ID_CH] [char](10) NOT NULL,
	[Dap_an_cua_ND] [char](1) NOT NULL,
	[Dung_Sai] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ND] ASC,
	[ID_CH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BAI_KIEM_TRA] ([ID_BKT], [ID_CD], [Ten_BKT], [Thoi_gian_lam_bai], [Tong_so_cau_hoi]) VALUES (N'BKT01     ', N'CD01      ', N'Kiểm tra toán 1', 15, 10)
INSERT [dbo].[BAI_KIEM_TRA] ([ID_BKT], [ID_CD], [Ten_BKT], [Thoi_gian_lam_bai], [Tong_so_cau_hoi]) VALUES (N'BKT02     ', N'CD03      ', N'Kiểm tra Địa lý 1', 15, 10)
INSERT [dbo].[BAI_KIEM_TRA] ([ID_BKT], [ID_CD], [Ten_BKT], [Thoi_gian_lam_bai], [Tong_so_cau_hoi]) VALUES (N'BKT03     ', N'CD02      ', N'Kiểm tra Sinh học 1', 15, 10)
INSERT [dbo].[BAI_KIEM_TRA] ([ID_BKT], [ID_CD], [Ten_BKT], [Thoi_gian_lam_bai], [Tong_so_cau_hoi]) VALUES (N'BKT04     ', N'CD02      ', N'Kiểm tra Sinh học 2', 15, 10)
INSERT [dbo].[BAI_KIEM_TRA] ([ID_BKT], [ID_CD], [Ten_BKT], [Thoi_gian_lam_bai], [Tong_so_cau_hoi]) VALUES (N'BKT05     ', N'CD03      ', N'Kiểm tra Địa lý 2', 15, 10)
INSERT [dbo].[BAI_KIEM_TRA] ([ID_BKT], [ID_CD], [Ten_BKT], [Thoi_gian_lam_bai], [Tong_so_cau_hoi]) VALUES (N'BKT06     ', N'CD01      ', N'Kiểm tra toán 2', 15, 10)
INSERT [dbo].[BAI_KIEM_TRA] ([ID_BKT], [ID_CD], [Ten_BKT], [Thoi_gian_lam_bai], [Tong_so_cau_hoi]) VALUES (N'BKT07     ', N'CD02      ', N'Kiểm tra Sinh học 3', 15, 10)
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH01      ', N'12+25=? (a.27  b.37  c.47  d.57)', N'b')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH02      ', N'Có bao nhiêu số có một chữ số? (a.10  b.9  c.8  d.90)', N'a')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH03      ', N'Số liền trước số lớn nhất có một chữ số là số: (a.8  b.9  c.10  d.11)', N'c')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH04      ', N'Số liền sau số lớn nhất có hai chữ số là số: (a.10  b.9  c.99  d.100)', N'd')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH05      ', N'Số ở giữa số 25 và 27 là số: (a.28  b.24  c.26  d.25)', N'c')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH06      ', N'56 + 13 – 30 =? (a.29  b.39  c.49  d.59)', N'b')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH07      ', N'Số điền vào chỗ chấm trong phép tính ……….+15 – 20 = 37 là: (a.37  b.40  c.42  d.38)', N'c')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH08      ', N'Nhà bà có tất cả 64 quả bưởi và na, trong đó số quả na là 24, vậy số quả bưởi là: (a.88 quả  b.40 quả  c.24 quả  d.50)', N'b')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH09      ', N'Số 45 là số liền sau số: (a.40  b.44  c.46  d.50)', N'b')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH10      ', N'Hà có 35 lá cờ, Hà cho An 5 lá cờ và cho Lan 10 lá cờ, số lá cờ Hà còn lại: (a.30 lá  b.25 lá  c.20 lá  d.15 lá)', N'c')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH11      ', N'Số liền sau số bé nhất có hai chữ số là: (a.9  b.10  c.11  d.12)', N'c')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH12      ', N'Hình tam giác là hình có: (a.2 cạnh  b.3 cạnh  c.4 cạnh   d.5 cạnh)', N'b')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH13      ', N'Hôm nay là thứ năm thì hôm kia là ngày: (a.thứ ba    b.thứ bảy    c.thứ tư    b.thứ hai)', N'a')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH14      ', N'Có tất cả bao nhiêu số tròn chục có hai chữ số: (a.9    b.10    c.90    d.1', N'a')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH15      ', N'Số tròn chục ở giữa số 35 và 45 là: (a.30    b.40    c.50    d.60)', N'b')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH16      ', N'Số lớn nhất có hai chữ số là: (a.98    b.10    c.100    d.99)', N'd')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH17      ', N'Kết quả của phép tính 55 – 42 +22 = ………bé hơn số nào: (a.30    b.35    c.34     d.36', N'd')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH18      ', N'Trái đất có dạng hình gì?    A. Hình tròn      B. Hình vuông      C. Hình cầu       D. Hình bầu dục', N'c')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH19      ', N'Kinh tuyến Tây là:  A. Là kinh tuyến nằm bên trái của kinh tuyến gốc.    B. Là kinh tuyến nằm bên phải của kinh tuyến gốc.    C. Nằm phía dưới xích đạo.     D. Nằm phía trên xích đạo.', N'a')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH20      ', N'Kinh tuyến đi qua đài thiên văn Grin-uýt ở ngoại ô thành phố Luân Đôn (nước Anh) gọi là:    A. Kinh tuyến Đông.   B. Kinh tuyến Tây.   C. Kinh tuyến 180o.   D. Kinh tuyến gốc.', N'd')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH21      ', N'Nếu cách 1o ở tâm thì trên bề mặt của quả Địa Cầu từ cực Nam đến cực Bắc có bao nhiêu vĩ tuyến?   A. 181   B. 182   C. 180    D. 179', N'a')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH22      ', N'Trong hệ Mặt Trời, Trái Đất ở vị trí nào theo thứ tự xa dần Mặt Trời?   A. Vị trí thứ 3    B. Vị trí thứ 5   C. Vị trí thứ 9   C. Vị trí thứ 9', N'a')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH23      ', N'Trên Địa Cầu, nước ta nằm ở:   A. Nửa cầu Bắc và nửa cầu Tây   B. Nửa cầu Nam và nửa cầu Đông   C. Nửa cầu Bắc và nửa cầu Đông.   D. Nửa cầu Nam và nửa cầu Tây', N'c')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH24      ', N'Các đường nối liền hai điểm cực Bắc và cực Nam trên bề mặt quả Địa Cầu là những đường:   A. Kinh tuyến.    B. Kinh tuyến gốc.   C. Vĩ tuyến.   D. Vĩ tuyến gốc.3', N'a')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH25      ', N'Những vòng tròn trên quả Địa Cầu vuông góc với các kinh tuyến là những đường:    A. Kinh tuyến.   B. Kinh tuyến gốc.   C. Vĩ tuyến.    D. Vĩ tuyến gốc.', N'c')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH26      ', N'Kinh tuyến gốc và vĩ tuyến gốc có điểm chung là cùng mang số độ bằng:   A. 0 độ   B. 30 độ    C. 90 độ   D. 180 độ', N'a')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH27      ', N'Bản đồ là:   A. Hình vẽ của Trái Đất lên mặt giấy.   B. Hình vẽ thu nhỏ trên giấy về khu vực hay toàn bộ bề mặt Trái Đất.   C. Hình vẽ biểu hiện bề mặt Trái Đất lên mặt giấy.  D. Mô hình của Trái Đất được thu nhỏ lại.', N'b')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH28      ', N'Vật sống khác vật không sống ở đặc điểm nào dưới đây ?   A. Có khả năng hao hụt trọng lượng   B. Có khả năng thay đổi kích thước   C. Có khả năng sinh sản   D. Tất cả các phương án đưa ra', N'c')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH29      ', N'Vật nào dưới đây có khả năng lớn lên ?   A. Con mèo   B. Cục sắt   C. Viên sỏi   D. Con đò', N'a')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH30      ', N'Sự tồn tại của vật nào dưới đây không cần đến sự có mặt của không khí ?   A. Con ong      B. Con sóc    C. Con thoi      D. Con thỏ', N'c')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH31      ', N'Hiện tượng nào dưới đây phản ánh sự sống ?    A. Cá trương phình và trôi dạt vào bờ biển    B. Chồi non vươn lên khỏi mặt đất   C. Quả bóng tăng dần kích thước khi được thổi   D. Chiếc bàn bị mục ruỗng', N'b')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH32      ', N'Để sinh trưởng và phát triển bình thường, cây xanh cần đến điều kiện nào sau đây ?   A. Nước và muối khoáng   B. Khí ôxi   C. Ánh sáng   D. Tất cả các phương án đưa ra', N'd')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH33      ', N'Nếu đặt vật vào môi trường đất ẩm, dinh dưỡng dồi dào và nhiệt độ phù hợp thì vật nào dưới đây có thể lớn lên ?   A. Cây bút      B. Con dao     C. Cây bưởi      D. Con diều', N'c')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH34      ', N'Điều kiện tồn tại của vật nào dưới đây có nhiều sai khác so với những vật còn lại ?   A. Cây nhãn      B. Cây na     C. Cây cau      D. Cây kim', N'd')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH35      ', N'Vật sống có thể trở thành vật không sống nếu sinh trưởng trong điều kiện nào dưới đây ?   A. Thiếu dinh dưỡng   B. Thiếu khí cacbônic   C. Thừa khí ôxi    D. Vừa đủ ánh sáng', N'a')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH36      ', N'Những cây sống trôi nổi trên mặt nước thường có đặc điểm nào dưới đây ?   A. Xuất hiện bọt xốp màu trắng   B. Tua cuốn phát triển mạnh   C. Lá tiêu giảm   D. Rễ phát triển theo chiều sâu', N'a')
INSERT [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH], [Noi_dung_CH], [Dap_an_dung]) VALUES (N'CH37      ', N'Đâu không phải là một trong những đặc điểm chung của thực vật ?   A. Tự tổng hợp được chất hữu cơ   B. Chỉ sống ở môi trường trên cạn   C. Phần lớn không có khả năng di chuyển   D. Phản ứng chậm với các kích thích bên ngoài', N'b')
INSERT [dbo].[CHU_DE] ([ID_CD], [Ten_chu_de]) VALUES (N'CD01      ', N'Toán')
INSERT [dbo].[CHU_DE] ([ID_CD], [Ten_chu_de]) VALUES (N'CD02      ', N'Sinh học')
INSERT [dbo].[CHU_DE] ([ID_CD], [Ten_chu_de]) VALUES (N'CD03      ', N'Địa lý')
INSERT [dbo].[GUI_YEU_CAU] ([ID_NV_GUI_YC], [ID_NV_NHAN_YC], [Noi_dung], [Trang_thai], [Thoi_gian_gui_yc]) VALUES (N'NV07      ', N'NV01      ', N'Xin nghỉ phép', N'Đã xử lý', CAST(N'2019-12-05' AS Date))
INSERT [dbo].[GUI_YEU_CAU] ([ID_NV_GUI_YC], [ID_NV_NHAN_YC], [Noi_dung], [Trang_thai], [Thoi_gian_gui_yc]) VALUES (N'NV08      ', N'NV04      ', N'Xin nghỉ phép', N'Đã xử lý', CAST(N'2019-12-05' AS Date))
INSERT [dbo].[GUI_YEU_CAU] ([ID_NV_GUI_YC], [ID_NV_NHAN_YC], [Noi_dung], [Trang_thai], [Thoi_gian_gui_yc]) VALUES (N'NV09      ', N'NV06      ', N'Xin nghỉ phép', N'Đã xử lý', CAST(N'2019-12-06' AS Date))
INSERT [dbo].[HO_TRO] ([ID_NV], [ID_ND], [Noi_dung], [Trang_thai], [Thoi_gian_gui]) VALUES (N'NV01      ', N'ND02      ', N'Đáp án không đúng', N'Đã xử lý', CAST(N'2019-12-07' AS Date))
INSERT [dbo].[HO_TRO] ([ID_NV], [ID_ND], [Noi_dung], [Trang_thai], [Thoi_gian_gui]) VALUES (N'NV04      ', N'ND04      ', N'Câu hỏi không hợp lý', N'Đang xử lý', CAST(N'2019-12-05' AS Date))
INSERT [dbo].[HO_TRO] ([ID_NV], [ID_ND], [Noi_dung], [Trang_thai], [Thoi_gian_gui]) VALUES (N'NV06      ', N'ND05      ', N'Cập nhật câu hỏi', N'Đã tiếp nhận', CAST(N'2019-12-06' AS Date))
INSERT [dbo].[KET_QUA_LAM_BAI] ([ID_ND], [ID_BKT], [Thoi_gian_lam], [Ket_qua]) VALUES (N'ND02      ', N'BKT01     ', CAST(N'2019-12-07' AS Date), N'10/10     ')
INSERT [dbo].[KET_QUA_LAM_BAI] ([ID_ND], [ID_BKT], [Thoi_gian_lam], [Ket_qua]) VALUES (N'ND03      ', N'BKT02     ', CAST(N'2019-12-06' AS Date), N'8/10      ')
INSERT [dbo].[KET_QUA_LAM_BAI] ([ID_ND], [ID_BKT], [Thoi_gian_lam], [Ket_qua]) VALUES (N'ND04      ', N'BKT04     ', CAST(N'2019-12-07' AS Date), N'9/10      ')
INSERT [dbo].[NGUOI_DUNG] ([ID_ND], [Ho], [Ten_dem], [Ten], [Nam_sinh], [Gioi_tinh], [Dia_chi], [Email], [SDT_ND], [Lan_truy_cap_gan_nhat], [Nguoi_ra_de_flag]) VALUES (N'ND01      ', N'Lê', N'Tấn', N'Đại', CAST(N'1905-06-15' AS Date), N'Nam       ', N'78/4A - Trần Hưng Đạo - Quận 3', N'ltdai265_nd01@gmail.com', N'033668899 ', CAST(N'2019-11-22' AS Date), 1)
INSERT [dbo].[NGUOI_DUNG] ([ID_ND], [Ho], [Ten_dem], [Ten], [Nam_sinh], [Gioi_tinh], [Dia_chi], [Email], [SDT_ND], [Lan_truy_cap_gan_nhat], [Nguoi_ra_de_flag]) VALUES (N'ND02      ', N'Hồ', N'Lan', N'Minh', CAST(N'1905-06-16' AS Date), N'Nữ        ', N'253/56/9 - Phạm Văn Đồng - Quận Bình Thạnh', N'hlminh140_nd02@gmail.com', N'098765432 ', CAST(N'2019-12-08' AS Date), 0)
INSERT [dbo].[NGUOI_DUNG] ([ID_ND], [Ho], [Ten_dem], [Ten], [Nam_sinh], [Gioi_tinh], [Dia_chi], [Email], [SDT_ND], [Lan_truy_cap_gan_nhat], [Nguoi_ra_de_flag]) VALUES (N'ND03      ', N'Trần', N'Văn', N'Khánh', CAST(N'1905-06-18' AS Date), N'Nam       ', N'52/4 - Phạm Ngũ Lão - Quận 5', N'tv_khanh141_nd03@gmail.com', N'099412354 ', CAST(N'2019-12-07' AS Date), 0)
INSERT [dbo].[NGUOI_DUNG] ([ID_ND], [Ho], [Ten_dem], [Ten], [Nam_sinh], [Gioi_tinh], [Dia_chi], [Email], [SDT_ND], [Lan_truy_cap_gan_nhat], [Nguoi_ra_de_flag]) VALUES (N'ND04      ', N'Lê', N'Văn', N'Tài', CAST(N'1905-06-17' AS Date), N'Nam       ', N'26 - Nguyễn Thị Minh Khai - Quận 1', N'tai_lv33_nd04@gmail.com', N'038610002 ', CAST(N'2019-12-08' AS Date), 0)
INSERT [dbo].[NGUOI_DUNG] ([ID_ND], [Ho], [Ten_dem], [Ten], [Nam_sinh], [Gioi_tinh], [Dia_chi], [Email], [SDT_ND], [Lan_truy_cap_gan_nhat], [Nguoi_ra_de_flag]) VALUES (N'ND05      ', N'Trần', N'Linh', N'Trung', CAST(N'1905-06-15' AS Date), N'Nữ        ', N'92/56/3 - Trường Chinh - Quận Tân Phú', N'trung_linh_nd05@gmail.com', N'038777888 ', CAST(N'2019-12-08' AS Date), 1)
INSERT [dbo].[NGUOI_DUNG] ([ID_ND], [Ho], [Ten_dem], [Ten], [Nam_sinh], [Gioi_tinh], [Dia_chi], [Email], [SDT_ND], [Lan_truy_cap_gan_nhat], [Nguoi_ra_de_flag]) VALUES (N'ND06      ', N'Bạch ', NULL, N'Tuyết', CAST(N'1905-06-16' AS Date), N'Nữ        ', N'45/3 - Cộng Hòa - Quận Tân Phú', N'tuyetbach321_nd06@gmail.com', N'096555333 ', CAST(N'2018-03-06' AS Date), 1)
INSERT [dbo].[NGUOI_DUNG] ([ID_ND], [Ho], [Ten_dem], [Ten], [Nam_sinh], [Gioi_tinh], [Dia_chi], [Email], [SDT_ND], [Lan_truy_cap_gan_nhat], [Nguoi_ra_de_flag]) VALUES (N'ND07      ', N'Nguyễn', N'Thị', N'Hồng', CAST(N'1905-06-17' AS Date), N'Nữ        ', N'159 - Nguyễn Văn Quá - Quận 12', N'hong_nguyen95_nd07@gmail.com', N'097620026 ', CAST(N'2017-08-27' AS Date), 1)
INSERT [dbo].[NGUOI_DUNG] ([ID_ND], [Ho], [Ten_dem], [Ten], [Nam_sinh], [Gioi_tinh], [Dia_chi], [Email], [SDT_ND], [Lan_truy_cap_gan_nhat], [Nguoi_ra_de_flag]) VALUES (N'ND08      ', N'Trần', N'Tuấn', N'Anh', CAST(N'1905-06-18' AS Date), N'Nam       ', N'482B - Cộng Hòa - Quận Tân Phú', N'anh_tuan8_nd08@gmail.com', N'035216302 ', CAST(N'2019-12-08' AS Date), 1)
INSERT [dbo].[NGUOI_DUNG] ([ID_ND], [Ho], [Ten_dem], [Ten], [Nam_sinh], [Gioi_tinh], [Dia_chi], [Email], [SDT_ND], [Lan_truy_cap_gan_nhat], [Nguoi_ra_de_flag]) VALUES (N'ND09      ', N'Hồ', NULL, N'Vương', CAST(N'1905-06-16' AS Date), N'Nam       ', N'299 - Võ Thị Sáu - Quận 3', N'ho_vuong49_nd09@gmail.com', N'037520410 ', CAST(N'2018-02-10' AS Date), 1)
INSERT [dbo].[NHAN_VIEN] ([ID_NV], [Ho], [Ten_dem], [Ten], [Nam_sinh], [Gioi_tinh], [Email], [SDT_NV], [Admin_flag]) VALUES (N'NV01      ', N'Nguyễn', N'Hoài', N'Nam', CAST(N'1905-06-12' AS Date), N'Nam', N'nam_nv01@gmail.com', N'098926589 ', 1)
INSERT [dbo].[NHAN_VIEN] ([ID_NV], [Ho], [Ten_dem], [Ten], [Nam_sinh], [Gioi_tinh], [Email], [SDT_NV], [Admin_flag]) VALUES (N'NV010     ', N'Mai', NULL, N'Đào', CAST(N'1905-06-16' AS Date), N'Nữ', N'daomai5_nv010@gmail.com', N'034810030 ', 0)
INSERT [dbo].[NHAN_VIEN] ([ID_NV], [Ho], [Ten_dem], [Ten], [Nam_sinh], [Gioi_tinh], [Email], [SDT_NV], [Admin_flag]) VALUES (N'NV02      ', N'Lê', N'Thanh', N'An', CAST(N'1905-06-17' AS Date), N'Nam', N'an_nv02@gmail.com', N'036453216 ', 0)
INSERT [dbo].[NHAN_VIEN] ([ID_NV], [Ho], [Ten_dem], [Ten], [Nam_sinh], [Gioi_tinh], [Email], [SDT_NV], [Admin_flag]) VALUES (N'NV03      ', N'Trần', N'Văn', N'Khánh', CAST(N'1905-06-15' AS Date), N'Nam', N'khanh_nv03@gmail.com', N'096753456 ', 0)
INSERT [dbo].[NHAN_VIEN] ([ID_NV], [Ho], [Ten_dem], [Ten], [Nam_sinh], [Gioi_tinh], [Email], [SDT_NV], [Admin_flag]) VALUES (N'NV04      ', N'Lê', N'Bạch', N'Tuyết', CAST(N'1905-06-14' AS Date), N'Nữ', N'tuyetbach_nv04@gmail.com', N'034856145 ', 1)
INSERT [dbo].[NHAN_VIEN] ([ID_NV], [Ho], [Ten_dem], [Ten], [Nam_sinh], [Gioi_tinh], [Email], [SDT_NV], [Admin_flag]) VALUES (N'NV05      ', N'Trần', N'Thị Thanh', N'Nhàn', CAST(N'1905-06-13' AS Date), N'Nữ', N'nhanthanh_nv05@gmail.com', N'036333025 ', 0)
INSERT [dbo].[NHAN_VIEN] ([ID_NV], [Ho], [Ten_dem], [Ten], [Nam_sinh], [Gioi_tinh], [Email], [SDT_NV], [Admin_flag]) VALUES (N'NV06      ', N'Cao', N'Quốc', N'Huy', CAST(N'1905-06-15' AS Date), N'Nam', N'huy_cao48_nv06@gmail.com', N'099369666 ', 1)
INSERT [dbo].[NHAN_VIEN] ([ID_NV], [Ho], [Ten_dem], [Ten], [Nam_sinh], [Gioi_tinh], [Email], [SDT_NV], [Admin_flag]) VALUES (N'NV07      ', N'Nguyễn', N'Ngọc', N'Bích', CAST(N'1905-06-17' AS Date), N'Nữ', N'bichngoc241_nv07@gmail.com', N'037214931 ', 0)
INSERT [dbo].[NHAN_VIEN] ([ID_NV], [Ho], [Ten_dem], [Ten], [Nam_sinh], [Gioi_tinh], [Email], [SDT_NV], [Admin_flag]) VALUES (N'NV08      ', N'Bạch', N'Tấn', N'Hoàng', CAST(N'1905-06-12' AS Date), N'Nam', N'hoangbach_nv08@gmail.com', N'036625836 ', 0)
INSERT [dbo].[NHAN_VIEN] ([ID_NV], [Ho], [Ten_dem], [Ten], [Nam_sinh], [Gioi_tinh], [Email], [SDT_NV], [Admin_flag]) VALUES (N'NV09      ', N'Ngô', N'Lộc', N'Xuân', CAST(N'1905-06-13' AS Date), N'Nữ', N'loc_xuan20_nv09@gmail.com', N'099888888 ', 0)
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND02      ', N'CH01      ', N'b', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND02      ', N'CH02      ', N'a', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND02      ', N'CH03      ', N'c', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND02      ', N'CH04      ', N'd', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND02      ', N'CH05      ', N'c', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND02      ', N'CH06      ', N'b', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND02      ', N'CH07      ', N'c', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND02      ', N'CH08      ', N'b', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND02      ', N'CH09      ', N'b', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND02      ', N'CH10      ', N'c', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND03      ', N'CH18      ', N'c', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND03      ', N'CH19      ', N'a', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND03      ', N'CH20      ', N'c', N'Sai')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND03      ', N'CH21      ', N'a', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND03      ', N'CH22      ', N'a', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND03      ', N'CH23      ', N'c', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND03      ', N'CH24      ', N'd', N'Sai')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND03      ', N'CH25      ', N'c', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND03      ', N'CH26      ', N'a', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND03      ', N'CH27      ', N'b', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND04      ', N'CH28      ', N'c', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND04      ', N'CH29      ', N'a', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND04      ', N'CH30      ', N'c', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND04      ', N'CH31      ', N'b', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND04      ', N'CH32      ', N'd', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND04      ', N'CH33      ', N'c', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND04      ', N'CH34      ', N'd', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND04      ', N'CH35      ', N'a', N'Đúng')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND04      ', N'CH36      ', N'c', N'Sai')
INSERT [dbo].[TRA_LOI] ([ID_ND], [ID_CH], [Dap_an_cua_ND], [Dung_Sai]) VALUES (N'ND04      ', N'CH37      ', N'b', N'Đúng')
ALTER TABLE [dbo].[BAI_KIEM_TRA]  WITH CHECK ADD FOREIGN KEY([ID_CD])
REFERENCES [dbo].[CHU_DE] ([ID_CD])
GO
ALTER TABLE [dbo].[GUI_YEU_CAU]  WITH CHECK ADD FOREIGN KEY([ID_NV_GUI_YC])
REFERENCES [dbo].[NHAN_VIEN] ([ID_NV])
GO
ALTER TABLE [dbo].[GUI_YEU_CAU]  WITH CHECK ADD FOREIGN KEY([ID_NV_NHAN_YC])
REFERENCES [dbo].[NHAN_VIEN] ([ID_NV])
GO
ALTER TABLE [dbo].[HO_TRO]  WITH CHECK ADD FOREIGN KEY([ID_ND])
REFERENCES [dbo].[NGUOI_DUNG] ([ID_ND])
GO
ALTER TABLE [dbo].[HO_TRO]  WITH CHECK ADD FOREIGN KEY([ID_NV])
REFERENCES [dbo].[NHAN_VIEN] ([ID_NV])
GO
ALTER TABLE [dbo].[KET_QUA_LAM_BAI]  WITH CHECK ADD FOREIGN KEY([ID_BKT])
REFERENCES [dbo].[BAI_KIEM_TRA] ([ID_BKT])
GO
ALTER TABLE [dbo].[KET_QUA_LAM_BAI]  WITH CHECK ADD FOREIGN KEY([ID_ND])
REFERENCES [dbo].[NGUOI_DUNG] ([ID_ND])
GO
ALTER TABLE [dbo].[TRA_LOI]  WITH CHECK ADD FOREIGN KEY([ID_CH])
REFERENCES [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH])
GO
ALTER TABLE [dbo].[TRA_LOI]  WITH CHECK ADD FOREIGN KEY([ID_ND])
REFERENCES [dbo].[NGUOI_DUNG] ([ID_ND])
GO
ALTER TABLE [dbo].[NGUOI_DUNG]  WITH CHECK ADD CHECK  (([Gioi_tinh]=N'Nam' OR [Gioi_tinh]=N'Nữ'))
GO
ALTER TABLE [dbo].[NGUOI_DUNG]  WITH CHECK ADD CHECK  (([Gioi_tinh]=N'Nam' OR [Gioi_tinh]=N'Nữ'))
GO
ALTER TABLE [dbo].[NHAN_VIEN]  WITH CHECK ADD CHECK  (([Gioi_tinh]=N'Nam' OR [Gioi_tinh]=N'Nữ'))
GO
ALTER TABLE [dbo].[NHAN_VIEN]  WITH CHECK ADD CHECK  (([Gioi_tinh]=N'Nam' OR [Gioi_tinh]=N'Nữ'))
GO
USE [master]
GO
ALTER DATABASE [TEST_ONLINE] SET  READ_WRITE 
GO
