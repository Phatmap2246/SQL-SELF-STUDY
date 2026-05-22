--CREATE DATABASE QUANLYDEAN;
--GO
USE QUANLYDEAN;
GO
CREATE TABLE EMPLOYEE(
    MANV VARCHAR(8) PRIMARY KEY,
    HONV VARCHAR(50),
    TENLOT VARCHAR(50),
    TENNV VARCHAR (50),
    NGSINH DATETIME,
    PHAI VARCHAR(5),
    DCHI VARCHAR(1000),
    MLUONG FLOAT,
    MA_NQL VARCHAR(8) REFERENCES EMPLOYEE(MANV), -- FOREIGN KEY
    PHONG VARCHAR (4)
)
GO
CREATE TABLE PHONGBAN(
    MAPHONG VARCHAR(4) PRIMARY KEY,
    TENPHG VARCHAR (100),
    TRPHG VARCHAR(8) REFERENCES EMPLOYEE (MANV),
    NGNC DATETIME
)
GO
ALTER TABLE EMPLOYEE
    ADD CONSTRAINT FK_PHONG FOREIGN KEY (PHONG) REFERENCES PHONGBAN(MAPHONG);
GO
USE QUANLYDEAN
CREATE TABLE THANNHAN(
    MATN VARCHAR(8),
    MANV VARCHAR (8) REFERENCES EMPLOYEE(MANV),
    TENTN VARCHAR(50),
    PHAI VARCHAR(5),
    NGSINH DATETIME,
    QUANHE VARCHAR(30),
    PRIMARY KEY(MATN,MANV)
)
GO
CREATE TABLE DEAN(
    MADA VARCHAR (6) PRIMARY KEY,
    MAPHG VARCHAR (4) REFERENCES PHONGBAN(MAPHONG),
    TENDA VARCHAR(100),
    NGBD_DK DATETIME,
    NGKT_DK DATETIME
)
GO
CREATE TABLE PHANCONG(
    MANV VARCHAR(8)  REFERENCES EMPLOYEE (MANV),
    MADA VARCHAR (6) REFERENCES DEAN(MADA),
    THOIGIAN FLOAT,
    PRIMARY KEY (MANV, MADA)
)
GO

CREATE TABLE DIADIEM_PHG(
    MAPHG VARCHAR(4) REFERENCES PHONGBAN(MAPHONG),
    DIADIEM VARCHAR (30),
    PRIMARY KEY (MAPHG,DIADIEM)
)
GO

USE QUANLYDEAN;
GO

-- Tạm tắt rào chắn Khóa ngoại và dọn sạch data cũ để Insert cho mượt
EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';
EXEC sp_MSforeachtable 'DELETE FROM ?';
GO

-- CREATE DATA FOR PHONGBAN
INSERT INTO PHONGBAN (MAPHONG, TENPHG, TRPHG, NGNC) VALUES
('QL', 'Quan Ly', '001', '2000-05-22'),
('DH', 'Dieu Hanh', '003', '2002-10-10'),
('NC', 'Nghien Cuu', '002', '2002-03-15');
GO

-- CREATE DATA FOR NHANVIEN (Bảng EMPLOYEE)
-- CREATE DATA FOR NHANVIEN (Bảng EMPLOYEE đã tách đủ 3 cột tên)
INSERT INTO EMPLOYEE (MANV, HONV, TENLOT, TENNV, NGSINH, PHAI, DCHI, MLUONG, MA_NQL, PHONG) VALUES
('001', 'Vuong', 'Ngoc', 'Quyen', '1957-10-22', 'Nu', '450 Trung Vuong, Ha Noi', 3000000, NULL, 'QL'),
('002', 'Nguyen', 'Thanh', 'Tung', '1955-01-09', 'Nam', '731 Tran Hung Dao, Q1, TpHCM', 2500000, '001', 'NC'),
('003', 'Le', 'Thi', 'Nhan', '1960-12-18', 'Nu', '291 Ho Van Hue, QPN, TpHCM', 2500000, '001', 'DH'),
('004', 'Dinh', 'Ba', 'Tien', '1968-01-09', 'Nam', '638 Nguyen Van Cu, Q5, Tp HCM', 2200000, '002', 'NC'),
('005', 'Bui', 'Thuy', 'Vu', '1972-07-19', 'Nam', '332 Nguyen Thai Hoc, Q1, Tp HCM', 2200000, '003', 'DH'),
('006', 'Nguyen', 'Manh', 'Hung', '1973-09-15', 'Nam', '978 Ba Ria, Vung Tau', 2000000, '002', 'NC'),
('007', 'Tran', 'Thanh', 'Tam', '1975-07-31', 'Nu', '543 Mai Thi Luu, Q1, Tp HCM', 2200000, '002', 'NC'),
('008', 'Tran', 'Hong', 'Van', '1976-07-04', 'Nu', '980 Le Hong Phong, Q10, TpHCM', 1800000, '004', 'NC');
GO

