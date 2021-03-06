USE test1
GO

/* ALTER TABLE dbo.书籍01
      WITH CHECK ADD
      CHECK (庫存 >= 0) */

BEGIN TRAN
UPDATE dbo.书籍01
SET 庫存 = 庫存 + 1
WHERE 书籍编号 = 3

IF @@ERROR > 0 OR @@ROWCOUNT <> 1
   GOTO NeedRollBack
   
UPDATE dbo.书籍01
SET 庫存 = 庫存 - 1
WHERE 书籍编号 = 4



NeedRollBack:
IF @@ERROR > 0 OR @@ROWCOUNT <> 1
   ROLLBACK TRAN
ELSE
   COMMIT TRAN

SELECT * FROM dbo.书籍01
WHERE 书籍编号 = 3 OR 书籍编号 = 4
GO


SELECT * FROM staff
WHERE name like '_大%'
