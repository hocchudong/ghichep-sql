CREATE TABLE NHACUNGCAP
(
	MaNhaCC char(6) PRIMARY KEY,
	TenNhaCC nvarchar(50),
	DiaChi nvarchar(15),
	SoDT varchar(15),
	MaSoThue varchar(10)
)

CREATE TABLE LOAIDICHVU
(
	MaLoaiDV char(4) PRIMARY KEY,
	TenLoaiDV nvarchar(50)
)

CREATE TABLE MUCPHI
(
	MaMP char(4) PRIMARY KEY,
	DonGia numeric(18,0),
	MoTa nvarchar(30)
)

CREATE TABLE DONGXE
(
	DongXe varchar(15) PRIMARY KEY,
	HangXe varchar(15),
	SoChoNgoi int
)

CREATE TABLE DANGKYCUNGCAP
(
	MaDKCC char(5) PRIMARY KEY,
	MaNhaCC char(6),
	MaLoaiDV char(4),
	DongXe varchar(15),
	MaMP char(4),
	NgayBatDauCungCap date,
	NgayKetThucCungCap date,
	SoLuongXeDangKy int,
	CONSTRAINT FK_DANGKYCUNGCAP_NHACUNGCAP FOREIGN KEY (MaNhaCC) REFERENCES NHACUNGCAP(MaNhaCC),
	CONSTRAINT FK_DANGKYCUNGCAP_LOAIDICHVU FOREIGN KEY (MaLoaiDV) REFERENCES LOAIDICHVU(MaLoaiDV),
	CONSTRAINT FK_DANGKYCUNGCAP_DONGXE FOREIGN KEY (DongXe) REFERENCES DONGXE(DongXe),
	CONSTRAINT FK_DANGKYCUNGCAP_MUCPHI FOREIGN KEY (MaMP) REFERENCES MUCPHI(MaMP)
)

INSERT INTO NHACUNGCAP VALUES 
('NCC001',N'Cty TNHH Toàn Pháp',N'Hải Châu','05113999888','568941'),
('NCC002',N'Cty cổ phần Đông Du',N'Liên Chiểu','05113999889','456789'),
('NCC003',N'Ông Nguyễn Văn A',N'Hòa Thuận','05113999890','321456'),
('NCC004',N'Cty cổ phần Toàn Cầu Xanh',N'Hải Châu','05113658945','513364'),
('NCC005',N'Cty TNHH AMA',N'Thanh Khê','05113875466','546546'),
('NCC006',N'Bà Trần Thị Bích Vân',N'Liên Chiểu','05113587469','524545'),
('NCC007',N'Cty TNHH Phan Thành',N'Thanh Khê','05113987456','113021'),
('NCC008',N'Ông Phan Đình Nam',N'Hòa Thuận','05113532446','234562'),
('NCC009',N'Tập đoàn Đông Nam Á',N'Liên Chiểu','05113987121','534235'),
('NCC010',N'Cty Cổ phần Rạng Đông',N'Liên Chiểu','05113569654','432465')

INSERT INTO LOAIDICHVU VALUES 
('DV01',N'Dịch vụ xe taxi'),
('DV02',N'Dịch vụ xe buýt công cộng theo tuyến cố định'),
('DV03',N'Dịch vụ xe cho thuê theo hợp đồng')

INSERT INTO MUCPHI VALUES 
('MP01',10000, N'Áp dụng từ 1/2015'),
('MP02',15000, N'Áp dụng từ 2/2015'),
('MP03',20000, N'Áp dụng từ 1/2010'),
('MP04',25000, N'Áp dụng từ 2/2011')


INSERT INTO DONGXE VALUES 
('Hiace','Toyota', 16),
('Vios','Toyota', 5),
('Escape','Ford', 5),
('Cerato','KIA', 7),
('Forte','KIA', 5),
('Starex','Huyndai', 7),
('Grand-i10','Huyndai', 7)


