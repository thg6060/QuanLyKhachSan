USE [master]
GO

/****** Object:  Database [QuanLyKhachSan]    Script Date: 5/2/2020 8:31:35 PM ******/
CREATE DATABASE [QuanLyKhachSan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyKhachSan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QuanLyKhachSan.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyKhachSan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QuanLyKhachSan_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [QuanLyKhachSan] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyKhachSan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [QuanLyKhachSan] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [QuanLyKhachSan] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [QuanLyKhachSan] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [QuanLyKhachSan] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [QuanLyKhachSan] SET ARITHABORT OFF 
GO

ALTER DATABASE [QuanLyKhachSan] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [QuanLyKhachSan] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [QuanLyKhachSan] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [QuanLyKhachSan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [QuanLyKhachSan] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [QuanLyKhachSan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [QuanLyKhachSan] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [QuanLyKhachSan] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [QuanLyKhachSan] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [QuanLyKhachSan] SET  DISABLE_BROKER 
GO

ALTER DATABASE [QuanLyKhachSan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [QuanLyKhachSan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [QuanLyKhachSan] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [QuanLyKhachSan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [QuanLyKhachSan] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [QuanLyKhachSan] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [QuanLyKhachSan] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [QuanLyKhachSan] SET RECOVERY FULL 
GO

ALTER DATABASE [QuanLyKhachSan] SET  MULTI_USER 
GO

ALTER DATABASE [QuanLyKhachSan] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [QuanLyKhachSan] SET DB_CHAINING OFF 
GO

ALTER DATABASE [QuanLyKhachSan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [QuanLyKhachSan] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [QuanLyKhachSan] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [QuanLyKhachSan] SET  READ_WRITE 
GO

USE QuanLyKhachSan
GO
 ---------------------------TẠO BẢNG----------------------------

CREATE TABLE VATDUNG(
  MaVatDung INT IDENTITY(1,1) NOT NULL,
  TenVatDung NVARCHAR(50),
  TinhTrang NVARCHAR(50),
  GiaVatDung INT,
  MaPhong INT
)
GO
CREATE TABLE PHONG(
   MaPhong INT IDENTITY(1,1) NOT NULL,
   TenPhong NVARCHAR (50),
   MaLoai INT,
   TrangThai BIT
)
GO
CREATE TABLE LOAIPHONG(
    MaLoai INT IDENTITY(1,1) NOT NULL,
	TenLoai NVARCHAR (50),
	GiaThue INT,
	GhiChu NVARCHAR(50)
)
GO
CREATE TABLE NHANVIEN(
    MaNV INT IDENTITY(1,1) NOT NULL ,
	TaiKhoan VARCHAR(50),
	MatKhau VARCHAR(50),
	HoTen NVARCHAR(100),
	NgaySinh DATE ,
	GioiTinh NVARCHAR (50),
	SDT CHAR(10) 
	)
GO
CREATE TABLE KHACHHANG(
    MaKH INT IDENTITY(1,1) NOT NULL, 
	TenKH NVARCHAR(100),
	SDT CHAR(10) 
	)
GO
CREATE TABLE DICHVU(
   MaDichVu INT IDENTITY(1,1) NOT NULL ,
   TENDV NVARCHAR(100),
   GiaDichVu INT
   )
GO
CREATE TABLE THUEPHONG(
  MaPhong INT NOT NULL ,
  MaHoaDon INT NOT NULL,
  NgayBatDauThue DATE,
  NgayTraPhong DATE,
  DatCoc INT,
  SoDem int NULL, 
  )
GO
CREATE TABLE SuDungDichVu(
   MaDichVu INT NOT NULL,
   MaHoaDon INT NOT NULL,
   NgayDungDichVu DATE,
   SoLuong int NULL,
  )
GO

GO
CREATE TABLE HOADON(
 MaHoaDon INT IDENTITY(1,1) NOT NULL ,
 MaNV INT,
 MaKH INT NOT NULL,
 SoLuong INT,
 NgayLapHoaDon DATE ,
 ThanhTien INT,
 TinhTrangThanhToan bit,
 GhiChu NVARCHAR(100)
 )
 GO
 
 ----------------KHÁO CHÍNH------------
 ALTER TABLE dbo.PHONG ADD CONSTRAINT PK_MAPHONG PRIMARY KEY(MaPhong)
 ALTER TABLE dbo.NHANVIEN ADD CONSTRAINT PK_MANV PRIMARY KEY(MaNV)
 ALTER TABLE dbo.KHACHHANG ADD CONSTRAINT PK_MAKH PRIMARY KEY(MaKH)
 ALTER TABLE dbo.HOADON ADD CONSTRAINT PK_MAHD PRIMARY KEY(MaHoaDon)
 ALTER TABLE dbo.DICHVU ADD CONSTRAINT PK_MADV PRIMARY KEY(MaDichVu)
 ALTER TABLE dbo.LOAIPHONG ADD CONSTRAINT PK_MaLoaiPhong PRIMARY KEY(MaLoai)
 ALTER TABLE dbo.VATDUNG ADD CONSTRAINT PK_MAVD PRIMARY KEY(MaVatDung)
 ALTER TABLE dbo.SuDungDichVu ADD CONSTRAINT PK_SuDungDichVu PRIMARY KEY(MaHoaDon,MaDichVu)
 ALTER TABLE dbo.THUEPHONG ADD CONSTRAINT PK_MAThuePhong PRIMARY KEY(MaHoaDon,MaPhong)
 GO
 ----KHÓA NGOẠI--------

alter table dbo.PHONG add constraint fk_Phong_LoaiPhong foreign key(MaLoai) references dbo.LOAIPHONG(MaLoai) 
alter table dbo.VATDUNG add constraint fk_Phong_VatDung foreign key(MaPhong) references dbo.PHONG(MaPhong)
alter table dbo.THUEPHONG add constraint fk_THUEPHONG_Phong foreign key(MaPhong) references dbo.PHONG(MaPhong) 
alter table dbo.THUEPHONG add constraint fk_ThuePhong_HoaDon foreign key(MaHoaDon) references dbo.HOADON(MaHoaDon)  
alter table dbo.SuDungDichVu add constraint fk_SDDichVu_DichVu foreign key(MaDichVu) references dbo.DICHVU(MaDichVu) 
alter table dbo.HOADON add constraint fk_HoaDon_Khach foreign key(MaKH) references dbo.KHACHHANG(MaKH)  
alter table dbo.SuDungDichVu add constraint fk_SDDichVu_Hoadon foreign key(MaHoaDon) references dbo.HOADON(MaHoaDon) 
alter table dbo.HOADON add constraint fk_HoaDon_NhanVien foreign key(MaNV) references dbo.NhanVien(MaNV) 

INSERT [dbo].[DICHVU] ( [TENDV], [GiaDichVu]) VALUES ( N'Buffe', 50000)
INSERT [dbo].[DICHVU] ( [TENDV], [GiaDichVu]) VALUES ( N'Coca', 50000)
INSERT [dbo].[DICHVU] ( [TENDV], [GiaDichVu]) VALUES (N'Massage', 50000)
INSERT [dbo].[DICHVU] ( [TENDV], [GiaDichVu]) VALUES ( N'Bể Bơi', 150000)

INSERT [dbo].[KHACHHANG] ( [TenKH], [SDT]) VALUES (N'Hoàng Văn Việt 1', N'123')
INSERT [dbo].[KHACHHANG] ( [TenKH], [SDT]) VALUES ( N'Hoàng Văn Việt 2', N'124')
INSERT [dbo].[KHACHHANG] ( [TenKH], [SDT]) VALUES ( N'Hoàng Văn Việt 3', N'125')

INSERT [dbo].[LOAIPHONG] ( [TenLoai], [GiaThue], [GhiChu]) VALUES ( N'Thường', 230000, NULL)
INSERT [dbo].[LOAIPHONG] ( [TenLoai], [GiaThue], [GhiChu]) VALUES ( N'VIP', 430000, NULL)


INSERT [dbo].[NHANVIEN] ( [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [SDT]) VALUES ( N'giang', N'123', N'việt hoàng 1', CAST(N'1999-08-22' AS Date), N'nam', N'0359999573')
INSERT [dbo].[NHANVIEN] ( [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [SDT]) VALUES ( N'admin', N'123', N'việt hoàng 2', CAST(N'1999-08-22' AS Date), N'nam', N'0359999532')

INSERT [dbo].[PHONG] ( [TenPhong], [MaLoai], [TrangThai]) VALUES ( N'P101', 1, 1)
INSERT [dbo].[PHONG] ( [TenPhong], [MaLoai], [TrangThai]) VALUES ( N'P102', 2, 1)
INSERT [dbo].[PHONG] ( [TenPhong], [MaLoai], [TrangThai]) VALUES ( N'P103', 1, 1)

INSERT [dbo].[VATDUNG] ([TenVatDung], [TinhTrang], [GiaVatDung], [MaPhong]) VALUES ( N'Dao', N'tốt', 13000, 1)
INSERT [dbo].[VATDUNG] ( [TenVatDung], [TinhTrang], [GiaVatDung], [MaPhong]) VALUES ( N'TiVi', N'hỏng', 43000, 1)
INSERT [dbo].[VATDUNG] ( [TenVatDung], [TinhTrang], [GiaVatDung], [MaPhong]) VALUES ( N'Đèn ngủ', N'tốt', 43000, 1)
INSERT [dbo].[VATDUNG] ([TenVatDung], [TinhTrang], [GiaVatDung], [MaPhong]) VALUES ( N'Dao', N'tốt', 13000, 2)
INSERT [dbo].[VATDUNG] ( [TenVatDung], [TinhTrang], [GiaVatDung], [MaPhong]) VALUES ( N'TiVi', N'tốt', 43000, 2)
INSERT [dbo].[VATDUNG] ( [TenVatDung], [TinhTrang], [GiaVatDung], [MaPhong]) VALUES (N'Đèn ngủ', N'tốt', 43000, 2)
INSERT [dbo].[VATDUNG] ( [TenVatDung], [TinhTrang], [GiaVatDung], [MaPhong]) VALUES ( N'Dao', N'tốt', 13000, 3)
INSERT [dbo].[VATDUNG] ([TenVatDung], [TinhTrang], [GiaVatDung], [MaPhong]) VALUES ( N'TiVi', N'tốt', 43000, 3)
INSERT [dbo].[VATDUNG] ( [TenVatDung], [TinhTrang], [GiaVatDung], [MaPhong]) VALUES ( N'Đèn ngủ', N'tốt', 43000, 3)

INSERT [dbo].[HOADON] ( [MaNV], [SoLuong], [NgayLapHoaDon], [ThanhTien], [GhiChu], [TinhTrangThanhToan],[MaKH]) VALUES ( 2, 1, CAST(N'2020-02-02' AS Date), 500000, NULL, 0,1)
INSERT [dbo].[HOADON] ( [MaNV], [SoLuong], [NgayLapHoaDon], [ThanhTien], [GhiChu], [TinhTrangThanhToan],[MaKH]) VALUES (2, 1, CAST(N'2020-02-02' AS Date), 500000, NULL, 0,2)
INSERT [dbo].[HOADON] ( [MaNV], [SoLuong], [NgayLapHoaDon], [ThanhTien], [GhiChu], [TinhTrangThanhToan],[MaKH]) VALUES ( 2, 1, CAST(N'2020-02-02' AS Date), 500000, NULL, 1,3)

INSERT [dbo].[SuDungDichVu] ([MaDichVu], [MaHoaDon],[SoLuong]) VALUES (1, 1,2)
INSERT [dbo].[SuDungDichVu] ([MaDichVu], [MaHoaDon],[SoLuong]) VALUES (2, 1,1)
INSERT [dbo].[SuDungDichVu] ([MaDichVu], [MaHoaDon],[SoLuong]) VALUES (3, 2,3)

INSERT [dbo].[THUEPHONG] ([MaPhong], [MaHoaDon], [NgayBatDauThue], [NgayTraPhong], [DatCoc],[SoDem]) VALUES (1,  1, CAST(N'2020-02-02' AS Date), CAST(N'2020-02-03' AS Date), 50000,1)
INSERT [dbo].[THUEPHONG] ([MaPhong], [MaHoaDon], [NgayBatDauThue], [NgayTraPhong], [DatCoc],[SoDem]) VALUES (2,  1, CAST(N'2020-02-02' AS Date), CAST(N'2020-02-03' AS Date), 50000,1)
INSERT [dbo].[THUEPHONG] ([MaPhong], [MaHoaDon], [NgayBatDauThue], [NgayTraPhong], [DatCoc],[SoDem]) VALUES (3,  2, CAST(N'2020-02-02' AS Date), CAST(N'2020-02-03' AS Date), 50000,1)
INSERT [dbo].[THUEPHONG] ([MaPhong], [MaHoaDon], [NgayBatDauThue], [NgayTraPhong], [DatCoc],[SoDem]) VALUES (2,  3, CAST(N'2020-02-02' AS Date), CAST(N'2020-02-03' AS Date), 50000,1)


