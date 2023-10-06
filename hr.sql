page 1;

Quation 1
# Display all information in the tables EMP and DEPT

SELECT *
from hr.employees, hr.departments;

Quation 2
# Display only the hire date and employee name for each employee.

select concat (first_name, "  ", last_name) as name, hire_date
from employees;


Quation 3
# Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title

select concat(first_name, ', ', job_id) as eployees and title
from employees;

Quation 4
#  Display the hire date, name and department number for all clerks.

select  concat(first_name, "  ", last_name), hire_date, department_id
from employees
where job_id  like '%clerk'


Quation 5
# Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT 

select employee_id, first_name, last_NAME, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id 
from employees;

Quation _6
#  Display the names and salaries of all employees with a salary greater than 2000. 

select concat(first_name, "  ", last_name) as name , salary
from employees
where salary >2000;

Quation 7
#  Display the names and dates of employees with the column headers "Name" and "Start 
Date

select concat(first_name, "  ", last_name) as name, hire_date as start_date
from employees;

Quation 8
#  Display the names and hire dates of all employees in the order they were hired

select  concat(first_name, "  ", last_name), hire_date
from employees
order by hire_date;

Quation 9
#  Display the names and salaries of all employees in reverse salary order

select concat(first_name, "  ", last_name), salary
from employees
order by salary desc

Q 10
#  Display 'ename" and "deptno" who are all earned commission and display salary in 
reverse order

select first_name, last_name, department_id
from employees
where commission_pct is not null
order by salary desc


Quation 11
#  Display the last name and job title of all employees who do not have a manager

select  last_name, job_title
from employees as e join jobs as j
on e.job_id = j.job_id
where manager_id is null 

Quation 12
#  Display the last name, job, and salary for all employees whose job is sales representative 
or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000


select last_name, job_id, salary
from employees
where ( job_id = 'sa_rep' or job_id= 'st_clerk')
and salary  not in (2500, 3500, 5000)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
page 2

Quation 1
#  Display the maximum, minimum and average salary and commission earned

select max( salary), min(salary), avg(salary), max(commission_pct), min(commission_pct), avg(commission_pct) 
from employees

Quation 2
#  Display the department number, total salary payout and total commission payout for 
each department

select department_id, sum(salary), sum(commission_pct)
from employees
group by department_id

Question 3
#  Display the department number and number of employees in each department

select  department_id, count(job_id)
from employees
group by department_id

Quation 4
# Display the department number and total salary of employees in each department.

select  department_id, sum(salary)
from employees
group by department_id

Quation 5
#  Display the employee's name who doesn't earn a commission. Order the result set 
without using the column name 

select concat(first_name, "  ", last_name) as name , commission_pct
from employees
where commission_pct is null

Quation 6
#  Display the employees name, department id and commission. If an Employee doesn't 
earn the commission, then display as 'No commission'. Name the columns appropriately

select first_name, department_id,
case
 when commission_pct is null then " no commission"
else commission_pct
end
from employees

Quation 7
#  Display the employee's name, salary and commission multiplied by 2. If an Employee 
doesn't earn the commission, then display as 'No commission. Name the columns 
appropriately


SELECT first_name, salary,
CASE
    WHEN commission_pct > 0 THEN commission_pct * 2
    ELSE 'No Commission'
END
FROM employees

 Q  8
 #  Display the employee's name, department id who have the first name same as another 
employee in the same department
 
 SELECT department_id, first_name
 from employees
 group by department_id, first_name
 having count(first_name) >1
 
 QUE 9
 # Display the sum of salaries of the employees working under each Manager
 
select sum(salary),manger_id
from employees 
group by manager_id

QUE 10
#  Select the Managers name, the count of employees working under and the department 
ID of the manager

 Select employees.department_id, departments.department_name, COUNT(employee_id) as noofemp
 from employees join departments on employees.department_id = departments.department_id
 group by department_id 


  
QUE 11
#  Select the employee name, department id, and the salary. Group the result with the 
manager name and the employee last name should have second letter 'a'

SELECT MAN.FIRST_NAME,MAN.LAST_NAME,  AVG(EMP.SALARY), EMP.DEPARTMENT_ID
FROM EMPLOYEES AS EMP LEFT JOIN EMPLOYEES AS MAN
ON EMP.EMPLOYEE_ID = MAN. EMPLOYEE_ID
GROUP BY MAN.FIRST_NAME,MAN.LAST_NAME ,EMP.DEPARTMENT_ID
HAVING MAN.LAST_NAME LIKE "_A%"

QUE 12
 #  Display the average of sum of the salaries and group the result with the department id. 
Order the result with the department id.

select avg(salary), department_id
from employees
group by department_id
having avg(salary)>(select avg(salary) from employees)

select avg(salary) from employees

QUE 13
#  Select the maximum salary of each department along with the department id 