INSERT INTO DANGKYCUNGCAP VALUES 
('DK001','NCC001','DV01','Hiace','MP01','2015-11-20','2016-11-20',4),
('DK002','NCC002','DV02','Vios','MP02','2015-11-20','2017-11-20',3),
('DK003','NCC003','DV03','Escape','MP03','2017-11-20','2018-11-20',5),
('DK004','NCC005','DV01','Cerato','MP04','2015-11-20','2019-11-20',7),
('DK005','NCC002','DV02','Forte','MP03','2019-11-20','2020-11-20',1),
('DK006','NCC004','DV03','Starex','MP04','2016-11-10','2021-11-20',2),
('DK007','NCC005','DV01','Cerato','MP03','2015-11-30','2016-01-25',8),
('DK008','NCC006','DV01','Vios','MP02','2016-02-28','2016-08-15',9),
('DK009','NCC005','DV03','Grand-i10','MP02','2016-04-27','2017-04-30',10),
('DK010','NCC006','DV01','Forte','MP02','2015-11-21','2016-02-22',4),
('DK011','NCC007','DV01','Forte','MP01','2016-12-25','2017-02-20',5),
('DK012','NCC007','DV03','Cerato','MP01','2016-04-14','2017-12-20',6),
('DK013','NCC003','DV02','Cerato','MP01','2015-12-21','2016-12-21',8),
('DK014','NCC008','DV02','Cerato','MP01','2016-05-20','2016-12-30',1),
('DK015','NCC003','DV01','Hiace','MP02','2018-04-24','2019-11-20',6),
('DK016','NCC001','DV03','Grand-i10','MP02','2016-06-22','2016-12-21',8),
('DK017','NCC002','DV03','Cerato','MP03','2016-09-30','2019-09-30',4),
('DK018','NCC008','DV03','Escape','MP04','2017-12-13','2018-09-30',2),
('DK019','NCC003','DV03','Escape','MP03','2016-01-24','2016-12-30',8),
('DK020','NCC002','DV03','Cerato','MP04','2016-05-03','2017-10-21',7),
('DK021','NCC006','DV01','Forte','MP02','2015-01-30','2016-12-30',9),
('DK022','NCC002','DV02','Cerato','MP04','2016-07-25','2017-12-30',6),
('DK023','NCC002','DV01','Forte','MP03','2017-11-30','2018-05-20',5),
('DK024','NCC003','DV03','Forte','MP04','2017-12-23','2019-11-30',8),
('DK025','NCC003','DV03','Hiace','MP02','2016-08-24','2017-10-25',1)

--Câu 3: Liệt kê những dòng xe có số chỗ ngồi trên 5 chỗ
SELECT * FROM DONGXE WHERE SoChoNgoi > 5

--Câu 4: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp 
--những dòng xe thuộc hãng xe "Toyota" với mức phí có đơn giá là 15.000 VNĐ/km 
--hoặc những dòng xe thuộc hãng xe "KIA" với mức phí có đơn giá là 20.000 VNĐ/km

SELECT DISTINCT N.* 
FROM DONGXE D INNER JOIN DANGKYCUNGCAP DC ON D.DongXe = DC.DongXe
INNER JOIN NHACUNGCAP N ON N.MaNhaCC = DC.MaNhaCC
INNER JOIN MUCPHI M ON M.MaMP = DC.MaMP
WHERE (D.HangXe = 'Toyota' AND M.DonGia = 15000)
OR (D.HangXe = 'Kia' AND M.DonGia = 20000)


--Câu 5: Liệt kê thông tin của các dòng xe thuộc hãng xe có tên bắt đầu là ký tự "T" 
--và có độ dài là 5 ký tự
SELECT * FROM DONGXE
WHERE HangXe LIKE 'T%' AND LEN(HangXe) = 5


--Câu 6: Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung cấp
-- và giảm dần theo mã số thuế 
SELECT * FROM NHACUNGCAP
ORDER BY TenNhaCC ASC, MaSoThue DESC


--Câu 7: Đếm số lần đăng ký cung cấp phương tiện tương ứng cho từng nhà cung cấp 
--với yêu cầu chỉ đếm cho những nhà cung cấp thực hiện đăng ký cung cấp 
--có ngày bắt đầu cung cấp là "20/11/2015"
SELECT MaNhaCC, COUNT(MaDKCC) AS SoLanDangKy
FROM DANGKYCUNGCAP
WHERE NgayBatDauCungCap = '2015-11-20'
GROUP BY MaNhaCC


--Câu 8: Liệt kê tên của toàn bộ các hãng xe có trong cơ sở dữ liệu 
--với yêu cầu mỗi hãng xe chỉ được liệt kê một lần
SELECT DISTINCT HangXe
FROM DONGXE


