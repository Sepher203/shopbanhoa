create database QuanLyShopHoa
go
use QuanLyShopHoa
go
create table DanhmucHoa
(
	MaDM int primary key,
	TenDM nvarchar(25),
	MoTa nvarchar(50)
)
go
create table Hoa
(
	MaH int primary key,
	Ten nvarchar(25),
	Donvitinh nvarchar(10),
	Dongia int,
	Soluong int,
	MoTa nvarchar(100),
	Hinhanh nvarchar(100),
	MaDM int FOREIGN KEY REFERENCES DanhmucHoa(MaDM)
)

go
INSERT INTO DanhmucHoa (MaDM, TenDM, MoTa)
VALUES ('1', N'Hoa Hồng', N'rất đẹp'),
		('2', N'Hoa Lay Ơn', N'rất đẹp2'),
		('3', N'Hoa Đồng Tiền', N'rất đẹp3'),
		('4', N'Hoa Phong Lan', N'rất đẹp4')
go
INSERT INTO Hoa (MaH, Ten, Donvitinh,Dongia,Soluong,MoTa,Hinhanh,MaDM)
VALUES ('1', N'Hoa Hồng xanh', N'VNĐ',N'2000000',10,N'Xuất xứ Việt Nam,cánh nhung,phục vụ cho tiệc cưới','hoahongxanh.jpg','1'),
		('2', N'Hoa Hồng trắng', N'VNĐ',N'3000000',9,N'Xuất xứ Việt Nam, cánh nhung, phục vụ cho tiệc cưới','hoahongtrang.jpg','1'),
		('3', N'Hoa hồng', N'VNĐ',N'1000000',11,N'Xuất xứ Việt Nam,cánh nhung,phục vụ cho tiệc cưới','hoahong.jpg','1')
go
create proc [dbo].[psGetTableHoa] (@MaH int)
AS
BEGIN TRAN
IF(@MaH IS NULL)
SELECT * FROM Hoa
ELSE
SELECT * FROM Hoa WHERE MaH=@MaH
IF(@@ERROR<>0)
	ROLLBACK TRAN
ELSE
COMMIT TRAN

go

create proc [dbo].[psGetTableDanhmucHoa] (@MaDM int)
AS
BEGin tran
if (@MaDM is null) 
	SELECT ROW_NUMBER() OVER(ORDER BY TenDM) as autoincrement,
	MaDM,TenDM,MoTa From DanhmucHoa
	else
	select * from DanhmucHoa where MaDM = @MaDM
	if(@@ERROR<>0)
	rollback tran
	else
	commit tran

select * from DanhmucHoa
select * from Hoa