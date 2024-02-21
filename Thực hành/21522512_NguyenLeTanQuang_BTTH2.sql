CREATE DATABASE QuanLyDeTai;

USE QuanLyDeTai;

CREATE TABLE SinhVien (
    MSSV CHAR(8) PRIMARY KEY,
    TENSV NVARCHAR(30) NOT NULL,
    SODT VARCHAR(10) NOT NULL,
    LOP CHAR(10) NOT NULL,
    DIACHI NCHAR(50) NOT NULL
);

CREATE TABLE DeTai (
    MSDT CHAR(6) PRIMARY KEY,
    TENDT NVARCHAR(30) NOT NULL
);

CREATE TABLE SV_DETAI (
    MSSV CHAR(8),
    MSDT CHAR(6),
    PRIMARY KEY (MSSV, MSDT),
    FOREIGN KEY (MSSV) REFERENCES SINHVIEN(MSSV),
    FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)
);

CREATE TABLE GIAOVIEN (
    MSGV INT PRIMARY KEY,
    TENGV NVARCHAR(30) NOT NULL,
    DIACHI NVARCHAR(50) NOT NULL,
    SODT VARCHAR(10) NOT NULL,
    MSHH INT,
    FOREIGN KEY (MSHH) REFERENCES HOCHAM(MSHH)
);

ALTER TABLE GIAOVIEN
ADD NAMHH SMALLDATETIME NOT NULL;

CREATE TABLE HOCHAM (
    MSHH INT PRIMARY KEY,
    TENHH NVARCHAR(20) NOT NULL
);

CREATE TABLE HOCVI (
    MSHV INT PRIMARY KEY,
    TENHV NVARCHAR(20) NOT NULL
);

CREATE TABLE CHUYENNGANH (
    MSCN INT PRIMARY KEY,
    TENCN NVARCHAR(30) NOT NULL
);

CREATE TABLE GV_HV_CN (
    MSGV INT,
    MSHV INT,
    MSCN INT,
    NAM SMALLDATETIME,
    PRIMARY KEY (MSGV, MSHV, MSCN),
    FOREIGN KEY (MSGV) REFERENCES GIAOVIEN(MSGV),
    FOREIGN KEY (MSHV) REFERENCES HOCVI(MSHV),
    FOREIGN KEY (MSCN) REFERENCES CHUYENNGANH(MSCN)
);

CREATE TABLE GV_HDDT (
    MSGV INT,
    MSDT CHAR(6),
    DIEM FLOAT NOT NULL,
    PRIMARY KEY (MSGV, MSDT),
    FOREIGN KEY (MSGV) REFERENCES GIAOVIEN(MSGV),
    FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT),
);

CREATE TABLE GV_PBDT (
    MSGV INT,
    MSDT CHAR(6),
    DIEM FLOAT NOT NULL,
    PRIMARY KEY (MSGV, MSDT),
    FOREIGN KEY (MSGV) REFERENCES GIAOVIEN(MSGV),
    FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)
);

CREATE TABLE GV_UVDT (
    MSGV INT,
    MSDT CHAR(6),
    DIEM FLOAT NOT NULL,
    PRIMARY KEY (MSGV, MSDT),
    FOREIGN KEY (MSGV) REFERENCES GIAOVIEN(MSGV),
    FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)
);

CREATE TABLE HOIDONG (
    MSHD INT PRIMARY KEY,
    PHONG INT,
    TGBD SMALLDATETIME,
    NGAYHD SMALLDATETIME NOT NULL,
    TINHTRANG NVARCHAR(30) NOT NULL,
    MSGV INT,
    FOREIGN KEY (MSGV) REFERENCES GIAOVIEN(MSGV)
);

CREATE TABLE HOIDONG_GV (
    MSHD INT,
    MSGV INT,
    PRIMARY KEY (MSHD, MSGV),
    FOREIGN KEY (MSHD) REFERENCES HOIDONG(MSHD),
    FOREIGN KEY (MSGV) REFERENCES GIAOVIEN(MSGV)
);

CREATE TABLE HOIDONG_DT (
    MSHD INT,
    MSDT CHAR(6),
    QUYETDINH NCHAR(10),
    PRIMARY KEY (MSHD, MSDT),
    FOREIGN KEY (MSHD) REFERENCES HOIDONG(MSHD),
    FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)
);

