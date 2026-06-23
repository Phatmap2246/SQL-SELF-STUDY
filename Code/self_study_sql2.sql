-- 1. TẠO DATABASE MỚI (Xóa cái cũ nếu lỡ có trùng tên)
USE master;
GO
IF DB_ID('QUANLY_SUKIEN') IS NOT NULL
    DROP DATABASE QUANLY_SUKIEN;
GO
CREATE DATABASE QUANLY_SUKIEN;
GO
USE QUANLY_SUKIEN;
GO

-- 2. TẠO BẢNG ĐỘI NGŨ BAN TỔ CHỨC
CREATE TABLE BAN_TO_CHUC (
    MaTV VARCHAR(10) PRIMARY KEY,
    TenTV NVARCHAR(50),
    BanPhuTrach NVARCHAR(50) 
);
GO

-- 3. TẠO BẢNG DANH SÁCH TÀI TRỢ
CREATE TABLE QUA_TAI_TRO (
    MaGD INT IDENTITY(1,1) PRIMARY KEY, -- Tự động tăng từ 1, khỏi mất công gõ tay
    MaTV VARCHAR(10) FOREIGN KEY REFERENCES BAN_TO_CHUC(MaTV),
    NgayNhan DATE,
    LoaiQua NVARCHAR(50),
    SoLuong INT,
    TriGia INT -- Tính theo đơn vị VNĐ
);
GO

-- 4. BƠM DỮ LIỆU SIÊU THỰC TẾ 
INSERT INTO BAN_TO_CHUC (MaTV, TenTV, BanPhuTrach) VALUES
('TV01', N'Nguyễn Đức Phát', N'Logistics'),
('TV02', N'Trần Thị B', N'Logistics'),
('TV03', N'Lê Văn C', N'Truyền thông'),
('TV04', N'Phạm Đại D', N'Chuyên môn');

INSERT INTO QUA_TAI_TRO (MaTV, NgayNhan, LoaiQua, SoLuong, TriGia) VALUES
('TV01', '2026-05-01', N'Keycap custom', 50, 2500000),
('TV01', '2026-05-05', N'Mũ/Nón sự kiện', 100, 3000000),
('TV02', '2026-05-02', N'Áo thun', 200, 10000000),
('TV03', '2026-05-03', N'Tiền mặt', 1, 5000000),
('TV01', '2026-05-10', N'Balo Laptop', 20, 4000000),
('TV04', '2026-05-12', N'Voucher khóa học', 50, 15000000),
('TV02', '2026-05-15', N'Nước uống', 500, 1500000);
GO
SELECT * FROM BAN_TO_CHUC
SELECT* FROM QUA_TAI_TRO
--CTE 
WITH TONG_GIA_TRI_TAI_TRO AS (
    SELECT 
        TC.TenTV,
        SUM(QT.TRIGIA) AS TONG_TAI_TRO
        FROM QUA_TAI_TRO QT 
        INNER JOIN BAN_TO_CHUC TC ON QT.MaTV = TC.MaTV
        GROUP BY TC.TenTV
)
SELECT* FROM TONG_GIA_TRI_TAI_TRO
WHERE TONG_TAI_TRO > 5000000

WITH TONG_TIEN_TR AS(
    SELECT 
        TC.BanPhuTrach,
        SUM(QT.TriGia) AS TONG_TAI_TRO
        FROM QUA_TAI_TRO QT 
        INNER JOIN BAN_TO_CHUC TC ON QT.MaTV = TC.MaTV
        GROUP BY TC.BanPhuTrach
)
SELECT *
FROM TONG_TIEN_TR
WHERE TONG_TIEN_TR.TONG_TAI_TRO >= (SELECT MAX (TONG_TAI_TRO) FROM TONG_TIEN_TR )

--c2
WITH TONG_TIEN_TR AS(
    SELECT 
        TC.BanPhuTrach,
        SUM(QT.TriGia) AS TONG_TAI_TRO
        FROM QUA_TAI_TRO QT 
        INNER JOIN BAN_TO_CHUC TC ON QT.MaTV = TC.MaTV
        GROUP BY TC.BanPhuTrach
)
-- Xếp hạng giảm dần và cắt đúng ông Top 1
SELECT TOP 1 WITH TIES * FROM TONG_TIEN_TR
ORDER BY TONG_TAI_TRO DESC