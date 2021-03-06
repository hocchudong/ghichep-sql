--Câu 1a) Tạo một khung nhìn có tên V_Doxe để thấy được thông tin của tất cả các lần đỗ xe 
--có thời gian đỗ xe lớn hơn 120 phút,
--trong cùng một ngày của các hãng xe thuộc loại xe có tên là “Xe bốn bánh”.
CREATE VIEW V_Doxe
AS
	SELECT DOXE.*
	FROM DOXE INNER JOIN LOAIXE ON DOXE.MaLX = LOAIXE.MaLX
	WHERE DATEDIFF(MINUTE, TGVao, TGRa) > 120
	AND DATEDIFF(DAY, TGVao, TGRa) = 0
	AND LOAIXE.TenLoaiXe = N'Xe bốn bánh'
	
	
--Câu 1b) Thông qua khung nhìn V_Doxe, thực hiện việc cập nhật thời gian vào 
--đối với những xe có thời gian vào lúc 7:30 thành 8:00





--Câu 2a) Stored  Procedure Sp_1: 
--Dùng để xóa thông tin của những nhân viên có mã nhân viên 
--được truyền vào như một tham số
CREATE PROC Sp_1 @manv char(5)
AS
BEGIN
	IF EXISTS (SELECT MaNV FROM NHANVIEN WHERE MaNV = @manv)
		PRINT 'Khong xoa duoc vi khoa ngoai'	
	ELSE 
		DELETE FROM NHANVIEN WHERE MaNV = @manv
END	

--Câu 2b) Stored  Procedure Sp_2: 
--Dùng để bổ sung thêm bảng ghi mới vào DOXE 
--(Sp_2 phải thực hiện kiểm tra tính hợp lệ của dữ liệu được bổ sung 
--và không trùng khóa chính  và đảm bảo toàn vẹn tham chiếu đến các bảng có liên quan)

CREATE PROC Sp_2 @madx varchar(10), @malx varchar(10),@manv varchar(10), @maphi varchar(10), @bienso varchar(10),
@tgvao time, @tgra time
AS
BEGIN
	???
END	


--Câu 3a) Trigger_1: 
--Thực hiện đăng ký mới một lượt đỗ xe thì hiển thị tổng số lượt đỗ xe của 
--tất cả các xe cùng loại với xe cần đỗ.
CREATE TRIGGER Trigger_1
ON DOXE
FOR INSERT
AS
BEGIN
	DECLARE @malx char(4)
	DECLARE @sl int
	SELECT @malx = MaLX FROM INSERTED
	
	SELECT @sl = COUNT(*) FROM DOXE WHERE MaLX = @malx
	PRINT 'Tong so luot do xe cua loai xe vua nhap la ' + CAST(@sl AS varchar(5))
	
END


--Câu 3b)Trigger_2: 
--Khi cập nhật thời gian vào và thời gian ra của một lượt đỗ xe,
--kiểm tra xem thời gian cập nhật đó có phù hợp hay không (thời gian ra phải lớn hơn thời gian vào ít nhất 15 phút).Nếu dữ liệu hợp lệ thì cho phép cập nhật.Nếu không thì phải hiển thiị thông báo “Thời gian ra phải lớn hơn thời gian vào ít nhất 15 phút”.(1đ)
CREATE TRIGGER Trigger_2
ON DOXE
FOR UPDATE
AS
BEGIN
	DECLARE @tgvao smalldatetime
	DECLARE @tgra smalldatetime
	
	
	IF(UPDATE(TGVao) OR UPDATE(TGRa))
	BEGIN
		SELECT @tgvao = TGVao FROM INSERTED
		SELECT @tgra = TGRa FROM INSERTED
		
		IF(DATEDIFF(MINUTE,@tgvao,@tgra) <=	15)	
		BEGIN
			PRINT 'Cap nhat sai'
			ROLLBACK TRANSACTION
		END	
	END
END