INSERT INTO SINHVIEN (MSSV, TENSV, SODT, LOP, DIACHI)
VALUES 
    ('13520001', 'Nguy?n Van An', '0906762255', 'SE103.U32', 'TH? Ð?C'),
    ('13520002', 'Phan T?n Ð?t', '0975672350', 'IE204.T21', 'QU?N 1'),
    ('13520003', 'Nguy?n Anh H?i', '0947578688', 'IE205.R12', 'QU?N 9'),
    ('13520004', 'Ph?m Tài', '0956757869', 'IE202.A22', 'QU?N 1'),
    ('13520005', 'Lê Thúy H?ng', '0976668688', 'SE304.E22', 'TH? Ð?C'),
    ('13520006', 'Ung H?ng Ân', '0957475898', 'IE208.F33', 'QU?N 2');

INSERT INTO DETAI (MSDT, TENDT)
VALUES 
    ('97001', 'Qu?n lý thu vi?n'),
    ('97002', 'Nh?n d?ng vân tay'),
    ('97003', 'Bán d?u giá trên m?ng'),
    ('97004', 'Qu?n lý siêu th?'),
    ('97005', 'X? lý ?nh'),
    ('97006', 'H? gi?i toán thông minh');

INSERT INTO SV_DETAI (MSSV, MSDT)
VALUES 
    ('13520001', '97004'),
    ('13520002', '97005'),
    ('13520003', '97001'),
    ('13520004', '97002'),
    ('13520005', '97003'),
    ('13520006', '97005');

INSERT INTO HOCHAM (MSHH, TENHH)
VALUES 
    (1, N'PHÓ GIÁO SU'),
    (2, N'GIÁO SU');


INSERT INTO GIAOVIEN (MSGV, TENGV, DIACHI, SODT, MSHH, NAMHH)
VALUES 
    ('00201', N'Tr?n Trung', N'B?n Tre', '35353535', 1, 1996),
    ('00202', N'Nguy?n Van An', N'Ti?n Giang', '67868688', 1, 1996),
    ('00203', N'Tr?n Thu Trang', N'C?n Tho', '74758687', 1, 1996),
    ('00204', N'Nguy?n Th? Loan', N'TP. HCM', '56575868', 2, 2005),
    ('00205', N'Chu Ti?n', N'Hà N?i', '46466646', 2, 2005);

INSERT INTO HOCVI (MSHV, TENHV)
VALUES 
    (1, N'K? su'),
    (2, N'C? nhân'),
    (3, N'Th?c si'),
    (4, N'Ti?n si'),
    (5, N'Ti?n si Khoa h?c');

INSERT INTO CHUYENNGANH (MSCN, TENCN)
VALUES 
    (1, N'Công ngh? Web'),
    (2, N'M?ng xã h?i'),
    (3, N'Qu?n lý CNTT'),
    (4, N'GIS');

INSERT INTO GV_HV_CN (MSGV, MSHV, MSCN, NAM)
VALUES 
    ('00201', 1, 1, 2013),
    ('00201', 1, 2, 2013),
    ('00201', 2, 1, 2014),
    ('00202', 3, 2, 2013),
    ('00203', 2, 4, 2014),
    ('00204', 3, 2, 2014);

INSERT INTO GV_HDDT (MSGV, MSDT, DIEM)
VALUES 
    ('00201', '97001', 8),
    ('00202', '97002', 7),
    ('00205', '97001', 9),
    ('00204', '97004', 7),
    ('00203', '97005', 9);

INSERT INTO GV_PBDT (MSGV, MSDT, DIEM)
VALUES 
    ('00201', '97005', 8),
    ('00202', '97001', 7),
    ('00205', '97004', 9),
    ('00204', '97003', 7),
    ('00203', '97002', 9);

INSERT INTO GV_UVDT (MSGV, MSDT, DIEM)
VALUES 
    ('00205', '97005', 8),
    ('00202', '97005', 7),
    ('00204', '97005', 9),
    ('00203', '97001', 7),
    ('00204', '97001', 9),
    ('00205', '97001', 8),
    ('00203', '97003', 7),
    ('00201', '97003', 9),
    ('00202', '97003', 7),
    ('00201', '97004', 9),
    ('00202', '97004', 8),
    ('00203', '97004', 7),
    ('00201', '97002', 9),
    ('00204', '97002', 7),
    ('00205', '97002', 9),
    ('00201', '97006', 9),
    ('00202', '97006', 7),
    ('00204', '97006', 9);

