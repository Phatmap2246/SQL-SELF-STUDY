CREATE DATABASE QLCHUYENBAY
GO

-- CREATE TABLE
CREATE TABLE CHUYENBAY(
    MACB CHAR(5) PRIMARY KEY,
    GADI VARCHAR(50),
    GADEN VARCHAR(50),
    DODAI INT,
    GIODI TIME,
    GIODEN TIME,
    CHIPHI INT
)
GO

CREATE TABLE MAYBAY(
    MAMB INT PRIMARY KEY,
    HIEU VARCHAR(50),
    TAMBAY FLOAT
)

CREATE TABLE NHANVIEN(
    MANV CHAR(9) PRIMARY KEY,
    TEN VARCHAR(50),
    LUONG FLOAT
)

CREATE TABLE CHUNGNHAN(
    MANV CHAR(9),
    MAMB INT,
    PRIMARY KEY(MANV,MAMB)
)

-- ADD DATA

INSERT INTO CHUYENBAY (MACB, GADI, GADEN, DODAI, GIODI, GIODEN, CHIPHI) VALUES
('VN431', 'SGN', 'CAH', 3693, '05:55', '06:55', 236),
('VN320', 'SGN', 'DAD', 2798, '06:00', '07:10', 221),
('VN464', 'SGN', 'DLI', 2002, '07:20', '08:05', 225),
('VN216', 'SGN', 'DIN', 4170, '10:30', '14:20', 262),
('VN280', 'SGN', 'HPH', 11979, '06:00', '08:00', 1279),
('VN254', 'SGN', 'HUI', 8765, '18:40', '20:00', 781),
('VN338', 'SGN', 'BMV', 4081, '15:25', '16:25', 375),
('VN440', 'SGN', 'BMV', 4081, '18:30', '19:30', 426),
('VN651', 'DAD', 'SGN', 2798, '19:30', '08:00', 221),
('VN276', 'DAD', 'CXR', 1283, '09:00', '12:00', 203),
('VN374', 'HAN', 'VII', 510, '11:40', '13:25', 120),
('VN375', 'VII', 'CXR', 752, '14:15', '16:00', 181),
('VN269', 'HAN', 'CXR', 1262, '14:10', '15:50', 202),
('VN315', 'HAN', 'DAD', 134, '11:45', '13:00', 112),
('VN317', 'HAN', 'UIH', 827, '15:00', '16:15', 190),
('VN741', 'HAN', 'PXU', 395, '06:30', '08:30', 120),
('VN474', 'PXU', 'PQC', 1586, '08:40', '11:20', 102),
('VN476', 'UIH', 'PQC', 485, '09:15', '11:50', 117);
GO

INSERT INTO MAYBAY (MAMB, HIEU, TAMBAY) VALUES
(747, 'Boeing 747 - 400', 13488),
(737, 'Boeing 737 - 800', 5413),
(340, 'Airbus A340 - 300', 11392),
(757, 'Boeing 757 - 300', 6416),
(777, 'Boeing 777 - 300', 10306),
(767, 'Boeing 767 - 400ER', 10360),
(320, 'Airbus A320', 4168),
(319, 'Airbus A319', 2888),
(727, 'Boeing 727', 2406),
(154, 'Tupolev 154', 6565);
GO

INSERT INTO NHANVIEN (MANV, TEN, LUONG) VALUES
('242518965', 'Tran Van Son', 120433),
('141582651', 'Doan Thi Mai', 178345),
('011564812', 'Ton Van Quy', 153972),
('567354612', 'Quan Cam Ly', 256481),
('552455318', 'La Que', 101745),
('550156548', 'Nguyen Thi Cam', 205187),
('390487451', 'Le Van Luat', 212156),
('274878974', 'Mai Quoc Minh', 99890),
('254099823', 'Nguyen Thi Quynh', 24450),
('356187925', 'Nguyen Vinh Bao', 44740),
('355548984', 'Tran Thi Hoai An', 212156),
('310454876', 'Ta Van Do', 212156),
('489456522', 'Nguyen Thi Quy Linh', 127984),
('489221823', 'Bui Quoc Chinh', 23980),
('548977562', 'Le Van Quy', 84476),
('310454877', 'Tran Van Hao', 33546),
('142519864', 'Nguyen Thi Xuan Dao', 227489),
('269734834', 'Truong Tuan Anh', 289950),
('287321212', 'Duong Van Minh', 48090),
('552455348', 'Bui Thi Dung', 92013),
('248965255', 'Tran Thi Ba', 43723),
('159542516', 'Le Van Ky', 48250),
('348121549', 'Nguyen Van Thanh', 32899),
('574489457', 'Bui Van Lap', 20);
GO

