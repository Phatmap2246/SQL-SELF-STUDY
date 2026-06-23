USE master
CREATE DATABASE QUANLYSINHVIEN

-- TAO DU LIEU

CREATE TABLE MHOC(
    MAMH NVARCHAR(8) PRIMARY KEY,
    MAKHOA NVARCHAR(4),
    TENMH NVARCHAR(100),
    TINCHI INT
)
GO

CREATE TABLE HPHAN(
    MAHP INT PRIMARY KEY,
    MAMH NVARCHAR(8),
    HOCKY INT,
    NAM INT,
    GV NVARCHAR(50)
)
GO

CREATE TABLE SVIEN(
    MASV NVARCHAR(8) PRIMARY KEY,
    MAKHOA NVARCHAR(4),
    TENSV NVARCHAR(100),
    NAM INT
)
GO

CREATE TABLE KHOA(
    MAKHOA NVARCHAR (4) PRIMARY KEY,
    TENKHOA NVARCHAR(100),
    NAMTHANHLAP INT
)
GO

CREATE TABLE KETQUA(
    MASV NVARCHAR(8),
    MAHP INT,
    DIEM DECIMAL(4,1),
    PRIMARY KEY (MASV,MAHP)
)
GO

CREATE TABLE DKIEN(
    MAMH NVARCHAR (8),
    MAMH_TRUOC NVARCHAR(8),
    PRIMARY KEY (MAMH,MAMH_TRUOC)
)
GO

-- DAY DU LIEU VAO BANG
-- 1. Thêm dữ liệu vào bảng KHOA
INSERT INTO KHOA (MAKHOA, TENKHOA, NAMTHANHLAP)
VALUES 
    ('TOAN', N'Toán', 1976),
    ('HOA', N'Hóa', 1980),
    ('SINH', N'Sinh', 1981),
    ('VLY', N'Vật lý', 1982);
GO

-- 2. Thêm dữ liệu vào bảng SVIEN 
INSERT INTO SVIEN (MASV, MAKHOA, TENSV, NAM)
VALUES 
    ('K27.0017', 'TOAN', N'Nguyễn Công Phú', 1),
    ('K26.0008', 'TOAN', N'Phan Anh Khanh', 2),
    ('K25.0005', 'HOA', N'Lý Thành', 3),
    ('K27.0018', 'VLY', N'Hàn Quốc Việt', 2);
GO

-- 3. Thêm dữ liệu vào bảng MHOC
INSERT INTO MHOC (MAMH, MAKHOA, TENMH, TINCHI)
VALUES 
    ('TH0001', 'TOAN', N'Tin học đại cương A1', 4),
    ('TH0002', 'TOAN', N'Cấu trúc dữ liệu', 4),
    ('TO0001', 'TOAN', N'Toán rời rạc', 3),
    ('HH0001', 'HOA', N'Hoá đại cương A1', 5),
    ('HH0002', 'HOA', N'Hoá đại cương A2', 5),
    ('VL0002', 'VLY', N'Vật lý đại cương A2', 4),
    ('TH0003', 'TOAN', N'Cơ sở dữ liệu', 5),
    ('VL0001', 'VLY', N'Vật lý đại cương A1', 5);
GO

-- 4. Thêm dữ liệu vào bảng HPHAN
INSERT INTO HPHAN (MAHP, MAMH, HOCKY, NAM, GV)
VALUES 
    (1, 'TH0001', 1, 1996, N'N.D. Lâm'),
    (2, 'VL0001', 1, 1996, N'T.N. Dung'),
    (3, 'TH0002', 1, 1997, N'H. Tuân'),
    (4, 'TH0001', 1, 1997, N'N.D. Lâm'),
    (5, 'TH0003', 2, 1997, N'N.C.Phú'),
    (6, 'HH0001', 1, 1996, N'L.T.Phúc'),
    (7, 'TH0002', 1, 1998, N'P.T.Như'),
    (8, 'TO0001', 1, 1996, N'N.C.Phú');
GO

