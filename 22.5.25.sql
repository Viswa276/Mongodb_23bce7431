USE vit;
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT,
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(1, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
		(2, 'Niharika', 'Verma', 80000, '2011-06-14 09:00:00', 'Admin'),
		(3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
		(4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
		(5, 'Vivek', 'Bhati', 500000, '2011-06-14 09:00:00', 'Admin'),
		(6, 'Vipul', 'Diwan', 200000, '2011-06-14 09:00:00', 'Account'),
		(7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
		(8, 'Geetika', 'Chauhan', 90000, '2011-04-14 09:00:00', 'Admin');

SELECT department, SUM(salary) AS sume 
FROM worker 
GROUP BY department 
ORDER BY sume DESC 
LIMIT 1;

SELECT department 
FROM worker 
GROUP BY department 
ORDER BY COUNT(department) DESC 
LIMIT 1;

SELECT department, COUNT(department) 
FROM worker 
GROUP BY department 
HAVING COUNT(department) > 3;

SELECT department, SUM(salary)
FROM worker
GROUP BY department
ORDER BY SUM(salary) DESC
LIMIT 1 OFFSET 2;

SELECT * FROM worker 
WHERE salary = (SELECT MAX(salary) FROM worker);

SELECT first_name, department 
FROM Worker 
WHERE salary > (SELECT AVG(salary) FROM Worker);

SELECT first_name, department 
FROM Worker 
WHERE salary = (
    SELECT DISTINCT salary 
    FROM Worker 
    ORDER BY salary DESC 
    LIMIT 1 OFFSET 1
);
select department from worker 
 group by department having 
 count(department) > (select 
 count(department) having 
 avg(salary)>20000);
 
 create table address(
s_id int,
s_address varchar(25));
insert into address values (101,'coimbatore'),(104,'chennai'),(105,'pune');

create table student(
s_id int,
s_name varchar(25)
);
insert into student values (101,'jayanth'),(102,'karthik'),(103,'Praveen'),(105,'mahesh'),(106,'Arun'); 

select * from  address cross join student;
SELECT *  
FROM address  
INNER JOIN student 
ON address.s_id = student.s_id;

select * from address left outer join student on (student.s_id= address.s_id);

select * from student right  outer join address on (student.s_id= address.s_id);

SELECT SALARY
FROM Worker W1
WHERE 4 = (
    SELECT COUNT(*)
    FROM Worker W2
    WHERE W2.SALARY > W1.SALARY
);