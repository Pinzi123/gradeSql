use test1
go

sp_fulltext_database 'enable'
go

SELECT * 
FROM dbo.客户资料01
WHERE CONTAINS(地址, '"Parkway Fremont" 
                OR "高雄"
                OR "台*" ')--逻辑运算的搜索条件
                
SELECT * 
FROM dbo.客户资料01
WHERE CONTAINS(客户名称,'"龍勝"
                NEAR "公司" ')

--FREETEXT
SELECT *
FROM dbo.客户资料01
WHERE FREETEXT(地址, '台北 1')

--key rank
SELECT 地址,TAble1.RANK
from dbo.客户资料01
INNER JOIN
      CONTAINSTABLE(dbo.客户资料01, 地址, 'ISABOUT( 南京 WEIGHT(0.1),
                    一段 WEIGHT(0.4),
                    敦化 WEIGHT(0.7))',3)
      AS TAble1
      ON 客户编号 = TAble1.[KEY]
      
SELECT 地址,TAble1.*
from dbo.客户资料01
INNER JOIN
      FREETEXTTABLE(dbo.客户资料01, 地址, '忠孝 敦化 重庆')
      AS TAble1
      ON 客户编号 = TAble1.[KEY]
ORDER BY TAble1.RANK DESC