--Câu 9: Liệt kê MaDKCC, TenLoaiDV, TenNhaCC, DonGia, DongXe, HangXe, NgayBatDauCC, NgayKetThucCC, SoLuongXeDangKy 
--của tất cả các lần đăng ký cung cấp phương tiện
SELECT DK.MaDKCC, DV.TenLoaiDV, NCC.TenNhaCC, MP.DonGia, DX.DongXe, DX.HangXe, DK.NgayBatDauCungCap, DK.NgayKetThucCungCap, DK.SoLuongXeDangKy
FROM DANGKYCUNGCAP DK INNER JOIN LOAIDICHVU DV ON DK.MaLoaiDV = DV.MaLoaiDV
INNER JOIN NHACUNGCAP NCC ON DK.MaNhaCC = NCC.MaNhaCC
INNER JOIN MUCPHI MP ON DK.MaMP = MP.MaMP
INNER JOIN DONGXE DX ON DK.DongXe = DX.DongXe


--Câu 10: Liệt kê MaDKCC, MaNhaCC, TenNhaCC, DiaChi, MaSoThue, TenLoaiDV, 
--DonGia, HangXe, NgayBatDauCC, NgayKetThucCC của tất cả các lần đăng ký cung cấp phương tiện 
--với yêu cầu những nhà cung cấp nào chưa từng thực hiện đăng ký cung cấp phương tiện 
--thì cũng liệt kê thông tin những nhà cung cấp đó ra

SELECT DK.MaDKCC, NCC.MaNhaCC, NCC.TenNhaCC, NCC.DiaChi, NCC.MaSoThue, DV.TenLoaiDV
FROM NHACUNGCAP NCC LEFT JOIN DANGKYCUNGCAP DK ON DK.MaNhaCC = NCC.MaNhaCC
LEFT JOIN LOAIDICHVU DV ON DK.MaLoaiDV = DV.MaLoaiDV


--Câu 11: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện 
--thuộc dòng xe "Hiace" hoặc từng đăng ký cung cấp phương tiện thuộc dòng xe "Cerato"
SELECT DISTINCT NCC.*
FROM DANGKYCUNGCAP DK INNER JOIN DONGXE DX ON DK.DongXe = DX.DongXe
INNER JOIN NHACUNGCAP NCC ON DK.MaNhaCC = NCC.MaNhaCC
WHERE DX.DongXe IN ('Hiace','Cerato')


--Câu 12: Liệt kê thông tin của các nhà cung cấp chưa từng thực hiện đăng ký cung cấp phương tiện lần nào cả
--Cách 1:
SELECT * FROM NHACUNGCAP
WHERE MaNhaCC NOT IN (SELECT MaNhaCC FROM DANGKYCUNGCAP)

--Cách 2:
SELECT * FROM NHACUNGCAP NCC
WHERE NOT EXISTS (SELECT MaNhaCC FROM DANGKYCUNGCAP WHERE MaNhaCC = NCC.MaNhaCC)

--Câu 13: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện thuộc dòng xe "Hiace"
-- và chưa từng đăng ký cung cấp phương tiện thuộc dòng xe "Cerato"
SELECT DISTINCT NCC.*
FROM DANGKYCUNGCAP DK INNER JOIN DONGXE DX ON DK.DongXe = DX.DongXe
INNER JOIN NHACUNGCAP NCC ON DK.MaNhaCC = NCC.MaNhaCC
WHERE DX.DongXe = 'Hiace' 
AND DK.MaDKCC NOT IN (SELECT MaDKCC FROM DANGKYCUNGCAP WHERE DongXe = 'Cerato')


--Câu 14: Liệt kê thông tin của những dòng xe chưa được nhà cung cấp nào đăng ký cho thuê vào năm "2015" 
--nhưng đã từng được đăng ký cho thuê vào năm "2016"
SELECT * FROM DONGXE
WHERE DongXe NOT IN (SELECT DongXe FROM DANGKYCUNGCAP WHERE YEAR(NgayBatDauCungCap) = 2015)
AND  DongXe IN (SELECT DongXe FROM DANGKYCUNGCAP WHERE YEAR(NgayBatDauCungCap) = 2016)


