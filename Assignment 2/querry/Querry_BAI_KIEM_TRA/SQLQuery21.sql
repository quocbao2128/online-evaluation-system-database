USE [TEST_ONLINE_03]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[trgins_AF_BKT] ON [dbo].[BAI_KIEM_TRA]
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @ID_BKT char(10)
	DECLARE @ID_CD char(10)
	DECLARE @Ten_BKT NVARCHAR(100)
	DECLARE @Thoi_gian_lam_bai INT
	DECLARE @Tong_so_cau_hoi int

	SELECT	
			@ID_BKT = Inserted.ID_BKT,
			@ID_CD = Inserted.ID_CD,
			@Ten_BKT = Inserted.Ten_BKT,
			@Thoi_gian_lam_bai = Inserted.Thoi_gian_lam_bai,
			@Tong_so_cau_hoi = Inserted.Tong_so_cau_hoi

	FROM Inserted

	IF (EXISTS (SELECT * FROM dbo.BAI_KIEM_TRA WHERE ID_BKT = @ID_BKT))
		BEGIN
			RAISERROR(N'ID_BKT đã tồn tại',16,1)
			ROLLBACK TRAN
		END
	ELSE
		BEGIN
			IF (@Tong_so_cau_hoi < 10)
				BEGIN
					RAISERROR(N'Số câu hỏi ít nhất là 10',16,1)
					ROLLBACK TRAN
				END		
			ELSE
				BEGIN
					INSERT INTO BAI_KIEM_TRA
					(
					ID_BKT,
					ID_CD,
					Ten_BKT,
					Thoi_gian_lam_bai,
					Tong_so_cau_hoi
					)
					VALUES (@ID_BKT,@ID_CD,@Ten_BKT,@Thoi_gian_lam_bai,@Tong_so_cau_hoi)
					PRINT 'Thêm thành công'
				END
		END
END


--test, xóa dấu comment
/*
INSERT dbo.BAI_KIEM_TRA
(
    ID_BKT,
    ID_CD,
    Ten_BKT,
    Thoi_gian_lam_bai,
    Tong_so_cau_hoi
)
VALUES
(   'BKT99',  -- ID_BKT - char(10)
    'CD01',  -- ID_CD - char(10)
    N'Kiểm tra hình học', -- Ten_BKT - nvarchar(100)
    15,   -- Thoi_gian_lam_bai - int
    15    -- Tong_so_cau_hoi - int
    )
*/