-- 5. Thêm dữ liệu vào bảng DKIEN
INSERT INTO DKIEN (MAMH, MAMH_TRUOC)
VALUES 
    ('TH0003', 'TO0001'),
    ('TH0003', 'TH0002'),
    ('TH0002', 'TH0001'),
    ('HH0002', 'HH0001'),
    ('VL0002', 'VL0001');
GO

-- 6. Thêm dữ liệu vào bảng KETQUA (Trong hình đặt là KQUA)
INSERT INTO KETQUA (MASV, MAHP, DIEM)
VALUES 
    ('K27.0017', 4, 9.5),
    ('K26.0008', 1, 10.0),
    ('K25.0005', 6, 6.0),
    ('K27.0018', 2, 8.0),
    ('K26.0008', 3, 9.0);
GO

-- THEM FOREIN KEY
ALTER TABLE MHOC 
ADD CONSTRAINT FK_MAKHOA FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
GO

ALTER TABLE DKIEN
ADD CONSTRAINT FK_MAMH FOREIGN KEY (MAMH) REFERENCES MHOC(MAMH),
    CONSTRAINT FK_MAMH_TRUOC FOREIGN KEY (MAMH_TRUOC) REFERENCES MHOC(MAMH)
GO

ALTER TABLE HPHAN
ADD CONSTRAINT FK_MAMH_HPAN FOREIGN KEY (MAMH) REFERENCES MHOC(MAMH)
GO

ALTER TABLE KETQUA
ADD CONSTRAINT FK_MASV_KQ FOREIGN KEY (MASV) REFERENCES SVIEN(MASV),
    CONSTRAINT FK_MAHP_KQ FOREIGN KEY (MAHP) REFERENCES HPHAN(MAHP)
GO

ALTER TABLE SVIEN
ADD CONSTRAINT FK_MAKHOA_SVIEN FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
GO

SELECT * FROM MHOC
SELECT * FROM HPHAN
--BO SUNG DU LIEU
-- ==========================================
-- 1. CHẾ THÊM DATA BẢNG ĐIỀU KIỆN (DKIEN)
-- ==========================================
INSERT INTO DKIEN (MAMH, MAMH_TRUOC)
VALUES 
    ('TO0001', 'TH0001'), -- Toán rời rạc cần Tin học đại cương
    ('TH0003', 'TH0001'), -- CSDL cũng cần Tin học ĐC
    ('VL0001', 'TO0001'),
    ('HH0001', 'TO0001'),
    ('HH0002', 'TH0001'),
    ('VL0002', 'TH0001'),
    ('VL0002', 'TO0001');
GO

-- ==========================================
-- 2. CHẾ THÊM 21 DATA BẢNG KẾT QUẢ (KETQUA)
-- ==========================================
INSERT INTO KETQUA (MASV, MAHP, DIEM)
VALUES 
    -- Sinh viên K27.0017 (Nguyễn Công Phú - Nãy đã có MAHP 4)
    ('K27.0017', 1, 7.5),
    ('K27.0017', 2, 8.0),
    ('K27.0017', 3, 6.5),
    ('K27.0017', 5, 9.0),
    ('K27.0017', 7, 8.5),
    
    -- Sinh viên K26.0008 (Phan Anh Khanh - Học bá 10 điểm, Nãy đã có MAHP 1, 3)
    ('K26.0008', 2, 8.5),
    ('K26.0008', 4, 9.5),
    ('K26.0008', 5, 10.0),
    ('K26.0008', 6, 7.0),
    ('K26.0008', 7, 8.0),
    ('K26.0008', 8, 9.0),
    
    -- Sinh viên K25.0005 (Lý Thành - Nãy đã có MAHP 6)
    ('K25.0005', 1, 5.5),
    ('K25.0005', 2, 6.0),
    ('K25.0005', 3, 7.5),
    ('K25.0005', 4, 6.5),
    ('K25.0005', 5, 8.0),
    
    -- Sinh viên K27.0018 (Hàn Quốc Việt - Nãy đã có MAHP 2)
    ('K27.0018', 1, 8.0),
    ('K27.0018', 3, 7.0),
    ('K27.0018', 4, 9.0),
    ('K27.0018', 5, 6.5),
    ('K27.0018', 7, 8.5);