--Câu 15: Hiển thị thông tin của những dòng xe có số lần được đăng ký cho thuê nhiều nhất 
--tính từ đầu năm 2016 đến hết năm 2019
SELECT TOP 1 DK.DongXe, DX.HangXe, DX.SoChoNgoi, COUNT(DK.MaDKCC) AS SoLanDK 
FROM DONGXE DX INNER JOIN DANGKYCUNGCAP DK ON DX.DongXe = DK.DongXe
WHERE YEAR(DK.NgayBatDauCungCap) BETWEEN 2016 AND 2019
GROUP BY DK.DongXe, DX.HangXe, DX.SoChoNgoi
ORDER BY SoLanDK DESC



--Câu 16: Tính tổng số lượng xe đã được đăng ký cho thuê tương ứng với từng dòng xe 
--với yêu cầu chỉ thực hiện tính đối với những lần đăng ký cho thuê có mức phí 
--với đơn giá là 20.000 VNĐ trên 1 km
SELECT DK.DongXe, SUM(DK.SoLuongXeDangKy) AS SoLuongXe
FROM DANGKYCUNGCAP DK INNER JOIN MUCPHI MP ON DK.MaMP = MP.MaMP
WHERE MP.DonGia = 20000
GROUP BY DK.DongXe



--Câu 17: Liệt kê MaNCC, SoLuongXeDangKy với yêu cầu chỉ liệt kê những nhà cung cấp có địa chỉ là "Hai Chau" 
--và chỉ mới thực hiện đăng ký cho thuê một lần duy nhất, kết quả được sắp xếp tăng dần theo số lượng xe đăng ký
SELECT MaNhaCC, SoLuongXeDangKy
FROM DANGKYCUNGCAP
WHERE MaNhaCC IN (
		SELECT DK.MaNhaCC
		FROM DANGKYCUNGCAP DK INNER JOIN NHACUNGCAP NCC ON DK.MaNhaCC = NCC.MaNhaCC
		WHERE NCC.DiaChi = N'Hải Châu'
		GROUP BY DK.MaNhaCC
		HAVING COUNT(DK.MaDKCC) = 1)


--Câu 18: Cập nhật cột SoLuongXeDangKy trong bảng DANGKYCUNGCAP thành giá trị 20 
--đối với những dòng xe thuộc hãng "Toyota" và có NgayKetThucCungCap trước ngày 30/12/2016 
UPDATE DANGKYCUNGCAP
SET SoLuongXeDangKy = 20
WHERE DongXe IN (SELECT DongXe FROM DONGXE WHERE HangXe = 'Toyota')
AND NgayKetThucCungCap < '2016-12-30'

--Câu 19: Cập nhật cột MoTa trong bảng MUCPHI thành giá trị "Được sử dụng nhiều" 
--cho những mức phí được sử dụng để đăng ký cung cấp cho thuê phương tiện từ 5 lần trở lên trong năm 2016
UPDATE MUCPHI
SET MoTa = N'Được sử dụng nhiều'
WHERE MaMP IN
(
SELECT MaMP FROM DANGKYCUNGCAP
WHERE YEAR(NgayBatDauCungCap) = 2016
GROUP BY MaMP
HAVING COUNT(MaDKCC) >= 5
)

--Câu 20: Xóa những lần đăng ký cung cấp cho thuê phương tiện 
--có ngày bắt đầu cung cấp sau ngày 10/11/2015 và đăng ký cho thuê dòng xe "Vios"
DELETE FROM DANGKYCUNGCAP
WHERE NgayBatDauCungCap > '2015-11-10' AND DongXe = 'Vios'

GO

-----PHẦN NÂNG CAO-----
--Câu 1a: Tạo một khung nhìn có tên là V_NhaCungCap để lấy được thông tin của tất cả nhà cung cấp 
--có địa chỉ là "Lien Chieu" và đã từng đăng ký cung cấp phương tiện có ngày bắt đầu đăng ký là "20/11/2015". 
CREATE VIEW V_NhaCungCap
AS
SELECT NCC.* 
FROM NHACUNGCAP NCC INNER JOIN DANGKYCUNGCAP DK
ON NCC.MaNhaCC = DK.MaNhaCC
WHERE NCC.DiaChi = N'Liên Chiểu'
AND DK.NgayBatDauCungCap = '2015-11-20'
GO

