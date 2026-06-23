CREATE DATABASE QLDEAN2;
GO

--CREATE TABLE
CREATE TABLE NHANVIEN(
    MANV VARCHAR(8) PRIMARY KEY,
    HONV VARCHAR (50),
    TENLOT VARCHAR (50),
    TENNV VARCHAR (50),
    NGSINH DATETIME,
    PHAI VARCHAR(5),
    DCHI VARCHAR(100),
    MLUONG FLOAT,
    MA_NQL VARCHAR (8),
    PHONG VARCHAR(4)
)

CREATE TABLE PHONGBAN(
    MAPHG VARCHAR (4) PRIMARY KEY,
    TENPHG VARCHAR (100),
    TRPHG VARCHAR(8),
    NGNC DATETIME
)

CREATE TABLE DIADIEM_PHG(
    MAPHG VARCHAR (4),
    DIADIEM VARCHAR(30),
    PRIMARY KEY(MAPHG,DIADIEM)
)

CREATE TABLE PHANCONG(
    MANV VARCHAR (8),
    MADA VARCHAR (6),
    THOIGIAN FLOAT,
    PRIMARY KEY (MANV,MADA)
)

CREATE TABLE THANNHAN(
    MATN VARCHAR (8),
    MANV VARCHAR (8),
    TENTN VARCHAR(50),
    PHAI VARCHAR(5),
    NGSINH DATETIME,
    QUANHE VARCHAR(30),
    PRIMARY KEY(MATN,MANV)
)

CREATE TABLE DEAN(
    MADA VARCHAR(6) PRIMARY KEY,
    MAPHG VARCHAR(4),
    TENDA VARCHAR (50),
    DDIEM_DA VARCHAR(100),
    NGBD_DK DATETIME,
    NGKT_DK DATETIME
)

-- CREATE DATA FOR TABLES
INSERT INTO PHONGBAN (MAPHG, TENPHG, TRPHG, NGNC) VALUES
('QL', 'Quan Ly', '001', '2000-05-22'),
('DH', 'Dieu Hanh', '003', '2002-10-10'),
('NC', 'Nghien Cuu', '002', '2002-03-15');

INSERT INTO NHANVIEN (MANV, HONV, TENLOT, TENNV, NGSINH, PHAI, DCHI, MA_NQL, PHONG, MLUONG) VALUES
('001', 'Vuong', 'Ngoc', 'Quyen', '1957-10-22', 'Nu', '450 Trung Vuong, Ha Noi', NULL, 'QL', 3000000),
('002', 'Nguyen', 'Thanh', 'Tung', '1955-01-09', 'Nam', '731 Tran Hung Dao, Q1, TpHCM', '001', 'NC', 2500000),
('003', 'Le', 'Thi', 'Nhan', '1960-12-18', 'Nu', '291 Ho Van Hue, QPN, TpHCM', '001', 'DH', 2500000),
('004', 'Dinh', 'Ba', 'Tien', '1968-01-09', 'Nam', '638 Nguyen Van Cu, Q5, TpHCM', '002', 'NC', 2200000),
('005', 'Bui', 'Thuy', 'Vu', '1972-07-19', 'Nam', '332 Nguyen Thai Hoc, Q1, TpHCM', '003', 'DH', 2200000),
('006', 'Nguyen', 'Manh', 'Hung', '1973-09-15', 'Nam', '978 Ba Ria, Vung Tau', '002', 'NC', 2000000),
('007', 'Tran', 'Thanh', 'Tam', '1975-07-31', 'Nu', '543 Mai Thi Luu, Q1, TpHCM', '002', 'NC', 2200000),
('008', 'Tran', 'Hong', 'Van', '1976-07-04', 'Nu', '980 Le Hong Phong, Q10, TpHCM', '004', 'NC', 1800000);

INSERT INTO DEAN (MADA, TENDA, DDIEM_DA, MAPHG, NGBD_DK, NGKT_DK) VALUES
('TH001', 'Tin ho hoc 1', 'HANOI', 'NC', '2003-02-01', '2004-02-01'),
('TH002', 'Tin ho hoc 2', 'TPHCM', 'NC', '2003-06-04', '2004-02-01'),
('DT001', 'Dao tao 1', 'NHATRANG', 'DH', '2002-02-01', '2006-02-01'),
('DT002', 'Dao tao 2', 'HANOI', 'DH', '2002-02-01', '2006-02-01');

INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM) VALUES
('NC', 'HANOI'),
('NC', 'TPHCM'),
('QL', 'TPHCM'),
('DH', 'HANOI'),
('DH', 'TPHCM'),
('DH', 'NHATRANG');

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
('008', 'TH001', 10.0),
('008', 'DT002', 12.5);

INSERT INTO THANNHAN (MANV, MATN, TENTN, PHAI, NGSINH, QUANHE) VALUES
('003', 1, 'Tran Minh Tien', 'Nam', '1990-12-11', 'Con'),
('003', 2, 'Tran Ngoc Linh', 'Nu', '1993-03-10', 'Con'),
('003', 3, 'Tran Minh Long', 'Nam', '1957-10-10', 'Vo Chong'),
('001', 1, 'Le Nhat Minh', 'Nam', '1955-04-27', 'Vo Chong'),
('002', 1, 'Le Hoai Thuong', 'Nu', '1960-12-05', 'Vo Chong'),
('004', 1, 'Le Phi Phung', 'Nu', '1972-12-23', 'Vo Chong'),
('005', 1, 'Tran Thu Hong', 'Nu', '1978-04-11', 'Vo Chong'),
('005', 2, 'Nguyen Manh Tam', 'Nam', '2003-01-13', 'Con');


-- ADD FOREIGN KEY

ALTER TABLE NHANVIEN
    ADD CONSTRAINT FK_MAQL FOREIGN KEY (MA_NQL) REFERENCES NHANVIEN(MANV),
        CONSTRAINT FK_PHONG FOREIGN KEY (PHONG) REFERENCES PHONGBAN(MAPHG)

ALTER TABLE PHONGBAN 
    ADD CONSTRAINT FK_TRPHG FOREIGN KEY (TRPHG) REFERENCES NHANVIEN(MANV)

ALTER TABLE DIADIEM_PHG 
    ADD CONSTRAINT FK_MAPHG FOREIGN KEY (MAPHG) REFERENCES PHONGBAN(MAPHG)

ALTER TABLE PHANCONG
    ADD CONSTRAINT FK_MANV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV),
        CONSTRAINT FK_MADA FOREIGN KEY (MADA) REFERENCES DEAN(MADA)  

ALTER TABLE DEAN 
    ADD CONSTRAINT FK_MAPHG_DA FOREIGN KEY (MAPHG) REFERENCES PHONGBAN(MAPHG)

ALTER TABLE THANNHAN
    ADD CONSTRAINT FK_MANV_TN FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)



--Liệt kê những nhân viên (MANV, HONV, TENLOT, TENNV) làm việc ở phòng “NC”

SELECT MANV, 
        HONV+' '+TENLOT+' '+ TENNV AS HOVATENNV
    FROM NHANVIEN
    WHERE PHONG ='NC'

--Liệt kê những nhân viên (MANV, HONV, TENLOT, TENNV,PHAI) có mức lương trên 3.000.000
SELECT
    HONV+' '+TENLOT+' '+ TENNV AS HOVATENNV,
    PHAI 
    FROM NHANVIEN
    WHERE MLUONG > 3000000

--Liệt kê họ tên nhân viên và tên phòng ban nhân viên đó trực thuộc có mức lương từ 2.000.000 đến
--3.000.000
SELECT 
    HONV+' '+TENLOT+' '+ TENNV AS HOVATENNV,
    PHONG
    FROM NHANVIEN   
    WHERE MLUONG >= 2000000 AND MLUONG <=3000000

--Liệt kê họ tên đầy đủ của các nhân viên ở “TP HCM”
SELECT 
    HONV + ' ' + TENLOT + ' ' + TENNV AS HOVATEN_NV
    FROM NHANVIEN 
    WHERE DCHI LIKE '%TP HCM%'

-- Liệt kê ngày sinh và địa chỉ của nhân viên “Dinh Ba Tien”
SELECT 
    NGSINH
    FROM NHANVIEN
    WHERE HONV+' '+TENLOT+' '+TENNV = 'Dinh Ba Tien'

--Liệt kê danh sách các thân nhân dưới 18 tuổi của các nhân viên có mã là “NV001”
SELECT 
    TENTN 
    FROM THANNHAN
    WHERE YEAR(GETDATE()) - YEAR(NGSINH) <18 AND MANV = 'NV001'

