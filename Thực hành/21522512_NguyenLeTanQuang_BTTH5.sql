CREATE DATABASE TEST_XML
GO
USE TEST_XML GO
CREATE TABLE KhoaHoc
(
MaKhoaHoc INT IDENTITY(1,1)NOT NULL,
TenKhoaHoc VARCHAR(200) NOT NULL,
CONSTRAINT PK_KhoaHoc PRIMARY KEY(MaKhoaHoc)
)
INSERT INTO KhoaHoc (TenKhoaHoc) SELECT 'Mang May Tinh Truyen Thong'
INSERT INTO KhoaHoc (TenKhoaHoc) SELECT 'Khoa Hoc May Tinh'
INSERT INTO KhoaHoc (TenKhoaHoc) SELECT 'Ky Thuat May Tinh'
CREATE TABLE SinhVien
(
MSSV BIGINT IDENTITY(1,1)NOT NULL CONSTRAINT PK_SinhVien PRIMARY KEY(MSSV),
TenSV VARCHAR(200) NOT NULL,
MaKhoaHoc INT NOT NULL CONSTRAINT FK_SinhVien_MaKhoaHoc FOREIGN KEY REFERENCES
KhoaHoc(MaKhoaHoc)
)
INSERT INTO SinhVien SELECT 'Sang',1
INSERT INTO SinhVien SELECT 'Duy',2
INSERT INTO SinhVien SELECT 'Sa', 3
CREATE TABLE MonHoc
(
MaMonHoc INT IDENTITY NOT NULL CONSTRAINT PK_MonHoc PRIMARY KEY(MaMonHoc),
TenMonHoc VARCHAR(200)
)
INSERT INTO MonHoc (TenMonHoc) SELECT ('Co So Du Lieu')
INSERT INTO MonHoc (TenMonHoc) SELECT ('Cau Truc Du Lieu')
INSERT INTO MonHoc (TenMonHoc) SELECT ('Lap Trinh Di Dong')
INSERT INTO MonHoc (TenMonHoc) SELECT ('Toan Giai Tich')
INSERT INTO MonHoc (TenMonHoc) SELECT ('Lap Trinh Java')
INSERT INTO MonHoc (TenMonHoc) SELECT ('He Quan Tri CSDL')
INSERT INTO MonHoc (TenMonHoc) SELECT ('Anh Van')
INSERT INTO MonHoc (TenMonHoc) SELECT ('Thiet Ke Web ')
INSERT INTO MonHoc (TenMonHoc) SELECT ('An Toan Thong Tin')
CREATE TABLE KhoaHocMonHoc
(
MaKhoaHoc INT CONSTRAINT FK_KhoaHocMonHoc_MaKhoaHoc FOREIGN KEY REFERENCES
KhoaHoc(MaKhoaHoc),MaMonHoc INT CONSTRAINT FK_KhoaHocMonHoc_MaMonHoc FOREIGN KEY REFERENCES
MonHoc(MaMonHoc)
)
INSERT INTO KhoaHocMonHoc (MaKhoaHoc,MaMonHoc) SELECT 1,1
INSERT INTO KhoaHocMonHoc (MaKhoaHoc,MaMonHoc) SELECT 1,2
INSERT INTO KhoaHocMonHoc (MaKhoaHoc,MaMonHoc) SELECT 1,3
INSERT INTO KhoaHocMonHoc (MaKhoaHoc,MaMonHoc) SELECT 2,4
INSERT INTO KhoaHocMonHoc (MaKhoaHoc,MaMonHoc) SELECT 2,5
INSERT INTO KhoaHocMonHoc (MaKhoaHoc,MaMonHoc) SELECT 2,6
INSERT INTO KhoaHocMonHoc (MaKhoaHoc,MaMonHoc) SELECT 3,7
INSERT INTO KhoaHocMonHoc (MaKhoaHoc,MaMonHoc) SELECT 3,8
INSERT INTO KhoaHocMonHoc (MaKhoaHoc,MaMonHoc) SELECT 3,9
CREATE TABLE Diem
(
MSSV BIGINT CONSTRAINT FK_Diem_MSSV FOREIGN KEY REFERENCES SinhVien(MSSV),
MaMonHoc INT CONSTRAINT FK_Diem_MaMonHoc FOREIGN KEY REFERENCES MonHoc(MaMonHoc),
Diem INT
)
INSERT INTO Diem (MSSV,MaMonHoc,Diem) SELECT 1,1,75
INSERT INTO Diem (MSSV,MaMonHoc,Diem) SELECT 1,2,80
INSERT INTO Diem (MSSV,MaMonHoc,Diem) SELECT 1,3,70
INSERT INTO Diem (MSSV,MaMonHoc,Diem) SELECT 2,4,80
INSERT INTO Diem (MSSV,MaMonHoc,Diem) SELECT 2,5,80
INSERT INTO Diem (MSSV,MaMonHoc,Diem) SELECT 2,6,90
INSERT INTO Diem (MSSV,MaMonHoc,Diem) SELECT 3,7,80
INSERT INTO Diem (MSSV,MaMonHoc,Diem) SELECT 3,8,80
INSERT INTO Diem (MSSV,MaMonHoc,Diem) SELECT 3,9,90
CREATE TABLE QuanLySV
(MSDH INT NOT NULL,
TenDH VARCHAR(20),
ChiTietSV XML)
INSERT INTO QuanLySV VALUES (1,'DH CNTT','<THONGTINSV>
<sinhvien ID="10" Ten="Nam">
<monhoc ID="1" Ten="Co So Du Lieu" />
<monhoc ID="2" Ten="Cau Truc Du Lieu" />
<monhoc ID="3" Ten="Lap Trinh Mobile" />
</sinhvien>
<sinhvien ID="11" Ten="An">
<monhoc ID="4" Ten="Toan Giai Tich" />
<monhoc ID="5" Ten="Lap Trinh Java" />
<monhoc ID="6" Ten="He Quan Tri CSDL" />
</sinhvien>
<sinhvien ID="12" Ten="Thanh">
<monhoc ID="7" Ten="Anh Van" />
<monhoc ID="8" Ten="Thiet Ke Web" />
<monhoc ID="9" Ten="An Toan Thong Tin" />
</sinhvien>
</THONGTINSV>')

INSERT INTO QuanLySV VALUES (2,'DH KHTN','<THONGTINSV>
<sinhvien ID="10" Ten="Khang">
<monhoc ID="1" Ten="Co So Du Lieu" />
<monhoc ID="2" Ten="Cau Truc Du Lieu" />
<monhoc ID="3" Ten="Lap Trinh Mobile" />
</sinhvien>
<sinhvien ID="11" Ten="Vinh">
<monhoc ID="4" Ten="Toan Giai Tich" />
<monhoc ID="5" Ten="Lap Trinh Java" />
<monhoc ID="6" Ten="He Quan Tri CSDL" />
</sinhvien>
<sinhvien ID="12" Ten="Hoa">
<monhoc ID="7" Ten="Anh Van" />
<monhoc ID="8" Ten="Thiet Ke Web" />
<monhoc ID="9" Ten="An Toan Thong Tin" />
</sinhvien>
</THONGTINSV>')


/* Câu 1: Viết lệnh Xpath lấy Sinh viên có ID=10. Lệnh lấy sinh viên ở vị trí cuối cùng ở
trường CNTT. */

SELECT ChiTietSV.query('/THONGTINSV/sinhvien[@ID="10"]')
FROM QuanLySV
WHERE MSDH = 1;

/* Câu 2: Viết lệnh Xpath lấy tên Sinh viên có ID=10 trong trường Đại học CNTT */

SELECT ChiTietSV.value('(/THONGTINSV/sinhvien[@ID="10"]/@Ten)[1]', 'VARCHAR(200)')
FROM QuanLySV
WHERE MSDH = 1;

/* Câu 3: Viết lệnh trả về tất cả các nút từ nút gốc là THONGTINSV. */
SELECT ChiTietSV.query('/THONGTINSV/*')
FROM QuanLySV;

/* Câu 4: Viết lệnh Xquery trả về danh sách sinh viên có ID < 12 với MSDH = 1. */SELECT ChiTietSV.query('/THONGTINSV/sinhvien[@ID < 12]')
FROM QuanLySV
WHERE MSDH = 1;

/* Câu 5: Viết lệnh Xquery trả về danh sách sinh viên sắp xếp theo tên với MSDH=2. */
SELECT ChiTietSV.query('for $s in /THONGTINSV/sinhvien order by $s/@Ten return $s')
FROM QuanLySV
WHERE MSDH = 2;

/* Câu 6: Viết lệnh Xquery trả về MSDH và TenDH theo định dạng sau:
<QuanLySV>
<ChiTietSV>1 DH CNTT</ChiTietSV>
</QuanLySV> */
SELECT ('<QuanLySV><ChiTietSV>' + CAST(MSDH AS VARCHAR) + ' ' + TenDH + '</ChiTietSV></QuanLySV>')
FROM QuanLySV;

/* Câu 7: Viết lệnh Xquery xóa tên các sinh viên trường DH KHTN. */
UPDATE QuanLySV
SET ChiTietSV.modify('delete /THONGTINSV/sinhvien/@Ten')
WHERE MSDH = 2;
--Test
SELECT ChiTietSV
FROM QuanLySV
WHERE MSDH = 2;

/* Câu 8: Viết lệnh Xquery trả về thông tin các sinh viên có tên là ‘Nam’ hoặc ‘Thanh */
SELECT ChiTietSV.query('/THONGTINSV/sinhvien[@Ten="Nam" or @Ten="Thanh"]')
FROM QuanLySV;

/* Câu 9: Viết lệnh Xquery thay đổi tên sinh viên thứ 2 thành tên ‘Binh’ trong trường
CNTT. */
UPDATE QuanLySV
SET ChiTietSV.modify('replace value of (/THONGTINSV/sinhvien[2]/@Ten)[1] with "Binh"')
WHERE MSDH = 1;

SELECT ChiTietSV.query('/THONGTINSV/sinhvien[2]')
FROM QuanLySV
WHERE MSDH = 1;


/* Câu 10: Viết lệnh Xquery kiểm tra xem có tồn tại sinh viên có ID là 12 trong trường
KHTN không? (Nếu có trả về 1, nếu không thì trả về 0). */
SELECT CASE WHEN ChiTietSV.exist('/THONGTINSV/sinhvien[@ID="12"]') = 1 THEN 1 ELSE 0 END
FROM QuanLySV
WHERE MSDH = 2;

/* Câu 11: Thêm môn học có ID = 13 vào đối tượng sinh viên có ID = 10 của trường đại
học Công nghệ thông tin. */
UPDATE QuanLySV
SET ChiTietSV.modify('insert <monhoc ID="13" /> into (/THONGTINSV/sinhvien[@ID="10"])[1]')
WHERE MSDH = 1;

SELECT ChiTietSV.query('/THONGTINSV/sinhvien[@ID="10"]')
FROM QuanLySV
WHERE MSDH = 1;

/* Câu 12: Thêm thuộc tính tên môn học là "Quản lý thông tin" cho môn học có ID = 13
vào đối tượng sinh viên có ID = 10 của trường đại học Công nghệ thông tin. */
UPDATE QuanLySV
SET ChiTietSV.modify('insert attribute Ten {"Quản lý thông tin"} into (/THONGTINSV/sinhvien[@ID="10"]/monhoc[@ID="13"])[1]')
WHERE MSDH = 1;

--test
SELECT ChiTietSV.query('/THONGTINSV/sinhvien[@ID="10"]/monhoc[@ID="13"]')
FROM QuanLySV
WHERE MSDH = 1;

/* Câu 13*: Viết lệnh Xquery kiểm tra xem có tồn tại sinh viên tên ‘Lan’ trong trường
CNTT không? (Nếu có trả về 1, nếu không thì trả về 0). Và INSERT thêm vào
THONGTINSV: */
DECLARE @exists INT;
SELECT @exists = ChiTietSV.exist('/THONGTINSV/sinhvien[@Ten="Lan"]')
FROM QuanLySV
WHERE MSDH = 1;

IF @exists = 0
BEGIN
    UPDATE QuanLySV
    SET ChiTietSV.modify('insert <sinhvien ID="new_id" Ten="Lan">...</sinhvien> after (/THONGTINSV/sinhvien)[1]')
    WHERE MSDH = 1;
END;

--test
SELECT ChiTietSV.query('/THONGTINSV/sinhvien[@Ten="Lan"]')
FROM QuanLySV
WHERE MSDH = 1;


/* Câu 14*: Thực hiện phép nối bằng các lệnh Xquery như một câu truy vấn trong SQL để
trả về thông tin là sinh viên nào học khóa học tên là gì? (Nếu được có thể mở rộng thêm
truy vấn sinh viên nào học môn học gì?). */
SELECT SV.MSSV, SV.TenSV, KH.TenKhoaHoc
FROM SinhVien SV
JOIN KhoaHoc KH ON SV.MaKhoaHoc = KH.MaKhoaHoc
FOR XML AUTO, ELEMENTS;