INSERT INTO HOIDONG (MSHD, PHONG, TGBD, NGAYHD, TINHTRANG, MSGV)
VALUES 
    (1, '002', '7:00', '11/29/2014', N'Th?t', '00201'),
    (2, '102', '7:00', '12/5/2014', N'Th?t', '00202'),
    (3, '003', '8:00', '12/6/2014', N'Th?t', '00203');

INSERT INTO HOIDONG_GV (MSHD, MSGV)
VALUES 
    (1, '00201'),
    (1, '00202'),
    (1, '00203'),
    (1, '00204'),
    (2, '00203'),
    (2, '00202'),
    (2, '00205'),
    (2, '00204'),
    (3, '00201'),
    (3, '00202'),
    (3, '00203'),
    (3, '00204');

INSERT INTO HOIDONG_DT (MSHD, MSDT, QUYETDINH)
VALUES 
    (1, '97001', N'Ðu?c'),
    (1, '97002', N'Ðu?c'),
    (2, '97001', N'Không'),
    (2, '97004', N'Không'),
    (1, '97005', N'Ðu?c'),
    (3, '97001', N'Không'),
    (3, '97002', N'Ðu?c');

-- A. STORED PROCEDUREDS VOI THAM SO VÀO
--1. Tham s? vào là MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH. Tru?c
--khi insert d? li?u c?n ki?m tra MSHH dã t?n t?i trong table HOCHAM chua,
--n?u chua thì tr? v? giá tr? 0.

-- T?o stored procedure
CREATE PROCEDURE InsertGiaoVien
    @MSGV NVARCHAR(8),
    @TENGV NVARCHAR(30),
    @SODT VARCHAR(10),
    @DIACHI NCHAR(50),
    @MSHH INT,
    @NAMHH INT
AS
BEGIN
    -- Ki?m tra xem MSHH dã t?n t?i trong table HOCHAM chua
    DECLARE @HochamCount INT
    SELECT @HochamCount = COUNT(*) FROM HOCHAM WHERE MSHH = @MSHH

    -- N?u MSHH không t?n t?i, tr? v? giá tr? 0
    IF @HochamCount = 0
    BEGIN
        PRINT N'MSHH không t?n t?i trong table HOCHAM.'
        RETURN 0
    END

    -- N?u MSHH t?n t?i, th?c hi?n chèn d? li?u vào b?ng GIAOVIEN
    INSERT INTO GIAOVIEN (MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH)
    VALUES (@MSGV, @TENGV, @SODT, @DIACHI, @MSHH, @NAMHH)

    PRINT 'D? li?u dã du?c chèn thành công.'
    RETURN 1
END

-- Test
EXEC InsertGiaoVien '00206', N'Nguy?n Lê T?n Quang', '123456789', N'H? Chí Minh', 3, 2000


--2. Tham so vào là MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH. Truoc
--khi insert d? li?u c?n ki?m tra MSGV trong table GIAOVIEN có trùng không,
--n?u trùng thì tr? v? giá tr? 0.
-- Tạo stored procedure
CREATE PROCEDURE InsertGiaoVienWithCheck
    @MSGV NVARCHAR(8),
    @TENGV NVARCHAR(30),
    @SODT VARCHAR(10),
    @DIACHI NCHAR(50),
    @MSHH INT,
    @NAMHH INT
AS
BEGIN
    -- Kiem tra xem MSGV dã ton tai trong table GIAOVIEN chua
    IF EXISTS (SELECT 1 FROM GIAOVIEN WHERE MSGV = @MSGV)
    BEGIN
        PRINT 'MSGV da ton tai trong table GIAOVIEN.'
        RETURN 0
    END

    -- Neu MSGV không trung, thuc hien chen du lieu vào bang GIAOVIEN
    INSERT INTO GIAOVIEN (MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH)
    VALUES (@MSGV, @TENGV, @SODT, @DIACHI, @MSHH, @NAMHH)

    PRINT 'Du lieu da duoc chen thanh cong.'
    RETURN 1
END

--Test
EXEC InsertGiaoVienWithCheck '00207', N'Nguyễn Văn A', '987654321', N'Hà Nội', 2, 2001

