use test1
go

DECLARE BOOK CURSOR
FOR SELECT 书籍名称
    FROM dbo.书籍01
    WHERE 价格<38

OPEN BOOK

DECLARE @name varchar(25),
        @list varchar(500),
        @cnt int
SET @list = '低於38的書有：'
SET @cnt = 0

FETCH NEXT FROM BOOK
INTO @name


WHILE (@@FETCH_STATUS = 0)
BEGIN
  SET @list = @list + @name + ','
  SET @cnt = @cnt + 1
  FETCH NEXT FROM BOOK
  INTO @name
END

SET @list = @list + '共' + CAST(@cnt AS VARCHAR) + '本'

CLOSE BOOK
DEALLOCATE BOOK
PRINT @list
