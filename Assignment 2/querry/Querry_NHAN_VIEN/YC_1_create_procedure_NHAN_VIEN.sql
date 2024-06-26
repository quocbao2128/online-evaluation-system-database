USE [TEST_ONLINE_03]
GO
--Câu lệnh tạo procedure insert cho bảng NHAN_VIEN
CREATE PROCEDURE [dbo].[INSERT_NHAN_VIEN]
	@ID_NV CHAR(10),
	@HO NVARCHAR(20),
	@TEN_DEM NVARCHAR(20),
	@TEN NVARCHAR(20),
	@NAM_SINH DATETIME,
	@GIOI_TINH NVARCHAR(10),
	@EMAIL NVARCHAR(100),
	@SDT_NV VARCHAR(10),
	@ADMIN_FLAG BIT
AS
BEGIN
	IF(EXISTS(SELECT * FROM dbo.NHAN_VIEN WHERE ID_NV = @ID_NV))
		BEGIN
			RAISERROR (N'ID Nhân viên đã tồn tại',16,1);
			PRINT ' ';
		END
	ELSE
		BEGIN
			IF(@ID_NV NOT LIKE 'NV[0-9][0-9][0-9]%')
				BEGIN
					RAISERROR (N'ID Nhân viên không hợp lệ, phải bắt đầu bằng NV + 3 số, vd: NV009, NV029, NV123',16,1);
					PRINT ' ';
				END
			ELSE
				BEGIN
					IF(@GIOI_TINH NOT LIKE N'Nam'AND @GIOI_TINH NOT LIKE N'Nữ')
						BEGIN
							RAISERROR (N'Giới tính phải là "Nam" hoặc "Nữ"',16,1);
							PRINT ' ';
						END
					ELSE
						BEGIN
							IF(@SDT_NV NOT LIKE '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]%')
								BEGIN
									RAISERROR(N'Số điện thoại phải có 10 số, là các số từ 0 đến 9 và bắt đầu bằng số 0',16,1);
									PRINT ' ';
								END
									ELSE
										BEGIN
											INSERT INTO dbo.NHAN_VIEN
											(
												ID_NV, Ho, Ten_dem, Ten, Nam_sinh, 
												Gioi_tinh, Email, SDT_NV, Admin_flag
											)
											VALUES
											(   
												@ID_NV,@HO,@TEN_DEM,@TEN, CAST(@NAM_SINH AS DATE), 
												@GIOI_TINH, @EMAIL, @SDT_NV, @ADMIN_FLAG
											)
											PRINT N'Thêm thành công Nhân viên mới có ID_NV: ' + CAST(@ID_NV AS VARCHAR(10));
											PRINT ' ';
										END
						END
				END
		END
END
GO

--Câu lệnh thực thi procedure
USE [TEST_ONLINE_03]
GO
EXECUTE INSERT_NHAN_VIEN 'NV01', N'Nguyễn', N'An' , N'An', '12-02-1995', N'Nữ', 'an_nguyen_nv020@gmail.com', '099999990', false;

EXECUTE INSERT_NHAN_VIEN 'NM0', N'Nguyễn', N'An' , N'An', '12-02-1995', N'Nữ', 'an_nguyen_nv020@gmail.com', '099999990', false;

EXECUTE INSERT_NHAN_VIEN 'NV010', N'Nguyễn', N'An' , N'An', '12-02-1995', N'm', 'an_nguyen_nv020@gmail.com', '0999999909', false;

EXECUTE INSERT_NHAN_VIEN 'NV010', N'Nguyễn', N'' , N'An', '12-02-1995', N'Nam', 'an_nguyen_nv020@gmail.com', '1999999998', false;

EXECUTE INSERT_NHAN_VIEN 'NV010', N'Nguyễn', N'' , N'An', '12-02-1995', N'Nam', 'an_nguyen_nv020@gmail.com', '0999999998', false;
GO