GO
--

-- PRACTICE
--1. Liệt kê tên các sinh viên thuộc khoa “Toán” (MAKHOA = “TOAN”)
SELECT 
    SV.TENSV,
    SV.MAKHOA
    FROM SVIEN SV 
    WHERE SV.MAKHOA = 'TOAN'

--2. Liệt kê tên các môn học và số tín chỉ
SELECT 
    MHOC.TENMH,
    MHOC.TINCHI
    FROM MHOC

--3. Liệt kê kết quả học tập của sinh viên có mã số ‘K26.008’ (MASV)
SELECT*
    FROM KETQUA
    INNER JOIN HPHAN
        ON KETQUA.MAHP = HPHAN.MAHP
    WHERE MASV = 'K26.0008'

-- 4. Liệt kê tên sinh viên và mã môn học mà sinh viên đó đăng ký học với kết quả cuối khoá trên 7 điểm
SELECT 
    SV.TENSV,
    HP.MAMH,
    KQ.DIEM
    FROM SVIEN SV
    INNER JOIN KETQUA KQ
        ON KQ.MASV = SV.MASV
    INNER JOIN HPHAN HP
        ON KQ.MAHP = HP.MAHP
    WHERE KQ.DIEM > 7

--5. Liệt kê tên sinh viên thuộc về khoa có phụ trách môn học "Toán rời rạc"
SELECT * FROM MHOC
SELECT 
    SV.TENSV,
    SV.MAKHOA
    FROM SVIEN SV 
    INNER JOIN MHOC MH 
        ON SV.MAKHOA = MH.MAKHOA
    WHERE MH.TENMH LIKE N'Toán rời rạc'

--6. Liệt kê tên sinh viên, tên môn học, và điểm số của sinh viên ở học kì 1, năm 1996
SELECT 
    SV.TENSV,
    MH.TENMH,
    KQ.DIEM
    FROM SVIEN SV 
    INNER JOIN KETQUA KQ
        ON KQ.MASV = SV.MASV
    INNER JOIN HPHAN HP 
        ON KQ.MAHP = HP.MAHP
    INNER JOIN MHOC MH 
        ON HP.MAMH = MH.MAMH
    WHERE HP.HOCKY = 1 AND HP.NAM = 1996

---7. Liệt kê tên các môn học phải học ngay trước môn "Cơ sở dữ liệu"
SELECT 
    MH.TENMH AS TEN_MH_PHAI_HOC
    FROM MHOC MH 
    WHERE MH.MAMH IN(
        SELECT DK.MAMH_TRUOC
        FROM DKIEN DK 
        INNER JOIN MHOC MH2
            ON DK.MAMH = MH2.MAMH
        WHERE MH2.TENMH LIKE N'Cơ sở dữ liệu'
    )

--c2 
SELECT 
    MH.TENMH
    FROM MHOC MH 
    INNER JOIN DKIEN DK 
        ON DK.MAMH_TRUOC = MH.MAMH
    INNER JOIN MHOC MH2 
        ON DK.MAMH = MH2.MAMH
    WHERE MH2.TENMH LIKE N'Cơ sở dữ liệu'

--8. Liệt kê tên các môn học phải học ngay sau môn "Toán rời rạc"
SELECT 
    MH.TENMH AS MH_PHAI_HOC_SAU
    FROM MHOC MH 
    WHERE MH.MAMH IN (
        SELECT DK.MAMH
        FROM DKIEN DK 
        INNER JOIN MHOC MH2
            ON DK.MAMH_TRUOC = MH2.MAMH
        WHERE MH2.TENMH LIKE N'Toán rời rạc'
    )

--9. Liệt kê tên môn học trước, tên môn học của môn học có số tính chỉ nhỏ hơn bằng 4
SELECT 
    MH.TENMH AS TENMH_TRUOC
    FROM MHOC MH 
    WHERE MH.MAMH IN(
        SELECT DK.MAMH_TRUOC
        FROM DKIEN DK 
        INNER JOIN MHOC MH2
            ON DK.MAMH = MH2.MAMH
        WHERE MH2.TINCHI <=4
    )

