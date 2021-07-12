
CREATE TRIGGER trg_DatHang ON tbl_chitietdonhang AFTER INSERT AS 
BEGIN
	UPDATE tbl_sanpham
	SET c_soluong = tbl_sanpham.c_soluong - (
		SELECT c_soluong
		FROM inserted
	)
	where id_sanpham = (select fk_sanpham from inserted)
END
drop trigger trg_DatHang
GO
/* cập nhật hàng trong kho sau khi cập nhật đặt hàng */
CREATE TRIGGER trg_CapNhatDatHang on tbl_chitietdonhang after update AS
BEGIN
   UPDATE tbl_sanpham SET c_soluong = tbl_sanpham.c_soluong -
	   (SELECT c_soluong FROM inserted WHERE fk_sanpham = tbl_sanpham.id_sanpham) +
	   (SELECT c_soluong FROM deleted WHERE fk_sanpham = tbl_sanpham.id_sanpham)
   FROM tbl_sanpham 
   JOIN deleted ON tbl_sanpham.id_sanpham = deleted.fk_sanpham
end
drop trigger trg_CapNhatDatHang
GO

/* cập nhật hàng trong kho sau khi hủy đặt hàng */
create TRIGGER trg_HuyDatHang ON tbl_chitietdonhang FOR DELETE AS 
BEGIN
	UPDATE tbl_sanpham
	SET c_soluong = tbl_sanpham.c_soluong + (SELECT c_soluong FROM deleted WHERE fk_sanpham = tbl_sanpham.id_sanpham)
	FROM tbl_sanpham 
	JOIN deleted ON tbl_sanpham.id_sanpham = deleted.fk_sanpham
END
drop trigger trg_HuyDatHang
GO