--Liệt kê danh sách tất cả các nhân viên nữ trên 30 tuổi
SELECT *
    FROM NHANVIEN
    WHERE YEAR(GETDATE()) - YEAR(NGSINH) > 30 AND PHAI = 'Nu'

--Với mỗi phòng ban, liệt kê tên phòng ban và địa điểm phòng
SELECT 
    TENPHG,
    DIADIEM AS DIADIEM_PHG
    FROM PHONGBAN
    INNER JOIN DIADIEM_PHG ON PHONGBAN.MAPHG = DIADIEM_PHG.MAPHG

--Liệt kê tên những người trưởng phòng của từng phòng ban
SELECT 
    HONV + ' ' + TENLOT + ' ' + TENNV AS TEN_TRPHG,
    TENPHG
    FROM PHONGBAN
    INNER JOIN NHANVIEN ON PHONGBAN.TRPHG = NHANVIEN.MANV

--Liệt kê TENDA, MADA, DDIEM_DA, PHONG, TENPHG, MAPHG, TRPHG, NGNC
SELECT
    TENDA,MADA,DDIEM_DA,TENPHG,DEAN.MAPHG,TRPHG,NGNC
    FROM DEAN 
    INNER JOIN PHONGBAN ON DEAN.MAPHG = PHONGBAN.MAPHG

--Liệt kê tên và địa chỉ của tất cả các nhân viên của phòng "Nghien cuu"
SELECT *
    FROM NHANVIEN   
    INNER JOIN PHONGBAN ON NHANVIEN.PHONG = PHONGBAN.MAPHG
    WHERE TENPHG = 'Nghien cuu'

--Liệt kê tên những nữ nhân viên và tên người thân của họ

SELECT 
    HONV +' '+ TENLOT+' '+TENNV AS HOVATEN_NV,
    TENTN 
    FROM NHANVIEN
    INNER JOIN THANNHAN ON THANNHAN.MANV = NHANVIEN.MANV
    WHERE NHANVIEN.PHAI = 'Nu'

-- Liệt kê mã số và tên những nhân viên thuộc phòng “Nghien Cuu” tham gia đề án “Tin Hoc Hoa” với thời
--gian làm việc 20 giờ/tuần
SELECT 
    PHANCONG.MANV,
    HONV+' '+TENLOT+' '+TENNV AS HOVATEN_NV
    FROM PHANCONG
    INNER JOIN NHANVIEN ON PHANCONG.MANV = NHANVIEN.MANV
    INNER JOIN PHONGBAN ON NHANVIEN.PHONG = PHONGBAN.MAPHG
    INNER JOIN DEAN ON PHANCONG.MADA = DEAN.MADA
    WHERE TENPHG ='Nghien Cuu' AND TENDA LIKE'Tin hoc hoa%' AND THOIGIAN =20

--Với mọi đề án ở "Ha Noi", liệt kê các mã số đề án (MADA), mã số phòng ban chủ trì đề án
--(PHONG), họ tên trưởng phòng (HONV, TENLOT, TENNV) cũng như địa chỉ (DCHI) và ngày sinh (NGSINH) của
--người ấy

SELECT 
    MADA,
    DEAN.MAPHG,
    HONV+' '+TENLOT+' '+TENNV AS HOVATEN_TRPHG,
    DCHI,
    NGSINH
    FROM DEAN
    INNER JOIN PHONGBAN ON DEAN.MAPHG = PHONGBAN.MAPHG
    INNER JOIN NHANVIEN ON PHONGBAN.TRPHG = NHANVIEN.MANV
    WHERE DDIEM_DA ='HANOI'

-- Với mỗi nhân viên, liệt kê họ tên nhân viên và họ tên người quản lý trực tiếp của nhân viên đó
SELECT 
    NV.HONV + ' '+NV.TENLOT+' '+NV.TENNV AS HOVATEN_NV,
    TR.HONV+ ' '+TR.TENLOT + ' ' + TR.TENNV AS HOVATEN_NQL
    FROM NHANVIEN NV  
    LEFT JOIN NHANVIEN TR ON NV.MA_NQL = TR.MANV

-- Với mỗi nhân viên, liệt kê họ tên nhân viên và họ tên trưởng phòng của phòng ban mà nhân viên đó làm
--việc
SELECT 
    NV.HONV + ' '+NV.TENLOT+' '+NV.TENNV AS HOVATEN_NV,
    TR.HONV+ ' '+TR.TENLOT + ' ' + TR.TENNV AS HOVATEN_TRPHG
    FROM NHANVIEN NV  
    INNER JOIN PHONGBAN ON NV.PHONG = PHONGBAN.MAPHG
    INNER JOIN NHANVIEN TR ON PHONGBAN.TRPHG = TR.MANV