INSERT INTO CHUNGNHAN (MANV, MAMB) VALUES
('567354612', 747), ('567354612', 737), ('567354612', 757), ('567354612', 777), ('567354612', 767), ('567354612', 727), ('567354612', 340),
('552455318', 737), ('552455318', 319), ('552455318', 747), ('552455318', 767),
('390487451', 340), ('390487451', 320), ('390487451', 319),
('274878974', 757), ('274878974', 767),
('355548984', 154),
('310454876', 154),
('142519864', 747), ('142519864', 757), ('142519864', 777), ('142519864', 767), ('142519864', 737), ('142519864', 340), ('142519864', 320),
('269734834', 747), ('269734834', 737), ('269734834', 340), ('269734834', 757), ('269734834', 777), ('269734834', 767), ('269734834', 320), ('269734834', 319), ('269734834', 727), ('269734834', 154),
('242518965', 737), ('242518965', 757),
('141582651', 737), ('141582651', 757), ('141582651', 767),
('011564812', 737), ('011564812', 757),
('574489457', 154);
GO

--ADD FOREIGN KEY

ALTER TABLE CHUNGNHAN
    ADD CONSTRAINT FK_MANV_CN FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV),
        CONSTRAINT FK_MAMB_CN FOREIGN KEY (MAMB) REFERENCES MAYBAY(MAMB) 
    
GO


--PRACTICE

--Cho biết mã số của các phi công lái máy báy Boeing.
SELECT DISTINCT
    MANV 
    FROM CHUNGNHAN CN 
    INNER JOIN MAYBAY MB ON CN.MAMB = MB.MAMB
    WHERE MB.HIEU LIKE '%Boeing%'

--Cho biết tên của các phi công lái máy bay Boeing

SELECT 
    TEN
    FROM NHANVIEN NV  
    INNER JOIN CHUNGNHAN CN ON CN.MANV = NV.MANV
    INNER JOIN MAYBAY MB ON CN.MAMB = MB.MAMB
    WHERE MB.HIEU LIKE '%Boeing%'

--Cho biết mã số của các máy bay có thể ñược sử dụng ñể thực hiện chuyến bay từ Sài Gòn (SGN)
--ñến Huế (HUI).
WITH TAMBAY_SG_HUE AS(
    SELECT 
        CB.DODAI 
        FROM CHUYENBAY CB 
        WHERE CB.GADI = 'SGN' AND CB.GADEN = 'HUI'
)
SELECT
    MAMB
    FROM MAYBAY
    INNER JOIN TAMBAY_SG_HUE ON MAYBAY.TAMBAY >= TAMBAY_SG_HUE.DODAI



--Tìm các chuyến bay có thể ñược lái bởi các phi công có lương lớn hơn 100,000.
WITH KHOANGCACH AS(
    SELECT 
        MB.TAMBAY
        FROM MAYBAY MB 
        INNER JOIN CHUNGNHAN CN ON CN.MAMB = MB.MAMB
        INNER JOIN NHANVIEN NV ON CN.MANV = NV.MANV
        WHERE NV.LUONG > 100000
)
SELECT 
    CB.MACB 
    FROM CHUYENBAY CB 
    INNER JOIN KHOANGCACH ON CB.DODAI <= KHOANGCACH.TAMBAY