--c2
SELECT 
    MH.TENMH AS TENMH_TRUOC
    FROM MHOC MH 
    INNER JOIN DKIEN DK 
        ON DK.MAMH_TRUOC = MH.MAMH
    INNER JOIN MHOC MH2
        ON DK.MAMH = MH2.MAMH
    WHERE MH2.TINCHI <=4

--10. *Liệt kê danh sách sinh viên, điểm của môn “Cơ sở dữ liệu” ở học kì 1, năm học 1996 được sắp theo
-- thứ tự điểm giảm dần, trùng điểm số thì sắp theo tên tăng dần.

SELECT 
    SV.TENSV,
    KQ.DIEM,
    MH.TENMH
    FROM SVIEN SV 
    INNER JOIN KETQUA KQ 
        ON KQ.MASV = SV.MASV
    INNER JOIN HPHAN HP 
        ON KQ.MAHP = HP.MAHP
    INNER JOIN MHOC MH 
        ON HP.MAMH = MH.MAMH
    WHERE MH.TENMH LIKE N'Cơ sở dữ liệu' AND HP.HOCKY = 1 AND HP.NAM = 1996
    ORDER BY KQ.DIEM DESC, SV.TENSV ASC

--11. Liệt kê mã học phần và số lượng sinh viên đăng ký theo từng học phần
SELECT * FROM KETQUA
SELECT 
    COUNT(KQ.MASV) AS SL_SVDK
    FROM KETQUA KQ
    GROUP BY KQ.MAHP
--12. Liệt kê tên sinh viên và điểm trung bình của sinh viên đó trong từng học kỳ của từng niên học
SELECT 
    SV.TENSV,
    AVG(KQ.DIEM) AS DIEM_TB,
    HP.NAM,
    HP.HOCKY
    FROM SVIEN SV 
    INNER JOIN KETQUA KQ 
        ON KQ.MASV = SV.MASV
    INNER JOIN HPHAN HP 
        ON KQ.MAHP = HP.MAHP
    GROUP BY SV.TENSV, HP.NAM,HP.HOCKY

-- 13. Liệt kê tên sinh viên đạt điểm cao nhất
SELECT* FROM KETQUA
SELECT 
    SV.TENSV
    FROM SVIEN SV 
    WHERE SV.MASV IN (
        SELECT KQ.MASV
        FROM KETQUA KQ 
        WHERE KQ.DIEM = (SELECT MAX (KQ2.DIEM) FROM KETQUA KQ2)
    )

-- 14. Liệt kê tên sinh viên có điểm cao nhất của môn “Cơ sở dữ liệu” ở học kì 1, năm 1996
SELECT 
    SV.TENSV 
    FROM SVIEN SV 
    WHERE SV.MASV IN (
        SELECT KQ.MASV 
        FROM KETQUA KQ 
        INNER JOIN HPHAN HP 
            ON KQ.MAHP = HP.MAHP
        INNER JOIN MHOC MH 
            ON HP.MAMH = MH.MAMH 
        WHERE MH.TENMH LIKE N'Vật lý đại cương A1' AND HP.HOCKY = 1 AND HP.NAM = 1996
        AND KQ.DIEM = (
            SELECT MAX(KQ2.DIEM)
            FROM KETQUA KQ2
            INNER JOIN HPHAN HP2
            ON KQ2.MAHP = HP2.MAHP
        INNER JOIN MHOC MH2
            ON HP2.MAMH = MH2.MAMH 
        WHERE MH2.TENMH LIKE N'Vật lý đại cương A1' AND HP2.HOCKY = 1 AND HP2.NAM = 1996
        )
    )
 
