USE test1
GO

/*IF...ELSE*/
IF 'C++' IN (SELECT 书籍名称 FROM dbo.书籍01)
  PRINT 'I HAVE C++'
ELSE
  PRINT 'I DONT HAVE C++'
 GO
 
IF 1000> ALL(SELECT 价格 FROM dbo.书籍01)
  PRINT 'NO MORE THAN 1000'
GO

DECLARE @a INT,@answer CHAR(10)
SET @a = 3

SET @answer = CASE @a
                   WHEN 1 THEN 'A'
                   WHEN 2 THEN 'B'
                   WHEN 3 THEN 'C'
                   WHEN 4 THEN 'D'
                   ELSE 'OTHERS'
               END
PRINT 'THIS IS ' + @answer\
GO

/* 特殊的程序控制 */
CREATE PROCEDURE CheckOrder AS --创建自定义的预存程序

IF EXISTS (SELECT * FROM dbo.订单01 WHERE 客户编号 = 2)
   RETURN 1
ELSE
   RETURN 2
GO

DECLARE @value int
EXEC @value = CheckOrder
PRINT @value
GO

/* 错误处理 */
EXEC sp_addmessage 66666, 7, 'Monsters!',
@lang = 'us_english'
GO
EXEC sp_addmessage 66666, 7, '有怪獸!',
@lang = '繁體中文'
GO
RAISERROR (66666, 7, 1)
GO

/* CTE
   可以自己查詢自己 */
WITH staff_CTE (staff_num, name, pre_num, level, sort)
AS(
SELECT staff_num, name, pre_num, 1, CONVERT(VARCHAR(30), name)
FROM dbo.staff
WHERE pre_num = 0
UNION ALL
SELECT staff.staff_num, staff.name, staff.pre_num, staff.level + 1, CONVERT(VARCHAR(30), sort + '-' +staff.name)
FROM staff
JOIN staff_CTE ON staff.pre_num = staff_CTE.staff_num)
SELECT *
FROM staff_CTE
GO