--Cho biết tên các phi công có thể lái các máy có tầm bay lớn hơn 4,800km nhưng không có chứng
--nhận lái máy bay Boeing.
WITH NV_BOEING AS(
    SELECT MANV
    FROM CHUNGNHAN CN
    INNER JOIN MAYBAY MB ON CN.MAMB = MB.MAMB
    WHERE MB.HIEU LIKE '%Boeing%'
),
NV_TAMBAY AS(
    SELECT CN.MANV 
    FROM CHUNGNHAN CN  
    INNER JOIN MAYBAY MB ON CN.MAMB = MB.MAMB 
    WHERE MB.TAMBAY > 4800
)
SELECT 
    MANV 
    FROM NHANVIEN 
    WHERE MANV IN (
        SELECT MANV
        FROM NV_TAMBAY
    )
    AND MANV NOT IN (
        SELECT MANV
        FROM NV_BOEING
    )

--Cho biết mã số của các nhân viên có lương cao nhất.
SELECT 
    MANV 
    FROM NHANVIEN 
    WHERE LUONG >= (
        SELECT 
            MAX(NV.LUONG)
            FROM NHANVIEN NV 
    )

--Cho biết mã số của các nhân viên có lương cao thứ nhì.
SELECT
    MANV 
    FROM NHANVIEN NV
    WHERE NV.LUONG = (
        SELECT MAX(NV.LUONG)
        FROM NHANVIEN NV  
        WHERE NV.LUONG < (
            SELECT MAX (NV2.LUONG)
            FROM NHANVIEN NV2
        )
    )

--Cho biết mã số của các nhân viên có lương cao thứ nhất hoặc thứ nhì.
SELECT 
    MANV 
    FROM NHANVIEN
    WHERE 
        LUONG = (
        SELECT MAX(NV.LUONG) FROM NHANVIEN NV  
        )
    OR  LUONG = (
        SELECT MAX(NV.LUONG) 
        FROM NHANVIEN NV 
        WHERE NV.LUONG < (SELECT MAX(NV2.LUONG) FROM NHANVIEN NV2))

--Cho biết mã số của các phi công có thể lái ñược nhiều loại máy bay nhất.
WITH BANG_KHA_NANG AS(
    SELECT MANV,
    COUNT(MB.HIEU) AS KHA_NANG
    FROM CHUNGNHAN
    INNER JOIN MAYBAY MB ON CHUNGNHAN.MAMB = MB.MAMB
    GROUP BY MANV
), 
KHA_NANG_MAX AS (
    SELECT MAX(KHA_NANG) AS MAX_KN
    FROM BANG_KHA_NANG
)
SELECT 
    MANV 
    FROM BANG_KHA_NANG
    WHERE KHA_NANG >= (SELECT MAX_KN FROM KHA_NANG_MAX)

-- C2 TRUY VAN LONG 
SELECT 
    MANV 
    FROM CHUNGNHAN 
    INNER JOIN MAYBAY MB ON CHUNGNHAN.MAMB = MB.MAMB
    GROUP BY MANV
    HAVING COUNT(MB.HIEU) >= ALL (
        SELECT 
                COUNT(MB2.HIEU)
                FROM CHUNGNHAN CN 
                INNER JOIN MAYBAY MB2 ON CN.MAMB = MB2.MAMB
                GROUP BY CN.MANV
        
    )

--Cho biết mã số của các phi công có thể lái ñược ít loại máy bay nhất.
-- C1
SELECT 
    MANV 
    FROM CHUNGNHAN
    INNER JOIN MAYBAY ON CHUNGNHAN.MAMB = MAYBAY.MAMB 
    GROUP BY MANV 
    HAVING COUNT(MAYBAY.HIEU) <= ALL(
        SELECT 
            COUNT(MB.HIEU)
            FROM CHUNGNHAN CN 
            INNER JOIN MAYBAY MB ON CN.MAMB = MB.MAMB
            GROUP BY CN.MANV
    )

--C2
WITH BANG_KHA_NANG AS(
    SELECT 
        MANV,
        COUNT(HIEU) AS KHA_NANG
        FROM CHUNGNHAN 
        INNER JOIN MAYBAY ON CHUNGNHAN.MAMB = MAYBAY.MAMB
        GROUP BY MANV
),
MIN_KN AS (
    SELECT MIN(KHA_NANG) AS KHA_NANG
    FROM BANG_KHA_NANG
)SELECT 
    MANV 
    FROM BANG_KHA_NANG
    WHERE KHA_NANG <= (SELECT KHA_NANG FROM MIN_KN)

