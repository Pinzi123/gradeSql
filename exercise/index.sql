use test1
go

--创建索引

create table table_3
(
c1 int not null primary key,
c2 char(4),
c3 char(6),
c4 char(30)
)

create index myIndex_1
on table_3(c1)

create index myIndex_2
on table_3(c2,c3)

create table table_4
(
productID smallint not null primary key,
productName char(30),
price smallmoney,
manufacturer char(30)
)

create unique nonclustered index index_3
on table_4 (productName) include (price)
with pad_index,fillfactor=30,ignore_dup_key

-- 查看资料表里的索引
exec sp_helpindex table_3

--删除索引
--资料表里设定的Primary key 和 unique条件这种方法是不能删除的
drop index table_3.myIndex_2

--这种可以删除
alter table table_3 drop constraint PK__table_3__3213663B2F10007B

--修改或重建索引
create unique nonclustered index index_3
on table_4(price)
with pad_index, fillfactor=30, ignore_dup_key, drop_existing--最后这个是关键

DBCC DBREINDEX (table_3, myIndex_1, 70)

--填充资料
declare @i int
set @i = 100
while(@i<200)
begin
insert dbo.table_4(productID, productName, price, manufacturer)
values(@i, '商品' + CAST(@i as varchar), 100 ,'第三方' + CAST(@i as varchar))
set @i = @i + 1
end

--搜索
select price
from dbo.table_4
where productName = '商品1'

-- 在检视表里创建索引
-- 先设定见了索引的7个条件
SET ARITHABORT, CONCAT_NULL_YIELDS_NULL,
QUOTED_IDENTIFIER, ANSI_NULLS,
ANSI_PADDING, ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO

alter table dbo.订单01
add 下单日期 datetime default getdate()
go
insert  dbo.订单01(书籍编号, 数量, 客户编号, 單價)
values(2,10,1,1)
update dbo.订单01
set 下单日期 = DATEADD(day, -5, getdate())
where 订单编号 = 30
go

CREATE VIEW 产品日报
WITH SCHEMABINDING --这是建立索引的必要参数
AS 
SELECT convert(varchar(10),下单日期,120) as 日期,书籍编号 as 书号,
SUM(数量) as 每日销售量, COUNT_BIG(*) as 每日订单数
from dbo.订单01
group by convert(varchar(10),下单日期,120),书籍编号
go

select * from 产品日报

--建立view的索引
create unique clustered index pk_产品日报
on 产品日报(日期,书号)
go

select *, DENSE_RANK() over(order by 每日销售量 desc) as 销量排行
from dbo.产品日报
where 日期 = '2017-07-20'