select department_id, max(salary)
from employees
group by department_id
 
 Que 14
 #  Display the commission, if not null display 10% of salary, if null display a default value 1
 
 select commission_pct, 
 case 
 when commission_pct is not null then (salary * 10)/100
 when commission_pct  is null then 1
 end
 from employees
 
 or
 
 select commission_pct, 
 case 
 when commission_pct is not null then (salary * 10)/100
 else 1
 end
 from employees 
 
 
 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 PAGE 3
 
 QUE 1
 #. Write a query that displays the employee's last names only from the string's 2-5th position with the first letter capitalized and all other letters lowercase, Give each column an 
appropriate label. 

Select last_name,Concat(UPPER(SUBSTRING(last_name,2,1)),LOWER(SUBSTRING(last_name,3,3))) as
'2-5th Last name' from employees


QUE 2
#. Write a query that displays the employee's first name and last name along with a " in between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the 
month on which the employee has joined.

SELECT CONCAT(FIRST_NAME,'-',LAST_NAME) AS 'FULL NAME', MONTH(HIRE_DATE) AS ' JOINING MONTH', HIRE_DATE
FROM EMPLOYEES
ORDER BY MONTH(HIRE_DATE)

QUE 3
# Write a query to display the employee's last name and if half of the salary is greater than ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 
1500 each. Provide each column an appropriate label.

 SELECT LAST_NAME, SALARY,
 CASE 
 WHEN (SALARY/2) >10000 THEN (SALARY+((SALARY*10)/100)+1500)
 ELSE (SALARY+((SALARY*11.5)/100)+1500)
 END 'new salary'
 FROM EMPLOYEES
 

QUE 4
#Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id, 
salary and the manager name all in Upper case, if the Manager name 
consists of 'z' replace it with '$! */

QUE 5
# Write a query that displays the employee's last names with the first letter capitalized and 
all other letters lowercase, and the length of the names, for all employees whose name 
starts with J, A, or M. Give each column an appropriate label. Sort the results by the 
employees' last names.


Select last_name,first_name, 
case 
when first_name like 'J%' or first_name like 'A%' or first_name like 'M%' 
then length(first_name) 
else null 
end 'LEN of J,A,M'
from employees order by last_name;


 QUE 6
 # Create a query to display the last name and salary for all employees. Format the salary to 
be 15 characters long, left-padded with $. Label the column SALARY
 
 SELECT LPAD (SALARY, 15, "$") 'SALARY$',LAST_NAME,SALARY
 FROM  EMPLOYEES
  
 
 QUE 7
 # . Display the employee's name if it is a palindrome 
 
  Select first_name, 
 Case 
 when first_name=REVERSE(first_name) then first_name
 else null end 'Palindrome'
 from employees
 
 QUE 8
 #  Display First names of all employees with initcaps.
 
 select concat(upper(substring(first_name,1,1)), lower(substring(first_name,2)))
 from employees
 
 QUE 9
 #  From LOCATIONS table, extract the word between first and second space from the 
STREET ADDRESS column.

select
SUBSTRING_INDEX(street_address, " ", 2), street_address
from locations
 
 QUE 10
 # Extract first letter from First Name column and append it with the Last Name. Also add "@systechusa.com" at the end. Name the column as e-mail address. All characters should 
be in lower case. Display this along with their First Name. 

select  first_name,
concat(lower(substring(first_name,1,1)), lower(substring(last_name,1, length(last_name))),
'@systechusa.com') 'E-mail Address' from employees
 
 
 QUE  11
# . Display the names and job titles of all employees with the same job as Trenna

Select e.first_name,j.job_title 
from employees e join jobs j  on e.job_id = j.job_id 
where j.job_id = (Select job_id from employees where first_name = 'Trenna')
 
 QUE 12
 
 # Display the names and department name of all employees working in the same city as 
Trenna. 
select  l.city from employees e join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id where e.first_name = 'trenna'

select e.first_name, e.last_name, e. department_id
from employees as e join departments as d  on e. department_id = d. department_id
join locations as l on d. location_id = l. location_id
where L. city = (select  l.city from employees e join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id where e.first_name = 'trenna')


QUE 13
#  Display the name of the employee whose salary is the lowest. 
  
  select concat(first_name,"  ",last_name) as name , salary
  from employees
  where salary =(select min(salary) from employees)
  
  select min(salary) from employees
  
  QUE 14
  # Display the names of all employees except the lowest paid.
  
  select first_name, last_name 
  from employees
  where salary != (Select MIN(salary) from employees)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
PAGE 4

QUE 1
#. Write a query to display the last name, department number, department name for all employees.

select e. last_name, d. department_name, e. department_id
from employees as e join departments as d
on e. department_id = d. department_id;

QUE 2
# Create a unique list of all jobs that are in department 4. Include the location of the department in the output.

Select Distinct(j.job_title),d.department_name,l.city
from employees e join departments d on e.department_id = d.department_id
join jobs j on e.job_id = j.job_id join locations l on d.location_id = l.location_id
where d.department_id in (10,20,30,40)


QUE 3
# . Write a query to display the employee last name,department name,location id and city of all employees who earn commission.

