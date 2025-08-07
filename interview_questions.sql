create database School_Data;
use School_Data;

create table students(
id int primary key not null,
name varchar(50) not null,
department varchar(10) not null,
admission_date date);

insert into students (id, name, department, admission_date) values
(1, "Alice", "CS", "2024-08-01"),
(2, "Bob", "IT", "2024-06-10"),
(3, "Charlie", "CS", "2023-12-15"),
(4, "Daisy", "EC", "2024-07-11"),
(5, "Evan", "IT", "2024-01-25");

select * from students;

create table marks(
id int primary key not null,
student_id int not null,
subject varchar(10) not null,
score int not null,
foreign key (student_id) references students(id)
);

insert into marks (id, student_id, subject, score) values
(1, 1, "Math", 91),
(2, 1, "Python", 88),
(3, 2, "Math", 76),
(4, 2, "Python", 92),
(5, 3, "Math", 85),
(6, 3, "Python",87),
(7, 4, "Math",75),
(8, 4, "Python",78),
(9, 5, "Math",88),
(10, 5, "Python", 90);

select * from marks;

-- Write an SQL query to fetch names of students who scored more than 85 in all subjects.

select s.name from students s
join marks m on s.id = m.student_id
group by s.id, s.name
having min(m.score) > 85;

-- Write a query to find the average score of students in each department.

select s.department, avg(m.score) as average_score
from students s
join marks m on s.id = m.student_id
group by s.department;

-- List students who were admitted in the last 6 months and have an average score greater than 80.

select s.id, s.name, s.admission_date, avg(m.score) as average_score
from students s
join marks m on s.id = m.student_id
where s.admission_date >= date_sub(curdate(), interval 6 month)
group by s.id, s.name, s.admission_date
having avg(m.score) > 80;

SELECT DATE_SUB("2017-06-15", INTERVAL -2 MONTH);