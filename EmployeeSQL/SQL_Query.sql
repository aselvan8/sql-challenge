--1.List the following details of each employee: employee number, last name, first name, sex, and salary
Select
	e.emp_no as "employee number",
	e.last_name as "last name",
	e.first_name as "first name",
	e.sex,
	s.salary
from "Employees" as e
	inner join "Salaries" as s
		on e.emp_no = s.emp_no;
		
		
--2.List first name, last name, and hire date for employees who were hired in 1986
select
		first_name as "first name",
		last_name as "last name",
		hire_date as "hire date"
from "Employees" where date_part('year', hire_date) = 1986;
--from "Employees" where extract(year from hire_date) = 1986;


--3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name
select 
	d.dept_no as "department number",
	d.dept_name as "department name",
	dm.emp_no as "manager employee number",
	e.last_name as "last name",
	e.first_name as "first name"
from "Departments" as d
	join "Dept_manager" as dm
		on d.dept_no = dm.dept_no
	join "Employees" as e
		on dm.emp_no = e.emp_no


--4.List the department of each employee with the following information: employee number, last name, first name, and department name
select 
	e.emp_no as "employee number",
	e.last_name as "last name",
	e.first_name as "first name",
	d.dept_name as "department name"
from "Employees" as e
	full join "Dept_emp" as de
		on e.emp_no = de.emp_no
	left join "Departments" as d
		on de.dept_no = d.dept_no
		
		
--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select 
	first_name as "first name",
	last_name as "last name",
	sex
from "Employees" where first_name = 'Hercules' and last_name like 'B%'


--6.List all employees in the Sales department, including their employee number, last name, first name, and department name
select 
	e.emp_no as "employee number",
	e.last_name as "last name",
	e.first_name as "first name",
	d.dept_name as "department name"
from "Employees" as e
	full join "Dept_emp" as de
		on e.emp_no = de.emp_no
	left join "Departments" as d
		on de.dept_no = d.dept_no
where d.dept_name = 'Sales'


--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
select 
	e.emp_no as "employee number",
	e.last_name as "last name",
	e.first_name as "first name",
	d.dept_name as "department name"
from "Employees" as e
	full join "Dept_emp" as de
		on e.emp_no = de.emp_no
	left join "Departments" as d
		on de.dept_no = d.dept_no
where d.dept_name in ('Sales','Development')


--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
select 
	last_name as "last name",
	count(last_name) as "frequency of employee last name"
from "Employees" group by last_name
order by "frequency of employee last name" desc