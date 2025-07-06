use my_db3;
CREATE TABLE employees (
  emp_id INT,
  emp_name VARCHAR(50),
  gender VARCHAR(10),
  department VARCHAR(50),
  salary INT,
  performance_rating INT,
  joining_year INT
);

INSERT INTO employees VALUES
(1, 'Sneha', 'Female', 'HR', 50000, 4, 2022),
(2, 'Raj', 'Male', 'IT', 60000, 5, 2021),
(3, 'Priya', 'Female', 'Finance', 58000, 3, 2022),
(4, 'Arjun', 'Male', 'IT', 72000, 4, 2020),
(5, 'Riya', 'Female', 'HR', 52000, 2, 2023),
(6, 'Tanmay', 'Male', 'Finance', 65000, 3, 2021),
(7, 'Divya', 'Female', 'IT', 69000, 5, 2022);

select department, avg(salary) AS avg_salary from employees group by department;

select emp_name, department, rank() over(partition by department order by salary desc) AS highest_paid_employee from employees;
 
select emp_name, salary,performance_rating from employees where performance_rating >= 4 and salary > 60000;

SELECT emp_name, department, salary FROM employees e WHERE salary > (SELECT AVG(salary) FROM employees WHERE department = e.department);

select emp_name, performance_rating, 
case
when performance_rating = 5 then 'Bonus'
else 'No Bonus'
END AS bonus_tag
from employees;
 
SELECT emp_name, salary,
SUM(salary) OVER (partition by department) AS running_total_salary
FROM employees;