--Cho biết mã số của các phi công chỉ lái ñược 3 loại máy bay.
--C1 
SELECT 
    MANV
    FROM CHUNGNHAN 
    INNER JOIN MAYBAY ON CHUNGNHAN.MAMB = MAYBAY.MAMB
    GROUP BY MANV
    HAVING COUNT(HIEU) =3

--Cho biết tổng số lương phải trả cho các nhân viên
SELECT 
    SUM(LUONG) AS TONG_SO_LUONG
    FROM NHANVIEN

--Cho biết tên các loại máy bay mà tất cả các phi công có thể lái ñều có lương lớn hơn 200,000.
SELECT DISTINCT
    HIEU 
    FROM CHUNGNHAN
    INNER JOIN MAYBAY ON CHUNGNHAN.MAMB = MAYBAY.MAMB
    INNER JOIN NHANVIEN ON CHUNGNHAN.MANV = NHANVIEN.MANV
    WHERE NHANVIEN.LUONG > 200000

--Với mỗi phi công có thể lái nhiều hơn 3 loại máy bay, cho biết mã số phi công và tầm bay lớn
--nhất của các loại máy bay mà phi công ñó có thể lái.

WITH BANG_PHI_CONG AS(
    SELECT MANV
    FROM CHUNGNHAN 
    GROUP BY MANV
    HAVING COUNT (MAMB) >3
)
SELECT 
    CHUNGNHAN.MANV,
    CHUNGNHAN.MAMB,
    TAMBAY AS TAMBAY_TOIDA
    FROM CHUNGNHAN
    INNER JOIN MAYBAY ON CHUNGNHAN.MAMB = MAYBAY.MAMB
    INNER JOIN BANG_PHI_CONG ON CHUNGNHAN.MANV = BANG_PHI_CONG.MANV

--C2
SELECT 
    CN.MANV,
    CN.MAMB,
    MB.TAMBAY
    FROM CHUNGNHAN CN
    INNER JOIN MAYBAY MB ON CN.MAMB = MB.MAMB
    WHERE MANV IN (
        SELECT 
            CN2.MANV
            FROM CHUNGNHAN CN2 
            GROUP BY CN2.MANV
            HAVING COUNT(CN2.MAMB)>3
    )


-- Cho biết tên các phi công có lương nhỏ hơn chi phí thấp nhất của ñường bay từ Sài Gòn (SGN)
--ñến Buôn Mê Thuộc (BMV).

WITH BANG_CHI_PHI AS(
    SELECT
        GADI,
        GADEN,
        MIN(CHIPHI) AS CHIPHI_MIN
        FROM CHUYENBAY
        GROUP BY GADI,GADEN
        HAVING GADI = 'SGN' AND GADEN = 'BMV'
)
SELECT  
    MANV,
    TEN
    FROM NHANVIEN
    INNER JOIN BANG_CHI_PHI ON NHANVIEN.LUONG < BANG_CHI_PHI.CHIPHI_MIN


--C2 
SELECT 
    MANV,
    TEN
    FROM NHANVIEN
    WHERE LUONG < (
        SELECT BANG_CHI_PHI.CHIPHI_MIN
        FROM (
            SELECT GADI,
            GADEN,
            MIN(CHIPHI) AS CHIPHI_MIN
            FROM CHUYENBAY
            GROUP BY GADI, GADEN
            HAVING GADI = 'SGN' AND GADEN = 'BMV'
        ) AS BANG_CHI_PHI
    )

--Với mỗi loại máy bay có tầm bay trên 3200km, cho biết tên của loại máy bay và lương trung bình
--của các phi công có thể lái loại máy bay ñó.
WITH BANG_PHI_CONG AS(
    SELECT MANV 
    FROM CHUNGNHAN 
    INNER JOIN MAYBAY ON CHUNGNHAN.MAMB = MAYBAY.MAMB
    WHERE TAMBAY > 3200
)
SELECT DISTINCT 
    NV.TEN,
    NV.LUONG
    FROM NHANVIEN NV  
    INNER JOIN BANG_PHI_CONG ON NV.MANV = BANG_PHI_CONG.MANV