--Liệt kê họ tên nhân viên (HONV, TENLOT, TENNV) và tên các đề án mà nhân viên ấy tham gia nếu có
SELECT 
    NV.HONV + ' '+NV.TENLOT+' '+NV.TENNV AS HOVATEN_NV,
    TENDA
    FROM NHANVIEN NV
    LEFT JOIN PHANCONG ON NV.MANV = PHANCONG.MANV
    INNER JOIN DEAN ON PHANCONG.MADA = DEAN.MADA

--18. Với mỗi đề án, liệt kê tên đề án (TENDA) và tổng số giờ làm việc một tuần của tất cả các nhân viên tham
--dự đề án đó

SELECT 
    TENDA,
    SUM(THOIGIAN) AS TONGSOGIO
    FROM PHANCONG
    INNER JOIN DEAN ON PHANCONG.MADA = DEAN.MADA
    GROUP BY TENDA

--Với mỗi nhân viên, liệt kê họ và tên nhân viên và nhân viên đó có bao nhiêu thân nhân

SELECT 
    NV.HONV+' '+NV.TENLOT+' '+NV.TENNV AS HOVATEN_NV,
    COUNT(MATN) AS SLTHANNHAN
    FROM NHANVIEN NV 
    LEFT JOIN THANNHAN ON NV.MANV = THANNHAN.MANV
    GROUP BY NV.HONV,NV.TENLOT,NV.TENNV

--Với mỗi phòng ban, liệt kê tên phòng ban (TENPHG) và lương trung bình của những nhân viên làm việc cho
--phòng ban đó

SELECT
    TENPHG,
    AVG(MLUONG) AS MLUONGTB
    FROM PHONGBAN
    INNER JOIN NHANVIEN ON NHANVIEN.PHONG = PHONGBAN.MAPHG
    GROUP BY TENPHG

--Cho biết lương trung bình của tất cả các nữ nhân viên
SELECT 
    AVG(MLUONG) AS MLUONGTB
    FROM NHANVIEN 
    GROUP BY PHAI
    HAVING PHAI = 'Nu'

---Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và số lượng nhân viên của
-- phòng ban đó
SELECT
    TENPHG,
    COUNT(MANV) AS SLUONG_NV
    FROM PHONGBAN
    INNER JOIN NHANVIEN ON NHANVIEN.PHONG = PHONGBAN.MAPHG
    GROUP BY TENPHG
    HAVING AVG(MLUONG)>30000

 --Liệt kê danh sách các đề án (MADA) có: nhân công với họ (HONV) là ‘Dinh’ hoặc có người trưởng phòng
--chủ trì đề án với họ (HONV) là ‘Dinh
SELECT 
    PC.MADA
    FROM PHANCONG PC 
    WHERE PC.MANV IN (
        SELECT PC2.MANV 
        FROM PHANCONG PC2 
        INNER JOIN NHANVIEN NV ON PC2.MANV = NV.MANV
        WHERE NV.HONV ='Dinh'
    )
    OR PC.MANV IN(
        SELECT NV2.MANV
        FROM PHANCONG PC3
        INNER JOIN DEAN ON PC.MADA = DEAN.MADA
        INNER JOIN PHONGBAN ON DEAN.MAPHG = PHONGBAN.MAPHG
        INNER JOIN NHANVIEN NV2 ON PHONGBAN.TRPHG = NV2.MANV
        WHERE NV2.HONV = 'Dinh'
    )

--Liệt kê danh sách những nhân viên (HONV, TENLOT, TENNV) có trên 2 thân nhân
SELECT 
    NV.HONV + ' ' + NV.TENLOT + ' '+ NV.TENNV AS HOVATEN_NV
    FROM NHANVIEN NV  
    WHERE NV.MANV IN (
        SELECT NV2.MANV
        FROM NHANVIEN NV2
        INNER JOIN THANNHAN ON THANNHAN.MANV = NV2.MANV
        GROUP BY NV2.MANV
        HAVING COUNT(MATN) >2
    )

-- Liệt kê danh sách những nhân viên (HONV, TENLOT, TENNV) không có thân nhân nào
SELECT 
    NV.HONV + ' ' + NV.TENLOT + ' '+ NV.TENNV AS HOVATEN_NV
    FROM NHANVIEN NV  
    WHERE MANV NOT IN (
        SELECT TN.MANV
        FROM THANNHAN TN
    )