select e. last_name, d. department_name, l. location_id, l. city
from employees as e join departments as d 
on e. department_id = d. department_id  join  locations as l 
on l. location_id = d. location_id
where e.commission_pct is not null


QUE 4
#. Display the employee last name and department name of all employees who have an 'a' in their last name.

select e. last_name, d. department_name
from employees as e join departments as d
on e. department_id = d. department_id
where e. last_name like '%a%'

QUE 5
# . Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA.

select e. last_name, e. job_id, d. department_id, d. department_name
from employees as e join departments as d 
on e. department_id = d. department_id join locations as l
on d. location_id = l. location_id
where l.state_province = 'California'

QUE 6
#  Display the employee last name and employee number along with their manager's last name and manager number.

select e. last_name as employeename, e. employee_id, m. last_name as managername, m. manager_id 
from employees as e join employees as m
on e.employee_id = m. manager_id ;

#QUE 7
# Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager).

select e. last_name as employee_name , e. employee_id, m.last_name as manager_name, m.manager_id
from employees as e  join employees as m
on e. employee_id = m. manager_id                                                                              # left join / left outer join
group by e.employee_id,m.manager_id,m.last_name;


#QUE 8
# Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee. 

select last_name, department_id 
from employees 
order by department_id;

#QUE 9
# . Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)

select concat(e.first_name,"  ", e.last_name) as full_name , d.department_name, e.salary,
case when e.salary >= 50000 then 'a'
when e.salary >= 30000 then 'b'
else 'c' 
end 'grade'
from employees as e join departments as d on e. department_id = d.department_id


QUE 10
#  Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. Label the columns as
 Employee name, emp_hire_date,manager name,man_hire_date
 
 select e.first_name, e.hire_date as man_hire_date, m.first_name, m.hire_date as emp_hire_date
 from employees as e join employees as m on e.employee_id = m.manager_id 
 where m.hire_date > e.hire_date
 
 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 PAGE 5
 QUE 1
#Write a query to display the last name and hire date of any employee in the same department as SALES.  
 
 select e.last_name, e.hire_date, d.department_name
 from employees as e join departments as d
 on e.department_id=d.department_id
 where d.department_name ='sales'
 
 QUE 2
 #create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary. 
 
 select employee_id, last_name,salary
 from employees 
 where salary > (select avg(salary) from employees) order by salary
 
 QUE 3
 # Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a' u
 
 select department_id, last_name
 from employees
 where department_id is not null and last_name like '%u%'
 
 QUE 4
 #Display the last name, department number, and job ID of all employees whose department location is ATLANTA.
 
 SELECT e. last_name, d.department_id, e.job_id 
 from employees as e join departments as d
 on e. department_id= d.department_id join locations as l
 on d.location_id = l.location_id
 where l.state_province = 'washington'
 
 QUE 5
 # Display the last name and salary of every employee who reports to FILLMORE.
 
 Select m.last_name,m.salary     
 from employees e join employees m 
 on e.employee_id = m.employee_id 
 where e.last_name = 'King'
  
 QUE 6
 #Display the department number, last name, and job ID for every employee in the OPERATIONS department. 

select e. department_id, e.last_name, e. job_id
from employees as e join departments as d
on e. department_id = d. department_id
where d.department_name = 'operations'

QUE 7
# Modify the above query to display the employee numbers, last names, and salaries of all employees who earn more than the average salary and who work in 
a department with any employee with a 'u'in their name.

select employee_id, last_name, salary
from employees
where department_id is not null and last_name like '%u%' and salary > (select avg(salary) from employees) 

QUE 8
#. Display the names of all employees whose job title is the same as anyone in the sales dept.

select e.first_name, j.job_title
from employees as e join departments as d on e.department_id = d. department_id
join jobs as j on j.job_id = e.job_id
where d. department_name = 'sales'

QUE 9
# Write a compound query to produce a list of employees showing raise percentages, 
employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, 
employees in department 2 are given a 10% raise, employees in departments 4 and 5 are 
given a 15% raise, and employees in department 6 are not given a raise. 

SELECT employee_id, department_id, salary,
case when department_id in (10,30) then salary+((salary*5)/100)
     when department_id = 20 then salary+((salary*10)/100)
     when department_id in(40,50) then salary+((salary*15)/100)
     when department_id = 60 then salary
     else salary end 'new salary'
from employees     
where department_id  in (10,20,30,40,50,60)

QUE 10
# Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries. 

select last_name, salary
from employees 
order by salary desc
limit 3

QUE 11
#. Display the names of all employees with their salary and commission earned. Employees with a null commission should have O in the commission column

select concat(first_name,"  ", last_name) as name, salary,
case when  commission_pct is null then 0 else commission_pct end 'commission'
from employees 

QUE 12
#display the Managers (name) with top three salaries along with their salaries and department information.

Select distinct(e.first_name), e.salary ,e.department_id from employees e join employees m 
on e.employee_id = m.manager_id
order by salary desc
limit 3