--C2
SELECT DISTINCT 
    TEN,
    LUONG
    FROM NHANVIEN 
    WHERE MANV IN(
        SELECT 
            MANV
            FROM CHUNGNHAN
            INNER JOIN MAYBAY ON CHUNGNHAN.MAMB = MAYBAY.MAMB
            WHERE MAYBAY.TAMBAY >3200
    )

--Cho biết thông tin của các ñường bay mà tất cả các phi công có thể bay trên ñường bay ñó ñều có
--lương lớn hơn 100,000.


WITH BANG_KHA_NANG AS(
    SELECT 
        MAX(MB.TAMBAY) AS KHA_NANG_MAX
        FROM CHUNGNHAN CN  
        INNER JOIN MAYBAY MB ON CN.MAMB = MB.MAMB
        INNER JOIN NHANVIEN NV ON CN.MANV = NV.MANV
        WHERE NV.LUONG <=100000
)
SELECT
    MACB
FROM CHUYENBAY
WHERE DODAI > (SELECT KHA_NANG_MAX FROM BANG_KHA_NANG)

--Một hành khách muốn ñi từ Hà Nội (HAN) ñến Nha Trang (CXR) mà không phải ñổi chuyến bay
--quá một lần. Cho biết mã chuyến bay và thời gian khởi hành từ Hà Nội nếu hành khách muốn
--ñến Nha Trang trước 16:00.
WITH BANG_CHUYENBAY_NHATRANG AS(
    SELECT
        MACB,
        GADI,
        GADEN,
        GIODI,
        GIODEN
        FROM CHUYENBAY 
        WHERE GADEN = 'CXR' AND GIODEN < '16:00'
),
BANG_CHUYENBAY_HANOI AS (
    SELECT
        MACB,
        GADI,
        GADEN,
        GIODI,
        GIODEN
        FROM CHUYENBAY
        WHERE GADI = 'HAN' AND GIODEN < '16:00'
)
SELECT 
    MACB 
    FROM CHUYENBAY 
    WHERE MACB IN (
        -- KO DOI CHUYEN
        SELECT CB.MACB
        FROM CHUYENBAY CB
        WHERE CB.GADI = 'HAN' AND CB.GADEN = 'CXR' AND CB.GIODEN <'16:00'
    )
    OR MACB IN (
        -- DOI CHUYEN 
    SELECT HN.MACB
    FROM BANG_CHUYENBAY_HANOI HN
    INNER JOIN BANG_CHUYENBAY_NHATRANG NT ON HN.GADEN = NT.GADI
    WHERE HN.GIODEN < NT.GIODI)


--C2 
SELECT 
    MACB,
    GADI,
    GADEN,
    GIODI,
    GIODEN
    FROM CHUYENBAY
    WHERE MACB IN (
        SELECT CB1.MACB
        FROM CHUYENBAY CB1  
        WHERE CB1.GADI = 'HAN' AND CB1.GADEN = 'CXR' AND CB1.GIODEN < '16:00'
    )
    OR MACB IN (
        SELECT CB2.MACB
        FROM CHUYENBAY CB2 
        INNER JOIN CHUYENBAY CB3 ON CB2.GADEN = CB3.GADI
        WHERE CB2.GADI = 'HAN' AND CB3.GADEN = 'CXR' AND CB2.GIODEN < CB3.GIODI AND CB3.GIODEN < '16:00'
    )

