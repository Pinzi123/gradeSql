USE test1
GO

drop TRIGGER 插入书籍
go

-- INSTEAD OF
CREATE TRIGGER 插入书籍
ON dbo.书籍01
INSTEAD OF INSERT
AS
 SET NOCOUNT ON
 
 UPDATE dbo.书籍01
 SET dbo.书籍01.价格 = inserted.价格,
     dbo.书籍01.庫存 = inserted.庫存,
     dbo.书籍01.简介 = inserted.简介
 FROM dbo.书籍01 JOIN inserted
                 ON dbo.书籍01.书籍编号 = inserted.书籍编号
                 OR (dbo.书籍01.书籍名称 = inserted.书籍名称
                     AND  dbo.书籍01.出版公司 = inserted.出版公司)
 PRINT 'UPDATE ' + CAST(@@ROWCOUNT AS VARCHAR) + ' times'
 
 INSERT 书籍01 (书籍名称, 价格, 出版公司, 简介, 庫存)
 SELECT 书籍名称, 价格, 出版公司, 简介, 庫存 FROM inserted
 WHERE inserted.书籍编号 NOT IN (SELECT 书籍编号 FROM dbo.书籍01)
       AND inserted.书籍名称 NOT IN (SELECT inserted.书籍名称 FROM dbo.书籍01,inserted
                                     WHERE dbo.书籍01.书籍名称 = inserted.书籍名称
                                     AND  dbo.书籍01.出版公司 = inserted.出版公司)
 PRINT 'INSERT ' + CAST(@@ROWCOUNT AS VARCHAR) + ' times'
 GO
 
 --例子
 INSERT 书籍01 (书籍名称, 价格, 出版公司, 简介, 庫存)
 VALUES ('Nodejs', 18, '中美出版社', '這是本好書啊啊', 100)
 GO
 
 INSERT 书籍01 (书籍名称, 价格, 出版公司, 简介, 庫存)
 VALUES ('women', 58, '花旗出版社', '這是本好書啊啊', 100)
 GO
 
 --AFTER
 DROP TRIGGER 添加庫存
 GO
 
 CREATE TRIGGER 添加庫存
 ON dbo.书籍01
 AFTER INSERT,UPDATE
 AS
 IF (SELECT 庫存 FROM inserted)>500
 BEGIN
   PRINT '插入庫存不能大於500!'
   ROLLBACK
 END
 GO
 
 --例子
 UPDATE dbo.书籍01
 SET 庫存 = 400
 WHERE 书籍编号 = 1