-- CREATE DATA FOR DIADIEM_PHG
INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM) VALUES
('NC', 'HANOI'),
('NC', 'TPHCM'),
('QL', 'TPHCM'),
('DH', 'HANOI'),
('DH', 'TPHCM'),
('DH', 'NHATRANG');
GO

-- CREATE DATA FOR DEAN
INSERT INTO DEAN (MADA, TENDA, MAPHG, NGBD_DK, NGKT_DK) VALUES
('TH001', 'Tin hoc hoa 1', 'NC', '2003-02-01', '2004-02-01'),
('TH002', 'Tin hoc hoa 2', 'NC', '2003-06-04', '2004-02-01'),
('DT001', 'Dao tao 1', 'DH', '2002-02-01', '2006-02-01'),
('DT002', 'Dao tao 2', 'DH', '2002-02-01', '2006-02-01');
GO

-- CREATE DATA FOR THANNHAN
INSERT INTO THANNHAN (MANV, MATN, TENTN, PHAI, NGSINH, QUANHE) VALUES
('003', '1', 'Tran Minh Tien', 'Nam', '1990-12-11', 'Con'),
('003', '2', 'Tran Ngoc Linh', 'Nu', '1993-03-10', 'Con'),
('003', '3', 'Tran Minh Long', 'Nam', '1957-10-10', 'Vo Chong'),
('001', '1', 'Le Nhat Minh', 'Nam', '1955-04-27', 'Vo Chong'),
('002', '1', 'Le Hoai Thuong', 'Nu', '1960-12-05', 'Vo Chong'),
('004', '1', 'Le Phi Phung', 'Nu', '1972-12-23', 'Vo Chong'),
('005', '1', 'Tran Thu Hong', 'Nu', '1978-04-11', 'Vo Chong'),
('005', '2', 'Nguyen Manh Tam', 'Nam', '2003-01-13', 'Con');
GO

-- CREATE DATA FOR PHANCONG
INSERT INTO PHANCONG (MANV, MADA, THOIGIAN) VALUES
('001', 'TH001', 30.0),
('001', 'TH002', 12.5),
('002', 'TH001', 10.0),
('002', 'TH002', 10.0),
('002', 'DT001', 10.0),
('002', 'DT002', 10.0),
('003', 'TH001', 37.5),
('004', 'DT001', 22.5),
('004', 'DT002', 10.0),
('006', 'DT001', 30.5),
('007', 'TH001', 20.0),
('007', 'TH002', 10.0),
('008', 'TH001', 10.0),
('008', 'DT002', 12.5);
GO

-- Bật lại rào chắn Khóa ngoại cho hệ thống an toàn
EXEC sp_MSforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL';
GO

-- Dọn sạch những dữ liệu nửa vời bị kẹt lúc báo lỗi
DELETE FROM THANNHAN;
GO

-- CREATE DATA FOR THANNHAN (Đã đánh số lại MATN từ 1 đến 8 để không bị trùng)
INSERT INTO THANNHAN (MANV, MATN, TENTN, PHAI, NGSINH, QUANHE) VALUES
('003', '1', 'Tran Minh Tien', 'Nam', '1990-12-11', 'Con'),
('003', '2', 'Tran Ngoc Linh', 'Nu', '1993-03-10', 'Con'),
('003', '3', 'Tran Minh Long', 'Nam', '1957-10-10', 'Vo Chong'),
('001', '4', 'Le Nhat Minh', 'Nam', '1955-04-27', 'Vo Chong'),
('002', '5', 'Le Hoai Thuong', 'Nu', '1960-12-05', 'Vo Chong'),
('004', '6', 'Le Phi Phung', 'Nu', '1972-12-23', 'Vo Chong'),
('005', '7', 'Tran Thu Hong', 'Nu', '1978-04-11', 'Vo Chong'),
('005', '8', 'Nguyen Manh Tam', 'Nam', '2003-01-13', 'Con');
GO