-- C3
SELECT 
    MACB,
    GADI,
    GADEN,
    GIODI,
    GIODEN
    FROM CHUYENBAY 
    WHERE GADI = 'HAN' AND GADEN = 'CXR' AND GIODEN <'16:00' -- KO DOI
    -- DOI CHUYEN
    UNION --UNION TU DONG GOP CAC DONG LAI THANH 1 BANG ( THEO CHIEU DOC) !!! KHAC PHEP JOIN
    SELECT 
    CB1.MACB,
    CB1.GADI,
    CB1.GADEN,
    CB1.GIODI,
    CB1.GIODEN
    FROM CHUYENBAY CB1
    INNER JOIN CHUYENBAY CB2 ON CB1.GADEN = CB2.GADI
    WHERE 
        CB1.GADI = 'HAN' 
        AND CB2.GADEN = 'CXR' 
        AND CB1.GIODEN < CB2.GIODI
        AND CB2.GIODEN < '16:00'


--Tìm các chuyến bay có thể ñược thực hiện bởi tất cả các loại máy bay Boeing.
WITH BANG_KHA_NANG_MB AS(
    SELECT 
        HIEU,
        MIN(TAMBAY) AS TAMBAY_MAX
        FROM MAYBAY
        GROUP BY HIEU
        HAVING HIEU LIKE'%Boeing%'
),TAMBAY_MIN_BOE AS (
    SELECT MIN (TAMBAY_MAX) AS KHA_NANG_MIN
    FROM BANG_KHA_NANG_MB
)
SELECT DISTINCT
    MACB, 
    DODAI
    FROM CHUYENBAY 
    WHERE DODAI <= (SELECT KHA_NANG_MIN FROM TAMBAY_MIN_BOE)

-- C2
SELECT DISTINCT
    MACB,
    DODAI
    FROM CHUYENBAY
    WHERE DODAI <= ALL(
        SELECT 
            TAMBAY
            FROM MAYBAY
            WHERE HIEU LIKE'%Boeing%'
    )

--Cho biết tên và lương của các nhân viên không phải là phi công và có lương lớn hơn lương trung
-- bình của tất cả các phi công
WITH BANG_LTB_PHI_CONG AS (
    SELECT AVG(LUONG) AS LTB
    FROM NHANVIEN
    INNER JOIN CHUNGNHAN ON CHUNGNHAN.MANV = NHANVIEN.MANV
)
SELECT
    TEN,
    LUONG
    FROM NHANVIEN
    WHERE MANV NOT IN (
        SELECT CN.MANV
        FROM CHUNGNHAN CN 
    )
    AND LUONG > (SELECT LTB FROM BANG_LTB_PHI_CONG)

--C2
SELECT 
    TEN,
    LUONG
    FROM NHANVIEN
    WHERE MANV NOT IN(
        SELECT CN.MANV 
        FROM CHUNGNHAN CN 
    ) 
    AND LUONG > (
        SELECT 
            AVG (NV.LUONG) AS LTB
            FROM NHANVIEN NV 
            INNER JOIN CHUNGNHAN CN ON NV.MANV = CN.MANV 
    )


--Cho biết tên các phi công chỉ lái các loại máy bay có tầm bay xa hơn 3200km.
WITH NHANVIEN_LAI_DUOI_3200KM AS (
    SELECT MANV
    FROM CHUNGNHAN 
    INNER JOIN MAYBAY ON CHUNGNHAN.MAMB = MAYBAY.MAMB
    WHERE TAMBAY <= 3200
)
SELECT 
    TEN
    FROM NHANVIEN
    WHERE MANV NOT IN (
        SELECT MANV FROM NHANVIEN_LAI_DUOI_3200KM
    )

--Cho biết tên các phi công lái ít nhất 3 loại máy bay có tầm bay xa hơn 3200km.
WITH NHANVIEN_DAT AS (
    SELECT 
        MANV,
        COUNT(DISTINCT HIEU) AS KHA_NANG
        FROM CHUNGNHAN 
        INNER JOIN MAYBAY ON CHUNGNHAN.MAMB = MAYBAY.MAMB
        WHERE TAMBAY > 3200
        GROUP BY MANV 
        HAVING COUNT( DISTINCT HIEU) >=3
)
SELECT 
    TEN
    FROM NHANVIEN
    WHERE MANV IN (
        SELECT MANV FROM NHANVIEN_DAT
    )

--Cho biết tên các phi công chỉ lái các loại máy bay có tầm bay xa hơn 3200km và một trong số ñó
--là Boeing.

