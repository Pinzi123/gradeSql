USE school
GO

/* 添加老师 */
DECLARE @i int
SET @i = 0
WHILE(@i < 20)
BEGIN
--waitfor delay '00:00:00:10'
INSERT teachers (name, age, couserID)
values ('老师', cast( floor(rand()*40) as int)+20,cast( floor(rand()*3) as int)+1)
SET @i = @i + 1
END
GO
select * from teachers
GO

/* 添加班级·*/
DECLARE @i int
SET @i = 0
WHILE(@i < 20)
BEGIN
INSERT dbo.classes (name, grade, number, chinese, math, english, headteacher)
values ('班级' + cast(@i as varchar(2)),
                 cast( floor(rand()*3) as int)+1, 
                 0,
                 cast( floor(rand()*20) as int)+1, 
                 cast( floor(rand()*20) as int)+1, 
                 cast( floor(rand()*20) as int)+1,
                 @i + 1)
SET @i = @i + 1
END
select * from classes
GO

/* 添加学生 */
CREATE PROC AddClassmate
@className varchar(10)
AS
DECLARE @i int,@sex varchar(2)
SET @i = 0
WHILE(@i < 20)
BEGIN

set @sex = '女'
if(@i%2 = 0) 
begin
set @sex = '男'
end

INSERT dbo.students (name, age, sex, className)
VALUES ('同学' + cast(@i as varchar(2)),
                 cast( floor(rand()*5) as int)+14, 
                 '男',
                 @className)
SET @i = @i + 1
END
GO

EXEC AddClassmate 高一一班
EXEC AddClassmate 高一二班
EXEC AddClassmate 高一二班
EXEC AddClassmate 高二二班

select * from dbo.students
GO

/* 添加成绩 */
CREATE PROC AddScore
@courerID int,--科目
@name varchar(10),--考试名称
@min int,--学号范围
@max int,
@time smalldatetime
AS
DECLARE @i int
SET @i = @min
WHILE(@i <= @max)
BEGIN
insert dbo.testScore(name, score, stuID, couserID, testTime)
values (@name,cast( floor(rand()*80) as int)+70,@i,@courerID,@time)
set @i = @i + 1
END
GO
EXEC AddScore 1, '2017 Final',2, 103,'2017-4-20'
EXEC AddScore 2, '2017 Final',2, 103,'2017-4-21'
EXEC AddScore 3, '2017 Final',2, 103,'2017-4-22'
SELECT * FROM testScore
GO

SELECT stuID,dbo.students.name,testScore.name as testName,score,className,testTime
FROM testScore,dbo.students
where couserID = 1
      AND testScore.stuID = students.id
order by score desc
GO
/**获得单科成绩排名表**/
CREATE FUNCTION GetScoreByName
(@couserID int,
 @name varchar(30),
 @grade varchar(10)
 )
 RETURNS TABLE
 RETURN (
 select stuID,dbo.students.name,testScore.name as testName,score,testScore.className,testTime
 from   testScore,dbo.students
 where  couserID = @couserID
        AND testScore.name = @name
        AND testScore.stuID = students.id
        AND testScore.grade = @grade)
 GO

 CREATE FUNCTION GetScoreByTime
(@couserID int,
 @time smalldatetime,
 @grade varchar(10)
 )
 RETURNS TABLE
 RETURN (
 select stuID,dbo.students.name,testScore.name as testName,score,testScore.className,testTime
 from   testScore,dbo.students
 where  couserID = @couserID
        AND testScore.testTime = @time
        AND testScore.stuID = students.id
        AND testScore.grade = @grade)
 GO
select * from GetScoreByName(3,'2017 Final',2) order by score desc
GO
/**获得总成绩排名表**/
CREATE FUNCTION GetScoreoOrder
(@name varchar(30),
 @grade varchar(10))
RETURNS TABLE
RETURN(
select chinese.testName,chinese.name, chinese.score as chineseScore, math.score as mathScore, english.score as englishScore,
      chinese.score +  math.score + english.score as totalScore,
      chinese.className,chinese.testTime
from GetScoreByName(1,@name,@grade) as chinese,
     GetScoreByName(2,@name,@grade) as math,
     GetScoreByName(3,@name,@grade) as english
where chinese.stuID = math.stuID
      and chinese.stuID = english.stuID)
GO
SELECT * FROM GetScoreoOrder('2017 Final',1) AS TOTAL
ORDER BY TOTAL.totalScore DESC
GO
/**使用case when 查詢老師教學學科**/
select t.name,
    (case t.couserID
       when 1 then '中文'
       when 2 then '數學'
       when 3 then '英文'
       else '空的'
      end
     )性别
 from dbo.teachers t
 go