-- 15. Liệt kê tên sinh viên có điểm trung bình cao nhất ở học kì 1, năm 1996
SELECT 
    SV.TENSV 
    FROM SVIEN SV 
    WHERE SV.MASV IN (
        SELECT KQ.MASV 
        FROM KETQUA KQ 
        INNER JOIN HPHAN HP 
            ON KQ.MAHP = HP.MAHP 
        WHERE HP.HOCKY = 1 AND HP.NAM = 1996 
        GROUP BY KQ.MASV
        HAVING AVG(KQ.DIEM) >= ALL (
            SELECT 
                AVG(KQ2.DIEM)
                FROM KETQUA KQ2
                INNER JOIN HPHAN HP2
                    ON KQ2.MAHP = HP2.MAHP
                WHERE HP2.HOCKY = 1 AND HP2.NAM = 1996
                GROUP BY KQ2.MASV
        )
    )

--16. *Liệt kê danh sách 10 sinh viên có điểm môn “Cơ sở dữ liệu” cao nhất ở học kì 1, năm 1996

SELECT TOP (10)
    SV.TENSV,
    KQ.DIEM,
    MH.TENMH,
    HP.HOCKY,
    HP.NAM
    FROM SVIEN SV 
    INNER JOIN KETQUA  KQ 
        ON KQ.MASV = SV.MASV 
    INNER JOIN HPHAN HP 
        ON KQ.MAHP = HP.MAHP
    INNER JOIN MHOC MH  
        ON HP.MAMH = MH.MAMH
    WHERE MH.TENMH LIKE N'Cơ sở dữ liệu' AND HP.HOCKY = 1 AND HP.NAM =1996
    ORDER BY KQ.DIEM DESC 

-- 17. Liệt kê tên sinh viên chưa đăng ký học môn “Toán rời rạc”
SELECT * FROM KETQUA
SELECT 
    SV.TENSV
    FROM SVIEN SV 
    WHERE SV.MASV NOT IN(
        SELECT KQ.MASV 
        FROM KETQUA KQ 
        INNER JOIN HPHAN HP 
            ON HP.MAHP = KQ.MAHP
        INNER JOIN MHOC MH 
            ON HP.MAMH = MH.MAMH
        WHERE MH.TENMH LIKE N'Toán rời rạc'
    )

-- 18. Liệt kê những môn học thuộc khoa “Toán” (MAKHOA=”TOAN”) phụ trách nhưng không được dạy ở học
-- kì 1 năm 1996
SELECT 
    MH.TENMH
    FROM MHOC MH 
    WHERE MH.MAKHOA = 'TOAN' AND MH.MAMH NOT IN (
        SELECT HP.MAMH 
        FROM HPHAN HP
        WHERE HP.HOCKY = 1 AND HP.NAM = 1996
    )

---19. *Liệt kê danh sách sinh viên năm 3 thuộc khoa “Toán” (MAKHOA=”TOAN”) không đăng kí học môn “Cơ
-- sở dữ liệu” ở học kì 1, năm 1996
SELECT 
    SV.TENSV,
    SV.NAM 
    FROM SVIEN SV 
    WHERE SV.NAM = 3 AND SV.MAKHOA = 'TOAN' AND SV.MASV NOT IN (
        SELECT KQ.MASV 
        FROM KETQUA KQ 
        INNER JOIN HPHAN HP ON KQ.MAHP = HP.MAHP
        INNER JOIN MHOC MH ON HP.MAMH = MH.MAMH
        WHERE MH.TENMH = N'Cơ sở dữ liệu' AND HP.HOCKY = 1 AND HP.NAM =1996
    )

--20. *Liệt kê danh sách các sinh viên có đăng kí trên 3 học phần (có điểm số) của học kì 1, năm 1996
-- (Các câu có đánh dấu * chỉ viết câu truy vấn bằng ngôn ngữ SQL)
SELECT*FROM KETQUA
SELECT 
    SV.TENSV 
    FROM SVIEN SV 
    WHERE SV.MASV IN(
        SELECT KQ.MASV 
        FROM KETQUA KQ 
        INNER JOIN HPHAN HP ON KQ.MAHP = HP.MAHP
        WHERE HP.HOCKY = 1 AND HP.NAM =1996
        GROUP BY KQ.MASV
        HAVING COUNT(KQ.MASV) > 3
    )