--Câu 1b: Thông qua khung nhìn V_NhaCungCap thực hiện cập nhật địa chỉ thành "Thanh Khe" 
--đối với tất cả các nhà cung cấp được nhìn thấy bởi khung nhìn này
UPDATE V_NhaCungCap SET DiaChi = N'Thanh Khê'
GO


--Câu 2a: Stored Procedure Sp_1: Dùng để xóa thông tin của một dòng xe nào đó 
--(tức là xóa 1 bản ghi trong bảng DONGXE) với tên dòng xe được truyền vào như một tham số của Stored Procedure
CREATE PROCEDURE Sp_1 @DongXe varchar(15)
AS
BEGIN
	DELETE FROM DONGXE
	WHERE DongXe = @DongXe
END
GO

--Câu 2b: Stored Procedure Sp_2: Dùng để bổ sung thêm bản ghi mới vào bảng DANGKYCUNGCAP 
--với yêu cầu Sp_2 phải thực hiện kiểm tra tính hợp lệ của dữ liệu được bổ sung, 
--với nguyên tắc là không được trùng khóa chính và đảm bảo toàn vẹn dữ liệu 
--tham chiếu đến các bảng có liên quan
CREATE PROCEDURE Sp_2 @madkcc char(5), @manhacc char(6), @maloaidv char(4), @dongxe varchar(15), @mamp char(4), @ngaybatdaucc date, @ngayketthuccc date, @soluongxedk int
AS
BEGIN
	--kiem tra trung khoa chinh
	IF EXISTS (SELECT * FROM DANGKYCUNGCAP WHERE MaDKCC = @madkcc)
	BEGIN
		PRINT N'Trùng khóa chính'
		RETURN
	END
	--kiem tra su ton tai nha cung cap
	IF NOT EXISTS (SELECT * FROM NHACUNGCAP WHERE MaNhaCC = @manhacc)
	BEGIN
		PRINT @manhacc + N' chưa tồn tại trong bảng NHACUNGCAP'
		RETURN
	END
	--kiem tra su ton tai ma loai dich vu
	IF NOT EXISTS (SELECT * FROM LOAIDICHVU WHERE MaLoaiDV = @maloaidv)
	BEGIN
		PRINT @maloaidv + N' chưa tồn tại trong bảng LOAIDICHVU'
		RETURN
	END	
	--kiem tra su ton tai dong xe
	IF NOT EXISTS (SELECT * FROM DONGXE WHERE DongXe = @dongxe)
	BEGIN
		PRINT @dongxe + N' chưa tồn tại trong bảng DONGXE'
		RETURN
	END	
	
	--kiem tra su ton tai muc phi
	IF NOT EXISTS (SELECT * FROM MUCPHI WHERE MaMP = @mamp)
	BEGIN
		PRINT @mamp + N' chưa tồn tại trong bảng MUCPHI'
		RETURN
	END	
	
	INSERT INTO DANGKYCUNGCAP VALUES
	(@madkcc,@manhacc,@maloaidv,@dongxe,@mamp,@ngaybatdaucc,@ngayketthuccc,@soluongxedk)
END
GO


--Câu 3a: Trigger_1: Khi thực hiện xóa bản ghi trong bảng DANGKYCUNGCAP 
--thì hiển thị tổng số lượng bản ghi còn lại có trong bảng DANGKYCUNGCAP 
--ra giao diện console của database server
CREATE TRIGGER Trigger_1
ON DANGKYCUNGCAP
FOR DELETE
AS
BEGIN
	DECLARE @tong int
	SELECT @tong = COUNT(*) FROM DANGKYCUNGCAP
	PRINT N'Tổng số bản ghi còn lại của bảng DANGKYCUNGCAP la: '+ CAST(@tong AS varchar(5))
END
GO