--3. 
-- Tạo stored procedure
CREATE PROCEDURE InsertGiaoVienWithCheckBoth
    @MSGV NVARCHAR(8),
    @TENGV NVARCHAR(30),
    @SODT VARCHAR(10),
    @DIACHI NCHAR(50),
    @MSHH INT,
    @NAMHH INT
AS
BEGIN
    -- Kiểm tra xem MSGV có trùng không
    IF EXISTS (SELECT 1 FROM GIAOVIEN WHERE MSGV = @MSGV)
    BEGIN
        PRINT 'MSGV đã tồn tại trong table GIAOVIEN.'
        RETURN 0
    END

    -- Kiểm tra xem MSHH đã tồn tại trong table HOCHAM chưa
    IF NOT EXISTS (SELECT 1 FROM HOCHAM WHERE MSHH = @MSHH)
    BEGIN
        PRINT 'MSHH không tồn tại trong table HOCHAM.'
        RETURN 1
    END

    -- Nếu cả MSGV không trùng và MSHH tồn tại, thực hiện chèn dữ liệu vào bảng GIAOVIEN
    INSERT INTO GIAOVIEN (MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH)
    VALUES (@MSGV, @TENGV, @SODT, @DIACHI, @MSHH, @NAMHH)

    PRINT 'Dữ liệu đã được chèn thành công.'
    RETURN 2
END

--Test
EXEC InsertGiaoVienWithCheckBoth '00208', N'Nguyễn Văn C', '123123123', N'Đà Nẵng', 3, 2002

--4. 
-- Tạo stored procedure
CREATE PROCEDURE UpdateTenDeTai
    @MSDT CHAR(6),
    @TENDT_NEW NVARCHAR(30)
AS
BEGIN
    -- Kiểm tra xem MSDT có tồn tại trong bảng DETAI không
    IF NOT EXISTS (SELECT 1 FROM DETAI WHERE MSDT = @MSDT)
    BEGIN
        PRINT 'MSDT không tồn tại trong bảng DETAI.'
        RETURN 0
    END

    -- Nếu MSDT tồn tại, cập nhật TENDT mới
    UPDATE DETAI
    SET TENDT = @TENDT_NEW
    WHERE MSDT = @MSDT

    PRINT 'Dữ liệu đã được cập nhật thành công.'
    RETURN 1
END

--Test
EXEC UpdateTenDeTai '97001', N'Quản Lý Thông Tin'

--5. 
-- Tạo stored procedure
CREATE PROCEDURE UpdateThongTinSinhVien
    @MSSV CHAR(8),
    @TENSV_MOI NVARCHAR(30),
    @DIACHI_MOI NCHAR(50)
AS
BEGIN
    -- Kiểm tra xem MSSV có tồn tại trong bảng SinhVien không
    IF NOT EXISTS (SELECT 1 FROM SinhVien WHERE MSSV = @MSSV)
    BEGIN
        PRINT 'MSSV không tồn tại trong bảng SinhVien.'
        RETURN 0
    END

    -- Nếu MSSV tồn tại, cập nhật thông tin mới
    UPDATE SinhVien
    SET TENSV = @TENSV_MOI,
        DIACHI = @DIACHI_MOI
    WHERE MSSV = @MSSV

    PRINT 'Thông tin sinh viên đã được cập nhật thành công.'
    RETURN 1
END

--Test
EXEC UpdateThongTinSinhVien '13520001', N'Nguyễn Văn Anh', N'Quận 1, TP.HCM'


--B. STORED PROCEDUREDS VỚI THAM SỐ VÀO 
-- 1. Đưa vào TENHV trả ra: Số GV thỏa học vị, nếu không tìm thấy trả về 0.
-- Tạo stored procedure
CREATE PROCEDURE CountGiaoVienByHocVii
    @TENHV NVARCHAR(20),
    @SoLuongGiaoVien INT OUTPUT
AS
BEGIN
    -- Khởi tạo biến đếm
    SET @SoLuongGiaoVien = 0

    -- Đếm số lượng giáo viên thỏa mãn học vị
    SELECT @SoLuongGiaoVien = COUNT(*) 
    FROM GIAOVIEN GV
    INNER JOIN GV_HV_CN GH ON GV.MSGV = GH.MSGV
    INNER JOIN HOCVI HV ON GH.MSHV = HV.MSHV
    WHERE HV.TENHV = @TENHV

    -- Trả về số lượng giáo viên có học vị tương ứng
    SELECT @SoLuongGiaoVien AS SoLuongGiaoVien
