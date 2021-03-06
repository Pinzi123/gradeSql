USE school
GO
/**
课程
1 中文
2 数学
3 英文
年级
1 高一
2 高二
3 高三
**/

--建立基本表

CREATE TABLE teachers(
id int IDENTITY PRIMARY KEY,
name varchar(10) not null,
age int null,
sex varchar(2)  check(sex = '男' or sex = '女') DEFAULT '男',
couserID INT NOT NULL
)
GO

CREATE TABLE classes(
id int IDENTITY PRIMARY KEY,
name varchar(10) not null,
grade int check(grade < 4 and grade > 0),
number int not null,
chinese int references teachers(id) null,
cteacher varchar(10) null,
math int references teachers(id) null,
mteacher varchar(10) null,
english int references teachers(id) null,
eteacher varchar(10) null,
headteacher int references teachers(id) not null,
hteacher varchar(10) null
)
GO
create index IX_className
on classes(name)
GO
alter table classes
add constraint UN_className
    UNIQUE(name)



CREATE TABLE students(
id int IDENTITY PRIMARY KEY,
name varchar(10) not null,
age int null,
sex varchar(2)  check(sex = '男' or sex = '女') DEFAULT '男',
classID int references classes(id) not null,
className varchar(10)
)

alter table students
add constraint FK_className
    foreign key (className) references classes(name)
    on update cascade on delete cascade

create index IX_stuName
on students(name,className)
GO

CREATE TABLE testScore(
id int IDENTITY PRIMARY KEY,
name varchar(30) not null,
grade int check(grade < 4 and grade > 0) null,
score int check(score<150) default 0,
stuID int references students(id) not null,
className varchar(10) null,
couserID INT NOT NULL,
testTime smalldatetime not null 
)
GO

--0:班主任
--1:中文老師
--2:數學老師
--3;英文老師
CREATE FUNCTION queryTeacher
(@subject int)
RETURNS @t TABLE(id int not null,
                 name varchar(10) not null)
begin
if(@subject = 0)
begin
insert @t
select dbo.classes.id,dbo.teachers.name
from dbo.classes,dbo.teachers
where dbo.teachers.id = headteacher
end

if(@subject = 1)
begin
insert @t
select dbo.classes.id,dbo.teachers.name
from dbo.classes,dbo.teachers
where dbo.teachers.id = chinese
end

if(@subject = 2)
begin
insert @t
select dbo.classes.id,dbo.teachers.name
from dbo.classes,dbo.teachers
where dbo.teachers.id = math
end

if(@subject = 3)
begin
insert @t
select dbo.classes.id,dbo.teachers.name
from dbo.classes,dbo.teachers
where dbo.teachers.id = english
end
 
return
end
GO

--建立视图
CREATE VIEW subjectTeacher
AS
SELECT classes.id as 班級編號,classes.name as 班級名稱,h.name as 班主任,
       c.name as 中文老師,
       m.name as 數學老師,
       e.name as 英文老師
FROM dbo.classes,queryTeacher(0) as h,queryTeacher(1) as c,queryTeacher(2) as m,queryTeacher(3) as e
where classes.id = h.id
      and classes.id = c.id
      and classes.id = m.id
      and classes.id = e.id
GO

select * from subjectTeacher