SELECT 
    TEN 
    FROM NHANVIEN 
    WHERE MANV NOT IN (
        SELECT 
            CN.MANV
            FROM CHUNGNHAN CN
            INNER JOIN MAYBAY MB ON CN.MAMB = MB.MAMB 
            WHERE MB.TAMBAY <= 3200
    )
    AND MANV IN (
        SELECT DISTINCT
            CN2.MANV 
        FROM CHUNGNHAN CN2
        INNER JOIN MAYBAY MB2 ON CN2.MAMB = MB2.MAMB 
        WHERE MB2.HIEU LIKE '%Boeing%'
    )

--Với mỗi nhân viên cho biết mã số, tên nhân viên và tổng số loại máy bay mà nhân viên ñó có thể
--lái.

SELECT 
    NV.TEN,
    CN.MANV,
    COUNT(*) AS KHA_NANG
    FROM NHANVIEN NV 
    INNER JOIN CHUNGNHAN CN ON NV.MANV = CN.MANV
    GROUP BY NV.TEN,CN.MANV

--Với mỗi loại máy bay cho biết loại máy bay và tổng số phi công có thể lái loại máy bay ñó.
SELECT
    MB.HIEU,
    COUNT(*) AS SO_PHICONG_LAI
    FROM MAYBAY MB 
    INNER JOIN CHUNGNHAN CN ON MB.MAMB = CN.MAMB 
    GROUP BY MB.HIEU

--Với mỗi loại máy bay cho biết loại máy bay và tổng số phi công có lương lớn hơn 100,000 có thể
--lái loại máy bay ñó
SELECT 
    MB.HIEU,
    COUNT(*) AS SO_PHICONG
    FROM MAYBAY MB 
    INNER JOIN CHUNGNHAN CN ON MB.MAMB = CN.MAMB 
    INNER JOIN NHANVIEN NV ON CN.MANV = NV.MANV 
    WHERE NV.LUONG > 100000
    GROUP BY MB.HIEU

--Với mỗi chuyến bay cho biết mã số chuyến bay và tổng số loại máy bay không thể thực hiện
--chuyến bay ñó.
SELECT 
    MACB,
    COUNT(*) AS SO_LUONG_MBAY_KO_DU_DK
    FROM CHUYENBAY
    LEFT JOIN MAYBAY ON CHUYENBAY.DODAI > MAYBAY.TAMBAY
    GROUP BY MACB

go 
--Tìm các phi công có thể lái tất cả các loại máy bay.

WITH BANG_KHA_NANG_PHICONG AS (
    SELECT 
        MANV,
        COUNT(*) AS SLUONG
        FROM CHUNGNHAN
        GROUP BY MANV
), SOLUONG_MAYBAY AS (
    SELECT COUNT(HIEU) AS SL FROM MAYBAY
)
SELECT 
    *
    FROM BANG_KHA_NANG_PHICONG 
    INNER JOIN NHANVIEN ON NHANVIEN.MANV = BANG_KHA_NANG_PHICONG.MANV
    WHERE SLUONG = (SELECT SL FROM SOLUONG_MAYBAY)

--Tìm các phi công có thể lái tất cả các loại máy bay Boeing.
WITH BANG_KHA_NANG_PHICONG_BOE AS (
    SELECT 
        CN.MANV,
        COUNT(*) AS SLUONG 
        FROM CHUNGNHAN CN 
        INNER JOIN MAYBAY MB ON CN.MAMB = MB.MAMB 
        WHERE MB.HIEU LIKE '%Boeing%'
        GROUP BY CN.MANV
), SLUONG_BOE AS (
    SELECT 
        COUNT(HIEU) AS SL
        FROM MAYBAY
        WHERE  
            HIEU LIKE '%Boeing%' 
)
SELECT 
    NV.TEN,
    KN.SLUONG
    FROM NHANVIEN NV 
    INNER JOIN BANG_KHA_NANG_PHICONG_BOE KN ON KN.MANV = NV.MANV 
    WHERE KN.SLUONG = (SELECT SL FROM SLUONG_BOE)