END

--Test
DECLARE @SoLuongGiaoVien INT
DECLARE @TenHocVi NVARCHAR(20) = N'Kỹ sư' 
EXEC CountGiaoVienByHocVii @TenHocVi, @SoLuongGiaoVien OUTPUT

--2. Đưa vào MSDT cho biết: Điểm trung bình của đề tài, nếu không tìm thấy trả về 0.
-- Tạo stored procedure
CREATE PROCEDURE AverageDiemByDeTai
    @MSDT CHAR(6),
    @DiemTrungBinh FLOAT OUTPUT
AS
BEGIN
    -- Khởi tạo biến điểm trung bình
    SET @DiemTrungBinh = 0

    -- Tính điểm trung bình của đề tài
    SELECT @DiemTrungBinh = AVG(DIEM)
    FROM GV_HDDT
    WHERE MSDT = @MSDT

    -- Trả về điểm trung bình của đề tài
    SELECT @DiemTrungBinh AS DiemTrungBinh
END

--test
-- Gọi stored procedure với tham số đầu vào và tham số ra
DECLARE @DiemTrungBinh FLOAT
DECLARE @MaDeTai CHAR(6) = '97001' 

EXEC AverageDiemByDeTai @MaDeTai, @DiemTrungBinh OUTPUT

-- Hiển thị kết quả
PRINT 'Điểm trung bình của đề tài có MSDT = ' + @MaDeTai + ' là: ' + CAST(@DiemTrungBinh AS NVARCHAR(10))

--3. 
-- Tạo stored procedure
CREATE PROCEDURE FindSDTByTenGV
    @TENGV NVARCHAR(30),
    @SDT NVARCHAR(10) OUTPUT,
    @SoLuongGiaoVienTrungTen INT OUTPUT
AS
BEGIN
    -- Khởi tạo biến SDT và số lượng giáo viên trùng tên
    SET @SDT = '0'
    SET @SoLuongGiaoVienTrungTen = 0

    -- Lưu kết quả tìm kiếm vào bảng tạm thời
    CREATE TABLE #TempResults
    (
        SDT NVARCHAR(10)
    )

    -- Tìm kiếm giáo viên theo tên
    INSERT INTO #TempResults (SDT)
    SELECT SODT
    FROM GIAOVIEN
    WHERE TENGV = @TENGV

    -- Đếm số lượng giáo viên trùng tên
    SELECT @SoLuongGiaoVienTrungTen = COUNT(*)
    FROM #TempResults

    -- Trả về SDT và số lượng giáo viên trùng tên
    SELECT @SDT = SDT
    FROM #TempResults

    -- Xóa bảng tạm thời sau khi sử dụng
    DROP TABLE #TempResults
END

--test
DECLARE @SDTGiaoVien NVARCHAR(10)
DECLARE @TenGiaoVien NVARCHAR(30) = N'Nguyễn Văn An' -- Đặt giá trị TENGV muốn truy vấn
DECLARE @SoLuongGiaoVienTrungTen INT

EXEC FindSDTByTenGV @TenGiaoVien, @SDTGiaoVien OUTPUT, @SoLuongGiaoVienTrungTen OUTPUT

-- Kiểm tra số lượng giáo viên trùng tên và hiển thị kết quả
IF @SoLuongGiaoVienTrungTen > 1
BEGIN
    PRINT 'Có ' + CAST(@SoLuongGiaoVienTrungTen AS NVARCHAR(10)) + ' giáo viên trùng tên.'
    PRINT 'Danh sách SDT của các giáo viên:'
    PRINT @SDTGiaoVien
END
ELSE IF @SoLuongGiaoVienTrungTen = 1
BEGIN
    PRINT 'SDT của giáo viên ' + @TenGiaoVien + ' là: ' + @SDTGiaoVien
END
ELSE
BEGIN
    PRINT 'Không tìm thấy giáo viên có tên ' + @TenGiaoVien
END

--4.Đưa vào MSHD cho biết: Điểm trung bình các đề tài của hội đồng đó.
CREATE PROCEDURE DiemTrungBinhHoiDongg
    @MSHD INT,
    @DiemTrungBinh FLOAT OUTPUT