-- Cập nhật lương cho từng nhân viên dựa vào MANV
UPDATE EMPLOYEE SET MLUONG = 3000000 WHERE MANV = '001';
UPDATE EMPLOYEE SET MLUONG = 2500000 WHERE MANV = '002';
UPDATE EMPLOYEE SET MLUONG = 2500000 WHERE MANV = '003';
UPDATE EMPLOYEE SET MLUONG = 2200000 WHERE MANV = '004';
UPDATE EMPLOYEE SET MLUONG = 2200000 WHERE MANV = '005';
UPDATE EMPLOYEE SET MLUONG = 2000000 WHERE MANV = '006';
UPDATE EMPLOYEE SET MLUONG = 2200000 WHERE MANV = '007';
UPDATE EMPLOYEE SET MLUONG = 1800000 WHERE MANV = '008';
GO

PRINT 'Da phat luong thanh cong cho toan bo 8 nhan vien!';
GO
SELECT * FROM EMPLOYEE
SELECT * FROM PHONGBAN
SELECT * FROM DEAN 
SELECT * FROM THANNHAN
SELECT * FROM PHANCONG
SELECT * FROM DIADIEM_PHG

--Liệt kê những nhân viên (MANV, HONV, TENLOT, TENNV) làm việc ở phòng “NC"
SELECT 
    E.MANV,
    E.HONV + ' ' + E.TENLOT AS HOVATEN,
    E.PHONG
    FROM EMPLOYEE E
    WHERE PHONG = 'NC'
GO
-- Liệt kê những nhân viên (MANV, HONV, TENLOT, TENNV,PHAI) có mức lương trên 3.000.000
SELECT 
    E.MANV,
    E.HONV + ' ' + E.TENLOT AS HOVATEN,
    E.PHAI,
    E.MLUONG
    FROM EMPLOYEE E
    WHERE MLUONG > 3000000

--Liệt kê họ tên nhân viên và tên phòng ban nhân viên đó trực thuộc có mức lương từ 2.000.000 đến 3.000.000
SELECT 
    E.MANV,
    E.HONV + ' ' + E.TENLOT AS HOVATEN,
    P.TENPHG
    FROM EMPLOYEE E 
    INNER JOIN PHONGBAN P
        ON E.PHONG = P.MAPHONG
    WHERE MLUONG >= 2000000 AND MLUONG <= 3000000

--Liệt kê họ tên đầy đủ của các nhân viên ở “TP HCM”
SELECT 
    E.MANV,
    E.HONV + ' ' + E.TENLOT AS HOVATEN,
    E.DCHI
    FROM EMPLOYEE E
    WHERE DCHI LIKE '%Tp HCM' OR DCHI LIKE '%TpHCM' OR DCHI LIKE '%TP HCM'

--Liệt kê ngày sinh và địa chỉ của nhân viên “Dinh Ba Tien”

SELECT 
    E.HONV + ' ' + E.TENLOT + ' ' + E.TENNV AS HOVATEN,
    E. NGSINH
    FROM EMPLOYEE E 
    WHERE E.HONV + ' ' + E.TENLOT + ' ' + E.TENNV LIKE 'Dinh Ba Tien'

--Liệt kê danh sách các thân nhân dưới 18 tuổi của các nhân viên có mã là “NV001”
SELECT * FROM THANNHAN
SELECT 
    TN.TENTN,
    TN.PHAI,
    TN.NGSINH,
    TN.QUANHE
    FROM THANNHAN TN 
    WHERE MANV = '001' AND (FLOOR (DATEDIFF(DAY,NGSINH,GETDATE()) /365.25) < 100)

-- 7. Liệt kê danh sách tất cả các nhân viên nữ trên 30 tuổi
SELECT 
    E.HONV + ' ' + E.TENLOT + ' ' + E.TENNV AS HOVATEN,
    E.NGSINH
    FROM EMPLOYEE E 
    WHERE FLOOR(DATEDIFF(DAY,NGSINH,GETDATE())/365.25) >30 AND PHAI = 'Nu'

