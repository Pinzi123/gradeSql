use test1
go
/* 规则物件(Rules) */

CREATE RULE Price_rule
AS @price >= 1 AND @price <=500
GO

CREATE RULE charset_rule
AS @charset LIKE 'FO[1-9][1-9]-[A-E]_'
GO

CREATE RULE Gender_rule
AS @gender IN ('男','女')
GO

CREATE TABLE t (c1 int) ;  
-- Notice the period as part of the table name.  
EXEC sp_bindrule Price_rule, 't.c1' ;  

EXEC sp_bindrule Price_rule, '书籍01.价格'--不能用中文,乱码不能识别
GO

EXEC sp_unbindrule 't.c1' 
DROP RULE Price_rule
go
DELETE t
drop table t
go

/* 预设值物件(Defaults) */

create default sex_df
AS '男'
go
create default int_df
AS 1
GO
use test1
EXEC sp_bindefault  int_df, 't.c1'
GO

use test1
go
EXEC sp_bindefault sex_df, 'dbo.My_table.test'

/* 自定义资料类型(User-defined Data TYpes, UDTs) */
EXEC sp_addtype PayDay, datetime, 'NULL'
CREATE TABLE t (c1 dbo.PayDay)
GO
drop table t
go 