AS
BEGIN
    SET @DiemTrungBinh = 0.0

    -- Kiểm tra xem hội đồng có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM HOIDONG WHERE MSHD = @MSHD)
    BEGIN
        PRINT 'Hội đồng không tồn tại.'
        RETURN
    END

    -- Tính điểm trung bình các đề tài của hội đồng
    SELECT @DiemTrungBinh = AVG(GV_HDDT.DIEM)
    FROM GV_HDDT
    INNER JOIN HOIDONG_DT ON GV_HDDT.MSDT = HOIDONG_DT.MSDT
    WHERE HOIDONG_DT.MSHD = @MSHD

    -- Kiểm tra xem có đề tài nào trong hội đồng không
    IF @DiemTrungBinh IS NULL
    BEGIN
        PRINT 'Hội đồng không có đề tài nào.'
    END
    ELSE
    BEGIN
        PRINT 'Điểm trung bình các đề tài của hội đồng ' + CAST(@MSHD AS NVARCHAR(10)) + ' là: ' + CAST(@DiemTrungBinh AS NVARCHAR(10))
    END
END


--test
DECLARE @DiemTrungBinh FLOAT
DECLARE @MSHDHoiDong INT = 2 -- 
EXEC DiemTrungBinhHoiDongg @MSHDHoiDong, @DiemTrungBinh OUTPUT

/*E. CURSOR
Tạo một bảng tên là DETAI_DIEM. Cấu trúc bảng như sau:
DETAI_DIEM(MSDT, DIEMTB)
1. Viết Cursor tính điểm trung bình cho từng đề tài. Sau đó lưu kết quả vào
bảng DETAI_DIEM */
-- Tạo bảng DETAI_DIEM
CREATE TABLE DETAI_DIEM
(
    MSDT CHAR(6) PRIMARY KEY,
    DIEMTB FLOAT
);

-- Khai báo biến và cursor
DECLARE @MSDT CHAR(6)
DECLARE @DIEMTB FLOAT

DECLARE Cursor_Detai CURSOR FOR
SELECT MSDT
FROM Detai;

-- Mở cursor
OPEN Cursor_Detai;

-- Lặp qua từng đề tài và tính điểm trung bình
FETCH NEXT FROM Cursor_Detai INTO @MSDT;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Tính điểm trung bình cho đề tài
    SELECT @DIEMTB = AVG(DIEM)
    FROM GV_HDDT
    WHERE MSDT = @MSDT;

    -- Kiểm tra xem có điểm nào không
    IF @DIEMTB IS NOT NULL
    BEGIN
        -- Thêm dòng vào bảng DETAI_DIEM
        INSERT INTO DETAI_DIEM (MSDT, DIEMTB)
        VALUES (@MSDT, @DIEMTB);

        PRINT 'Đã tính điểm trung bình cho đề tài ' + @MSDT;
    END
    ELSE
    BEGIN
        PRINT 'Không có điểm cho đề tài ' + @MSDT;
    END

    -- Lấy đề tài tiếp theo
    FETCH NEXT FROM Cursor_Detai INTO @MSDT;
END

-- Đóng cursor
CLOSE Cursor_Detai;

-- Hủy cursor
DEALLOCATE Cursor_Detai;

--Test
Select * from DETAI_DIEM;


--2. Gom các bước xử lý của Cursor ở câu 1 vào một Stored Procedure
-- Tạo stored procedure tính điểm trung bình cho từng đề tài và lưu vào bảng DETAI_DIEM
CREATE PROCEDURE TinhDiemTrungBinh
AS
BEGIN
    DECLARE @MSDT CHAR(6)
    DECLARE @DIEMTB FLOAT

    DECLARE Cursor_Detai CURSOR FOR
    SELECT MSDT
    FROM Detai;

    OPEN Cursor_Detai;

    FETCH NEXT FROM Cursor_Detai INTO @MSDT;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SELECT @DIEMTB = AVG(DIEM)
        FROM GV_HDDT
        WHERE MSDT = @MSDT;

        -- Kiểm tra xem có điểm nào không
        IF @DIEMTB IS NOT NULL
        BEGIN
            -- Kiểm tra xem đã tồn tại trong bảng DETAI_DIEM hay chưa
            IF NOT EXISTS (SELECT 1 FROM DETAI_DIEM WHERE MSDT = @MSDT)
            BEGIN
                INSERT INTO DETAI_DIEM (MSDT, DIEMTB)
                VALUES (@MSDT, @DIEMTB);
                
                PRINT 'Đã tính điểm trung bình cho đề tài ' + @MSDT;
            END
            ELSE
            BEGIN
                PRINT 'Đã tồn tại điểm cho đề tài ' + @MSDT;
            END
        END
        ELSE
        BEGIN
            PRINT 'Không có điểm cho đề tài ' + @MSDT;
        END

        FETCH NEXT FROM Cursor_Detai INTO @MSDT;
    END

    CLOSE Cursor_Detai;

    DEALLOCATE Cursor_Detai;