-- 8. Với mỗi phòng ban, liệt kê tên phòng ban và địa điểm phòng
SELECT * FROM PHONGBAN
SELECT * FROM DIADIEM_PHG

SELECT 
    PHG.TENPHG,
    DD.DIADIEM
    FROM PHONGBAN PHG
    INNER JOIN DIADIEM_PHG DD
        ON PHG.MAPHONG = DD.MAPHG
    
--9. Liệt kê tên những người trưởng phòng của từng phòng ban
SELECT 
    E.HONV + ' ' + E.TENLOT + ' ' + E.TENNV AS HOVATEN,
    PHG.TENPHG
    FROM EMPLOYEE E
    INNER JOIN PHONGBAN PHG
        ON PHG.TRPHG = E.MANV

--10. Liệt kê TENDA, MADA, DDIEM_DA, PHONG, TENPHG, MAPHG, TRPHG, NGNC
SELECT * FROM DEAN
SELECT * FROM PHONGBAN
UPDATE DEAN SET DIADIEM_DA = 'TPHCM' WHERE MADA = 'TH002'
UPDATE DEAN SET DIADIEM_DA = 'NHATRANG' WHERE MADA = 'DT001'
UPDATE DEAN SET DIADIEM_DA = 'HANOI' WHERE MADA = 'DT002'

SELECT 
    DA. TENDA,
    DA.MADA,
    DA.DIADIEM_DA,
    DA.MAPHG,
    PHG.TENPHG,
    E.HONV + ' ' + E.TENLOT + ' ' + E.TENNV AS HOVATEN_TRPHG,
    PHG.NGNC
    FROM DEAN DA 
    INNER JOIN PHONGBAN PHG ON DA.MAPHG = PHG.MAPHONG
    INNER JOIN EMPLOYEE E ON PHG.TRPHG = E.MANV 

--11. Liệt kê tên và địa chỉ của tất cả các nhân viên của phòng "Nghien cuu"
SELECT
    E.HONV + ' ' + E.TENLOT + ' ' + E.TENNV AS HOVATEN,
    E.DCHI,
    E.PHONG
    FROM EMPLOYEE E 
    INNER JOIN PHONGBAN PHG ON E.PHONG = PHG.MAPHONG

--12. Liệt kê tên những nữ nhân viên và tên người thân của họ
SELECT 
    E.HONV + ' ' + E.TENLOT + ' ' + E.TENNV AS HOVATEN_NV,
    E.PHAI,
    TN.TENTN,
    TN.QUANHE
    FROM EMPLOYEE E
    INNER JOIN THANNHAN TN ON TN.MANV = E.MANV
    WHERE E.PHAI = 'Nu'

--13. Liệt kê mã số và tên những nhân viên thuộc phòng “Nghien Cuu” tham gia đề án “Tin Hoc Hoa” với thời gian làm việc 20 giờ/tuần
SELECT * FROM PHANCONG
SELECT 
    E.MANV,
    E.HONV + ' ' + E.TENLOT + ' ' + E.TENNV AS HOVATEN_NV,
    PC.MADA,
    PC.THOIGIAN
    FROM EMPLOYEE E  
    INNER JOIN PHANCONG PC ON PC.MANV = E.MANV
    INNER JOIN DEAN DA ON PC.MADA = DA.MADA
    WHERE PC.THOIGIAN >=20 AND (DA.TENDA LIKE 'Nghien Cuu' OR DA.TENDA LIKE 'Tin Hoc Hoa%')

--14. Với mọi đề án ở "Ha Noi", liệt kê các mã số đề án (MADA), mã số phòng ban chủ trì đề án (PHONG), họ tên trưởng phòng (HONV, TENLOT, TENNV) cũng như địa chỉ (DCHI) và ngày sinh (NGSINH) của người ấy
SELECT * FROM DEAN
SELECT* FROM PHONGBAN
SELECT 
    DA.MADA,
    DA.MAPHG,
    E.HONV + ' ' + E.TENLOT + ' ' + E.TENNV AS HOVATEN_TRPHG,
    E.DCHI,
    DA.DIADIEM_DA,
    E.NGSINH
    FROM DEAN DA 
    INNER JOIN PHONGBAN PHG ON DA.MAPHG = PHG.MAPHONG
    INNER JOIN EMPLOYEE E ON PHG.TRPHG = E.MANV
    WHERE DA.DIADIEM_DA LIKE 'HANOI'

