/*添加数据*/
use test1
GO

select * from dbo.订单01
update dbo.书籍01
set 出版公司 = '中美出版社'
where 出版公司 = '美国出版社'

DECLARE @i int,@num int
set @i = 7
while(@i < 12)
begin
set @num = FLOOR(RAND()*19)
insert 订单01(书籍编号, 数量, 客户编号, 單價)
select @num, FLOOR(RAND()*100), @i, 价格
from dbo.书籍01
where dbo.书籍01.书籍编号 = @num
set @i = @i + 1
end
GO

/*添加数据*/
create view record
as
select 客户名称,书籍名称,地址,数量
from dbo.书籍01,dbo.客户资料01,dbo.订单01
where dbo.客户资料01.客户编号=dbo.订单01.客户编号 and dbo.订单01.书籍编号 = dbo.书籍01.书籍编号

select * from record

drop view record
