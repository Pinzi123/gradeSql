 use test1
 GO
 
 --创建触发器
 CREATE TRIGGER 添加订单
 ON dbo.订单01
 AFTER INSERT
 AS
 IF EXISTS(SELECT 书籍编号 FROM inserted)
 BEGIN
  update dbo.订单01 set 單價=价格  from dbo.书籍01,inserted where inserted.书籍编号 = dbo.书籍01.书籍编号 and inserted.订单编号 = dbo.订单01.订单编号
 END
 GO
 
 CREATE TRIGGER 修改订单
 ON dbo.订单01
 AFTER UPDATE
 AS
 IF UPDATE(书籍编号)
 BEGIN
 update dbo.订单01 set 單價=价格  from dbo.书籍01,inserted where inserted.书籍编号 = dbo.书籍01.书籍编号 and inserted.订单编号 = dbo.订单01.订单编号
 END
 GO
 
 --创建预存程序
 CREATE PROCEDURE MyProc1
 @param1 int, @param2 int, @param3 int, @param4 smallmoney OUTPUT
 AS INSERT dbo.订单01(书籍编号, 数量, 客户编号)  
    VALUES(@param1,@param2,@param3)
    select @param4 = 總價
    from  dbo.订单01
    where dbo.订单01.订单编号 = 
    
GO    

CREATE PROCEDURE MyProc2
@param1 smallmoney
as print '当前订单总价：' + CONVERT(varchar, @param1)
GO

--使用
DECLARE @sum smallmoney
EXEC MyProc1 1,1,1, @sum OUTPUT
EXEC MyProc2 @sum    
GO

--自定义错误信息
EXEC sp_addmessage 66667, 7, 'Table is not correct',
@lang = 'us_english'
GO
EXEC sp_addmessage 66667, 7, '表名不正确或者编码有问题',
@lang = '繁體中文'
GO

--预存程序的三种传回值
CREATE PROCEDURE TestRetVal
@TableName varchar(30) OUTPUT
AS
DECLARE @sqlstr varchar(100)
SET @sqlstr = 'SELECT * FROM ' + @TableName
EXEC (@sqlstr)
IF @@ERROR <= 0
   BEGIN
     SET @TableName = 'Hello,' + @TableName
     PRINT @@ERROR
     RETURN 0
   END
ELSE
  BEGIN
    RAISERROR(66667,7,1)
    RETURN 1
  END
PRINT @@ERROR
GO

DROP PROCEDURE TestRetVal

DECLARE @ret int, @name varchar(30)
SET @name = '书籍01'
EXEC @ret = TestRetVal @name OUTPUT
PRINT @name + ',RETURN ' + CAST(@ret AS CHAR)
GO
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                