USE test1
GO

--純量值函數

CREATE FUNCTION 计算优惠价
(@id int, @fate numeric(3,2))
RETURNS MONEY
BEGIN
  DECLARE @prefer money
  SELECT @prefer = 价格 * @fate
  FROM dbo.书籍01
  WHERE 书籍编号 = @id
  RETURN @prefer
END
GO

SELECT dbo.计算优惠价(1,0.5) AS 优惠价
GO

--嵌入資料表值

CREATE FUNCTION 依書籍價格
(@from smallmoney, @to smallmoney)
RETURNS TABLE
RETURN (SELECT 书籍编号,书籍名称,价格
        FROM dbo.书籍01
        WHERE 价格 >= @from AND 价格 <= @to)
GO

SELECT * 
FROM 依書籍價格(30,38)
ORDER BY 价格 DESC
GO

--多重陳述式資料表值函數
CREATE FUNCTION 相關訂單
(@id int) 
RETURNS @order TABLE(客户编号 int not null,
                     书籍名称 varchar(20) not null,
                     数量 int not null)
BEGIN 
  INSERT @order
  SELECT 客户编号,书籍名称,数量
  FROM dbo.订单01,dbo.书籍01
  WHERE dbo.订单01.书籍编号 = @id
        AND dbo.书籍01.书籍编号 = @id
        
  RETURN
END
GO

SELECT * FROM 相關訂單(1)