--Câu 3b: Trigger_2: Khi cập nhật giá trị của cột NgayKetThucCungCap, 
--cần kiểm tra xem thời gian cập nhật có phù hợp hay không, 
--với quy tắc như sau: Khoảng thời gian tính từ ngày bắt đầu cho thuê đến hết ngày kết thúc cho thuê 
--phải nhỏ hơn 4 năm. Nếu dữ liệu hợp lệ thì cho phép cập nhật, 
--nếu không thì sẽ hiển thị thông báo 
--"Khoảng thời gian đăng ký cung cấp phương tiện tính từ ngày bắt đầu cung cấp đến hết ngày kết thúc cung cấp 
--phải nhỏ hơn 4 năm" ra giao diện console của database server
CREATE TRIGGER Trigger_2
ON DANGKYCUNGCAP
FOR UPDATE
AS
BEGIN
	IF UPDATE(NgayKetThucCungCap)
	BEGIN
		DECLARE @ngaybatdau date, @ngayketthuc date
		SELECT @ngaybatdau = NgayBatDauCungCap, @ngayketthuc = NgayKetThucCungCap
		FROM inserted 
		
		IF(DATEDIFF(DAY,@ngaybatdau,@ngayketthuc) > 4*365)
		BEGIN
			PRINT N'Khoảng thời gian đăng ký cung cấp phương tiện tính từ ngày bắt đầu cung cấp đến hết ngày kết thúc cung cấp phải nhỏ hơn 4 năm'
			ROLLBACK TRANSACTION
		END	
	END
END
GO


--Câu 4a: User-defined function func1: 
--Đếm tổng số lượng xe đã được đăng ký cho thuê với mức phí là 10.000 VNĐ/km.
CREATE FUNCTION func1()
RETURNS int
AS
BEGIN
	DECLARE @tong int
	SELECT @tong = SUM(SoLuongXeDangKy) 
	FROM DANGKYCUNGCAP
	WHERE MaMP = (SELECT MaMP FROM MUCPHI WHERE DonGia = 10000)
	RETURN @tong
END
GO

--Câu 4b: User-defined function func2: 
--Tính khoảng thời gian dài nhất 
--(kể từ lúc bắt đầu đăng ký cho thuê đến lúc kết thúc đăng ký cho thuê) 
--mà nhà cung cấp nào đó đã từng thực hiện đăng ký cho thuê xe. 
--(Lưu ý: Chỉ xét các khoảng thời gian dựa theo từng lần đăng ký cho thuê xe, 
--không xét trên toàn bộ các lần đăng ký). 
--Mã của nhà cung cấp được truyền vào như là một tham số của function này.

CREATE FUNCTION func2 (@mancc char(6))
RETURNS int
AS
BEGIN
	DECLARE @kq int
	SELECT @kq = MAX(DATEDIFF(day,NgayBatDauCungCap,NgayKetThucCungCap))
	FROM DANGKYCUNGCAP
	WHERE MaNhaCC = @mancc 
	RETURN @kq
END
GO


--Câu 5: Tạo Stored Procedure Sp_Xe để tìm những dòng xe đã được các nhà cung cấp (bất kỳ) 
--đăng ký cho thuê với loại hình dịch vụ là "Dịch vụ xe cho thuê theo hợp đồng" 
--từ đầu năm 2015 đến hết năm 2016 để xóa thông tin về những dòng xe đó 
--(tức là phải xóa những bản ghi trong bảng DONGXE có liên quan) 
--và xóa những lần đăng ký cung cấp cho thuê xe liên quan đến dòng xe đó 
--(tức là phải xóa những bản ghi trong bảng DANGKYCUNGCAP có liên quan). 

CREATE PROCEDURE Sp_Xe
AS
BEGIN
	--Tạo Table Xe_Tam lưu các dòng xe thỏa điều kiện
	CREATE TABLE Xe_Tam (DongXe varchar(15))
	INSERT INTO Xe_Tam 
		SELECT DK.DongXe
		FROM DANGKYCUNGCAP DK INNER JOIN LOAIDICHVU DV ON DK.MaLoaiDV = DV.MaLoaiDV
		WHERE DV.TenLoaiDV = N'Dịch vụ xe cho thuê theo hợp đồng'
		AND DK.NgayBatDauCungCap > '2015-01-01'
		AND DK.NgayKetThucCungCap < '2016-12-31'
	
	--Xóa những bản ghi trong bảng DANGKYCUNGCAP
	DELETE FROM DANGKYCUNGCAP
	WHERE DongXe IN (SELECT DongXe FROM Xe_Tam)
	
	--Xóa những bản ghi trong bảng DONGXE
	DELETE FROM DONGXE
	WHERE DongXe IN (SELECT DongXe FROM Xe_Tam)
	
	DROP TABLE Xe_Tam
	
END	