-- Liệt kê danh sách những trưởng phòng (HONV, TENLOT, TENNV) có tối thiểu một thân nhân
SELECT 
    NV.HONV + ' ' + NV.TENLOT + ' '+ NV.TENNV AS HOVATEN_TRPHG
    FROM NHANVIEN NV
    WHERE NV.MANV IN (
        SELECT TN.MANV 
        FROM THANNHAN TN
        INNER JOIN PHONGBAN ON TN.MANV = PHONGBAN.TRPHG
    )

---Liệt kê họ tên của những trưởng phòng chưa có gia đình
SELECT 
    NV.HONV + ' ' + NV.TENLOT + ' '+ NV.TENNV AS HOVATEN_TRPHG
    FROM NHANVIEN NV 
    INNER JOIN PHONGBAN ON NV.MANV = PHONGBAN.TRPHG
    WHERE NV.MANV NOT IN (
        SELECT TN.MANV 
        FROM THANNHAN TN 
        INNER JOIN PHONGBAN ON TN.MANV = PHONGBAN.TRPHG
        WHERE QUANHE ='Con' OR QUANHE ='Vo Chong'
    )

--Liệt kê họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình của phòng
--"Nghien cuu"
SELECT
    NV.HONV + ' ' + NV.TENLOT + ' '+ NV.TENNV AS HOVATEN_NV
    FROM NHANVIEN NV
    WHERE MLUONG > (
        SELECT AVG (NV2.MLUONG) 
        FROM NHANVIEN NV2
        INNER JOIN PHONGBAN ON NV2.PHONG = PHONGBAN.MAPHG
        GROUP BY TENPHG
        HAVING TENPHG = 'Nghien Cuu'
    )

-- Liệt kê tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất
SELECT 
    NV.HONV + ' ' + NV.TENLOT + ' '+ NV.TENNV AS HOVATEN_TRPHG,
    TENPHG 
    FROM NHANVIEN NV  
    INNER JOIN PHONGBAN ON NV.MANV = PHONGBAN.TRPHG
    WHERE MAPHG IN (
        SELECT NV2.PHONG 
        FROM NHANVIEN NV2 
        GROUP BY NV2.PHONG 
        HAVING COUNT(NV2.MANV) >= (
            SELECT MAX(SLTONG) 
                FROM (
                    SELECT
                    COUNT(NV3.MANV) AS SLTONG
                    FROM NHANVIEN NV3
                    GROUP BY NV3.PHONG
                
                ) AS SL_MAX
        )
    )

--- c2
WITH TONGSL AS(
    SELECT 
    PHONG,
    COUNT(MANV) AS TONGSLNV
    FROM NHANVIEN
    GROUP BY PHONG
),
SLMAX AS (
    SELECT MAX(TONGSLNV) AS MAXSL FROM TONGSL
)
SELECT 
    TENPHG,
    NV.HONV + ' ' + NV.TENLOT + ' '+ NV.TENNV AS HOVATEN_TRPHG
    FROM NHANVIEN NV  
    INNER JOIN PHONGBAN ON NV.MANV = PHONGBAN.TRPHG
    WHERE NV.PHONG IN (
        SELECT TONGSL.PHONG
        FROM TONGSL
        INNER JOIN SLMAX ON TONGSL.TONGSLNV = SLMAX.MAXSL
    )

--Liệt kê họ tên (HONV, TENLOT, TENNV) và địa chỉ (DCHI) của những nhân viên làm việc cho một đề án ở
--‘TP HCM’ nhưng phòng ban mà họ trực thuộc lại không tọa lạc ở thành phố ‘TP HCM’

WITH MANV_DA_TPHCM AS(
    SELECT MANV 
    FROM PHANCONG 
    INNER JOIN DEAN ON PHANCONG.MADA = DEAN.MADA
    WHERE DDIEM_DA ='TPHCM'

),
MANV_PHG_TPHCM AS(
    SELECT PHANCONG.MANV
    FROM PHANCONG
    INNER JOIN NHANVIEN ON PHANCONG.MANV = NHANVIEN.MANV
    INNER JOIN DIADIEM_PHG ON NHANVIEN.PHONG = DIADIEM_PHG.MAPHG
    WHERE DIADIEM ='TPHCM'

)
SELECT 
    NV.HONV + ' ' + NV.TENLOT + ' '+ NV.TENNV AS HOVATEN_NV,
    DCHI 
    FROM NHANVIEN NV  
    WHERE NV.MANV IN (
        SELECT MANV 
        FROM MANV_DA_TPHCM 
    )
    AND NV.MANV NOT IN(
        SELECT MANV
        FROM MANV_PHG_TPHCM
    )
   