END


--Test
-- Gọi stored procedure
EXEC TinhDiemTrungBinh;

/* 3* Tạo thêm cột XEPLOAI có kiểu là NVARCCHAR(20) trong bảng
DETAI_DIEM, viết Cursor cập nhật kết quả xếp loại cho mỗi đề tài như sau:
+ "Xuất sắc": điểm trung bình từ 9 đến 10.
+ "Giỏi": điểm trung bình từ 8 đến 9.
+ "Khá": điểm trung bình từ 7 đến 8.
+ "Trung bình": điểm trung bình từ 5 đến 6
+ "Không đạt": điểm trung bình dưới 5. */

-- Thêm cột XEPLOAI vào bảng Detai_Diem
ALTER TABLE Detai_Diem
ADD XEPLOAI NVARCHAR(20);

CREATE PROCEDURE CapNhatXepLoai
AS
BEGIN
    DECLARE @MSDT CHAR(6)
    DECLARE @DIEMTB FLOAT
    DECLARE @XEPLOAI NVARCHAR(20)

    -- Cursor cho bảng Detai_Diem
    DECLARE Cursor_DetaiDiem CURSOR FOR
    SELECT MSDT, DIEMTB
    FROM Detai_Diem;

    OPEN Cursor_DetaiDiem;

    FETCH NEXT FROM Cursor_DetaiDiem INTO @MSDT, @DIEMTB;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Xác định xếp loại dựa trên điểm trung bình
        IF @DIEMTB >= 9 AND @DIEMTB <= 10
            SET @XEPLOAI = N'Xuất sắc';
        ELSE IF @DIEMTB >= 8 AND @DIEMTB < 9
            SET @XEPLOAI = N'Giỏi';
        ELSE IF @DIEMTB >= 7 AND @DIEMTB < 8
            SET @XEPLOAI = N'Khá';
        ELSE IF @DIEMTB >= 5 AND @DIEMTB < 6
            SET @XEPLOAI = N'Trung bình';
        ELSE
            SET @XEPLOAI = N'Không đạt';

        -- Cập nhật cột XEPLOAI trong bảng Detai_Diem
        UPDATE Detai_Diem
        SET XEPLOAI = @XEPLOAI
        WHERE MSDT = @MSDT;

        -- Lấy đề tài tiếp theo
        FETCH NEXT FROM Cursor_DetaiDiem INTO @MSDT, @DIEMTB;
    END

    CLOSE Cursor_DetaiDiem;

    DEALLOCATE Cursor_DetaiDiem;
END

EXEC CapNhatXepLoai;

Select * from Detai_Diem;

--C. TRIGGER
--1. Tạo Trigger thỏa mãn điều kiện khi xóa một đề tài sẽ xóa các thông tin liên
--quan.
CREATE TRIGGER Delete_DeTai ON DeTai FOR DELETE
AS
BEGIN
DELETE FROM GV_HDDT
WHERE MSDT IN (SELECT MSDT FROM deleted)
 
DELETE FROM GV_PBDT
WHERE MSDT IN (SELECT MSDT FROM deleted)
 
DELETE FROM GV_UVDT
WHERE MSDT IN (SELECT MSDT FROM deleted)
 
DELETE FROM HOIDONG_DT
WHERE MSDT IN (SELECT MSDT FROM deleted)
 
DELETE FROM SV_DETAI
WHERE MSDT IN (SELECT MSDT FROM deleted)
END

--2. Tạo Trigger thỏa mãn ràng buộc là một hội đồng không quá 10 đề tài. Dùng
--“Group by” có được không? Giải thích.
 
CREATE TRIGGER TG_2
ON HOIDONG_DT
AFTER INSERT
AS
BEGIN
  DECLARE @Count int
  SELECT @Count = COUNT(*)
  FROM HOIDONG_DT
  GROUP BY MSHD
  HAVING COUNT(*) > 10
  IF @Count > 0
  BEGIN
	print ('Hội đồng không được quá 10 đề tài')
	ROLLBACK TRANSACTION
  END
