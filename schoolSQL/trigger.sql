USE school
GO
--班级保存时class
drop  trigger classTeacher
go
create trigger classTeacher
on dbo.classes
after insert,update
as
begin
update dbo.classes
set cteacher = (select teachers.name from teachers where teachers.id = classes.chinese)

update dbo.classes
set eteacher = (select teachers.name from teachers where teachers.id = classes.english)

update dbo.classes
set mteacher = (select teachers.name from teachers where teachers.id = classes.math)

update dbo.classes
set hteacher = (select teachers.name from teachers where teachers.id = classes.headteacher)
end
go

--班级自动计算人数
DROP trigger classNumberAdd
GO
create trigger classNumberAdd
on dbo.students
after insert
as
begin
update dbo.classes
set number = b.count + number
FROM (SELECT COUNT(*) AS count, classID
      FROM inserted
      group by classID) AS b
where dbo.classes.id =b.classID
end
go

create trigger classNumberCut
on dbo.students
after delete
as
begin
update dbo.classes
set number = number - b.count
FROM (SELECT COUNT(*) AS count, classID
      FROM deleted
      group by classID) AS b
where dbo.classes.id =b.classID
end
go


/**学生班级在插入时ID自动赋值**/

create trigger classIDAdd
on dbo.students
instead of insert
as
begin
insert dbo.students(name, age, sex, classID, className)
select inserted.name,inserted.age,inserted.sex,b.classID,inserted.className
from inserted,(select dbo.classes.id as classID , inserted.className as className 
               from dbo.classes
               inner join inserted
               on inserted.className = dbo.classes.name)as b
where inserted.className = b.className
end
go

/* 学生的班级名字修改 */
drop trigger classNameModify
go
create trigger classNameModify
on dbo.students
after update
as
if UPDATE(className)
begin

--原来的班级人数减一
update dbo.classes
set number =  number - a.count
FROM (SELECT COUNT(*) AS count, students.classID
      FROM inserted,dbo.students
      where inserted.id = dbo.students.id
      group by students.classID) a
where dbo.classes.id = a.classID

--修改班级ID
update dbo.students
set classID = b.classID
from (select dbo.classes.id as classID ,inserted.id as id
      from dbo.classes
      inner join inserted
      on inserted.className = dbo.classes.name) b
WHERE dbo.students.id = b.id

--现在的班级人数加一
update dbo.classes
set number =  number + c.count
FROM (SELECT COUNT(*) AS count, className
      FROM inserted
      group by className) AS c
where dbo.classes.name =c.className
end
go

/*添加成绩是自动填充年级和班级*/
create trigger ScoreAdd
on dbo.testScore
after insert
as
begin
update dbo.testScore
set grade = classes.grade,
    className = classes.name
from inserted,dbo.classes,dbo.students
where dbo.testScore.stuID = inserted.stuID
      and students.id = inserted.stuID
      and classes.id = students.classID
end