--31. (dạng tổng quát của câu 30) Liệt kê họ tên và địa chỉ của các nhân viên làm việc cho một đề án ở một
--thành phố nhưng phòng ban mà họ trực thuộc lại không toạ lạc ở thành phố đó

SELECT 
    NV.HONV + ' ' + NV.TENLOT + ' '+ NV.TENNV AS HOVATEN_NV,
    DCHI 
    FROM NHANVIEN NV  
    INNER JOIN PHANCONG PC2 ON NV.MANV = PC2.MANV
    WHERE NV.MANV NOT IN (
        SELECT PC.MANV 
        FROM PHANCONG PC
        INNER JOIN DEAN DA ON PC.MADA = DA.MADA
        INNER JOIN NHANVIEN NV2 ON PC.MANV = NV2.MANV
        INNER JOIN DIADIEM_PHG ON NV2.PHONG = DIADIEM_PHG.MAPHG
        WHERE DA.DDIEM_DA = DIADIEM_PHG.DIADIEM
    )

--32. Liệt kê danh sách những nhân viên (HONV, TENLOT, TENNV) làm việc trong mọi đề án của công ty

WITH SLDA AS(
    SELECT COUNT(*) AS SL 
    FROM DEAN
)
SELECT 
    NV.HONV + ' ' + NV.TENLOT + ' '+ NV.TENNV AS HOVATEN_NV
    FROM NHANVIEN NV  
    INNER JOIN PHANCONG PC ON NV.MANV = PC.MANV 
    GROUP BY NV.HONV,NV.TENLOT,NV.TENNV
    HAVING COUNT(PC.MADA) = (SELECT SL FROM SLDA)

---Liệt kê danh sách những nhân viên (HONV, TENLOT, TENNV) được phân công tất cả đề án do phòng số
--“Nghien cuu” chủ trì
WITH SLDA_NC AS(
    SELECT COUNT(MADA) AS SL 
    FROM DEAN
    INNER JOIN PHONGBAN ON DEAN.MAPHG = PHONGBAN.MAPHG
    WHERE TENPHG = 'Nghien Cuu'
)
SELECT
    NV.HONV + ' ' + NV.TENLOT + ' '+ NV.TENNV AS HOVATEN_NV
    FROM NHANVIEN NV  
    INNER JOIN PHANCONG PC ON NV.MANV = PC.MANV 
    INNER JOIN DEAN DA ON PC.MADA = DA.MADA
    INNER JOIN PHONGBAN PHG ON DA.MAPHG = PHG.MAPHG
    WHERE TENPHG = 'Nghien Cuu'
    GROUP BY NV.HONV,NV.TENLOT,NV.TENNV
    HAVING COUNT(PC.MADA) = (SELECT SL FROM SLDA_NC)

--Liệt kê danh sách họ tên nhân viên tham gia tất cả các đề án do phòng ban của nhân viên đó trực thuộc
-- chủ trì

WITH SLDA AS(
    SELECT MANV,
    COUNT(MADA) AS SL
    FROM NHANVIEN 
    INNER JOIN DEAN ON NHANVIEN.PHONG = DEAN.MAPHG
    GROUP BY MANV
),
SLPC AS(
    SELECT PHANCONG.MANV,
    COUNT(PHANCONG.MADA) AS SL
    FROM PHANCONG
    INNER JOIN DEAN DA ON PHANCONG.MADA = DA.MADA
    INNER JOIN NHANVIEN ON NHANVIEN.MANV = PHANCONG.MANV
    WHERE NHANVIEN.PHONG = DA.MAPHG
    GROUP BY PHANCONG.MANV
)
SELECT 
    NV.HONV + ' ' + NV.TENLOT + ' '+ NV.TENNV AS HOVATEN_NV
    FROM NHANVIEN NV 
    WHERE NV.MANV IN (
        SELECT SLPC.MANV 
        FROM SLPC
        INNER JOIN SLDA ON SLPC.SL = SLDA.SL
    )