--15. Với mỗi nhân viên, liệt kê họ tên nhân viên và họ tên người quản lý trực tiếp của nhân viên đó
SELECT 
    E.HONV + ' ' + E.TENLOT + ' ' + E.TENNV AS HOVATEN_NV,
    E2.HONV + ' ' + E.TENLOT + ' ' + E.TENNV AS HOVATEN_QL
    FROM EMPLOYEE E 
    INNER JOIN EMPLOYEE E2 ON E.MA_NQL = E2.MANV

--16. Với mỗi nhân viên, liệt kê họ tên nhân viên và họ tên trưởng phòng của phòng ban mà nhân viên đó làm việc
SELECT 
    E.HONV + ' ' + E.TENLOT + ' ' + E.TENNV AS HOVATEN_NV,
    E.PHONG,
    E2.HONV + ' ' + E2.TENLOT + ' ' + E2.TENNV AS HOVATEN_TRPHG
    FROM EMPLOYEE E  
    INNER JOIN PHONGBAN PHG ON E.PHONG = PHG.MAPHONG
    INNER JOIN EMPLOYEE E2 ON PHG.TRPHG = E2.MANV

--17. Liệt kê họ tên nhân viên (HONV, TENLOT, TENNV) và tên các đề án mà nhân viên ấy tham gia nếu có
SELECT
    E.MANV,
    E.HONV + ' ' + E.TENLOT + ' ' + E.TENNV AS HOVATEN_NV,
    DA.TENDA
    FROM EMPLOYEE E 
    LEFT JOIN PHANCONG PC ON PC.MANV = E.MANV
    LEFT JOIN DEAN DA ON PC.MADA = DA.MADA 

-- GOM NHOM

--18. Với mỗi đề án, liệt kê tên đề án (TENDA) và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó
SELECT 
    DA.TENDA,
    SUM(PC.THOIGIAN) AS TONG_THOI_GIAN
    FROM DEAN DA 
    INNER JOIN PHANCONG PC ON PC.MADA = DA.MADA
    GROUP BY DA.TENDA

--19. Với mỗi nhân viên, liệt kê họ và tên nhân viên và nhân viên đó có bao nhiêu thân nhân
SELECT
    E.HONV + ' ' + E.TENLOT + ' ' + E.TENNV AS HOVATEN_NV,
    COUNT(TN.MATN) AS SO_LUONG_THAN_NHAN
    FROM EMPLOYEE E  
    LEFT JOIN THANNHAN TN ON TN.MANV = E.MANV
    GROUP BY E.HONV,E.TENLOT,E.TENNV
-- Như vậy nếu muốn in ra cột gì trước tính toán thì phải group by cái đó 

--20. Với mỗi phòng ban, liệt kê tên phòng ban (TENPHG) và lương trung bình của những nhân viên làm việc cho phòng ban đó
SELECT 
    PHG.TENPHG,
    AVG(E.MLUONG) AS TB_LUONG_NV
    FROM PHONGBAN PHG 
    INNER JOIN EMPLOYEE E ON E.PHONG = PHG.MAPHONG
    GROUP BY PHG.TENPHG 

--21. Cho biết lương trung bình của tất cả các nữ nhân viên
SELECT 
    E.HONV + ' ' + E.TENLOT + ' ' + E.TENNV AS HOVATEN_NV,
    AVG(E.MLUONG) AS MLUONG_TB
    FROM EMPLOYEE E
    GROUP BY E.HONV, E.TENLOT, E.TENNV,E.PHAI
    HAVING E.PHAI = 'Nu' -- Điều kiện trên nhóm (Only for groupby)

--22. Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó
SELECT
    PHG.TENPHG,
    AVG(E.MLUONG) AS MLUONG_TB
    FROM PHONGBAN PHG
    INNER JOIN EMPLOYEE E ON E.PHONG = PHG.MAPHONG
    GROUP BY PHG.TENPHG
    HAVING AVG(E.MLUONG)>2500000