# 1.查询同时存在1课程和2课程的情况

select * from (select * from student s, student_course sc where s.id=sc.studentId and sc.courseId=1) a inner JOIN (select * from student s, student_course sc where s.id=sc.studentId and sc.courseId=2) b on a.studentId=b.studentId;
# 2.查询同时存在1课程和2课程的情况
select * from (select * from student s, student_course sc where s.id=sc.studentId and sc.courseId=1) a inner JOIN (select * from student s, student_course sc where s.id=sc.studentId and sc.courseId=2) b on a.studentId=b.studentId;

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select a.id,a.name,avg(b.score) avgscores from student a inner JOIN student_course b on a.id=b.studentId GROUP BY b.studentId HAVING avgscores >=60;
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select * from student where id not in (select studentId from student_course);
# 5.查询所有有成绩的SQL
select * from student_course;
# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select a.id,a.name,a.age,a.sex from (select * from student s, student_course sc where s.id=sc.studentId and sc.courseId=1) a inner JOIN (select * from student s, student_course sc where s.id=sc.studentId and sc.courseId=2) b on a.studentId=b.studentId;
# 7.检索1课程分数小于60，按分数降序排列的学生信息
select a.id,a.name,a.age,a.sex,b.score  from student a inner JOIN student_course b on a.id=b.studentId and b.score<60 and b.courseId=1 ORDER BY b.score desc;
# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
SELECT courseId,avg(score) s from student_course GROUP BY courseId ORDER BY s desc ,courseId asc;
# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
SELECT c.name,c.score from (select * from student a inner join student_course b on a.id =b.studentId) c inner join course d on c.courseId=d.id and d.name='数学' and c.score<60;