END
--Giải thích: Dùng được, gom nhóm để kiểm tra số lượng đề tài cho mỗi Hội đồng theo MSHD, nếu mà count lớn hơn 0 là có hội đồng có đề tài lớn hơn 10=> rollback lại

--3. Tạo Trigger thỏa mãn ràng buộc là một đề tài không quá 3 sinh viên. Dùng
--“Group by” có được không? Giải thích
 
CREATE TRIGGER TG_3
ON SV_DETAI 
AFTER INSERT
AS
BEGIN
  DECLARE @Count int
  SELECT @Count = COUNT(*)
  FROM SV_DETAI
  GROUP BY MSDT
  HAVING COUNT(*) > 3
  IF @Count > 0
  BEGIN
  print ('Một đề tài không quá 3 sinh viên')
	ROLLBACK TRANSACTION 
  END
END

--.4 Tạo Trigger thỏa mãn ràng buộc là một giáo viên muốn có học hàm PGS
--phải là tiến sĩ
CREATE TRIGGER TG_4
ON GIAOVIEN 
AFTER UPDATE, INSERT
AS
BEGIN
  IF EXISTS(
	SELECT *
	FROM inserted i
  	JOIN GV_HV_CN gh ON i.MSGV = gh.MSGV
  	JOIN HOCVI hv ON gh.MSHV = hv.MSHV
  	JOIN HOCHAM h ON i.MSHH = h.MSHH
	WHERE h.TENHH = 'PHÓ GIÁO SƯ' AND hv.TENHV != 'Tiến sĩ'
  )
  BEGIN
	PRINT('Giáo viên muốn có học hàm PGS phải là TS')
	ROLLBACK TRANSACTION
  END
END

--D. FUNCTION
--1. Viết hàm tính điểm trung bình của một đề tài. Giá trị trả về là điểm trung
--bình ứng với mã số đề tài nhập vào
 
create function FT_1 (@MSDT char(6))
returns float
as
begin
DECLARE @DTB FLOAT, @Count FLOAT
 
select @DTB = (SUM(DIEM))
from GV_HDDT  hd
where hd.MSDT=@MSDT
 
 
select @DTB = @DTB +  (SUM(DIEM))
from GV_PBDT  pb
where pb.MSDT=@MSDT
 
select @DTB = @DTB +  (SUM(DIEM))
from GV_UVDT  uv
where uv.MSDT=@MSDT
 
 
select @Count = (Count(DIEM))
from GV_HDDT  hd
where hd.MSDT=@MSDT
 
select @Count = @Count +  (Count(DIEM))
from GV_UVDT  uv
where uv.MSDT=@MSDT
 
select @Count = @Count +  (Count(DIEM))
from GV_PBDT  pb
where pb.MSDT=@MSDT
 
 
set  @DTB= @DTB/@Count;
return @DTB;
end
 
 
DECLARE @result float;
EXEC @result = FT_1 '97005';
SELECT @result AS Result;
 
--2. Trả về kết quả của đề tài theo MSDT nhập vào. Kết quả là DAT nếu như
--điểm trung bình từ 5 trở lên, và KHONGDAT nếu như điểm trung bình dưới 5.
create function FT_2 (@MSDT char(6))
returns varchar(10)
as
begin
declare @DiemTB float
set @DiemTB = dbo. FT_1(@MSDT)
if (@DiemTB>5)
return 'Dat'
RETURN 'KHONG DAT'
END
 
 
 
 
DECLARE @result varchar(10);
EXEC @result = FT_2 '97001';
SELECT @result AS Result;

-- 3* Đưa vào MSDT, trả về mã số và họ tên của các sinh viên thực hiện đề tài.-- Tạo Function
CREATE FUNCTION GetSinhVienByDeTai
(
    @MSDT CHAR(6)
)
RETURNS TABLE
AS
RETURN
(
    SELECT SV.MSSV, SV.TENSV
    FROM SinhVien SV
    JOIN SV_DeTai SDT ON SV.MSSV = SDT.MSSV
    WHERE SDT.MSDT = @MSDT
);

-- Sử dụng Function
SELECT * FROM GetSinhVienByDeTai('97005');

