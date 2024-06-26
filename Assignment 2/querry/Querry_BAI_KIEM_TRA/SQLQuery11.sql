USE [TEST_ONLINE_03]
GO
/****** Object:  Trigger [dbo].[trig_update_BKT]    Script Date: 11/12/2019 1:01:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [dbo].[trig_update_BKT] ON [dbo].[BAI_KIEM_TRA]
AFTER INSERT
AS
DECLARE
@ID_BKT varCHAR(10),
@ID_CD varCHAR(10),
@Ten_BKT NVARCHAR(100),
@Thoi_gian_lam_bai INT,
@Tong_so_cau_hoi INT

SELECT @ID_BKT=Inserted.ID_BKT,
		@ID_CD=Inserted.ID_CD,
		@Ten_BKT=Inserted.Ten_BKT,
		@Thoi_gian_lam_bai=Inserted.Thoi_gian_lam_bai,
		@Tong_so_cau_hoi=Inserted.Tong_so_cau_hoi
FROM Inserted

IF(@Tong_so_cau_hoi<10)
BEGIN
	RAISERROR ('Số câu hỏi ít nhất là 10',16,1);
	ROLLBACK TRAN;
END
ELSE
BEGIN
	INSERT dbo.BAI_KIEM_TRA
	(
	    ID_BKT,
	    ID_CD,
	    Ten_BKT,
	    Thoi_gian_lam_bai,
	    Tong_so_cau_hoi
	)
	VALUES
	(   @ID_BKT,  -- ID_BKT - char(10)
	    @ID_CD,  -- ID_CD - char(10)
	    @Ten_BKT, -- Ten_BKT - nvarchar(100)
	    @Thoi_gian_lam_bai,   -- Thoi_gian_lam_bai - int
	    @Tong_so_cau_hoi    -- Tong_so_cau_hoi - int
	    )
END
