--Query  employee number, last name, first name, sex, and salary.

select employees.emp_no, last_name, first_name, sex, salary
from employees
join salaries
on employees.emp_no = salaries.emp_no

--Query first name, last name, and hire date for employees who were hired in 1986

select emp_no, first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31'

--list manager of each department with department number, department name
--the manager's employee number, last name, first name

select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager
join departments
	on dept_manager.dept_no = departments.dept_no
join employees
	on dept_manager.emp_no = employees.emp_no
join dept_emp
	on dept_manager.dept_no = departments.dept_no
	
--list the department of each employee with employee number, last name, first name, and department name

select employees.emp_no, last_name, first_name, departments.dept_name
from employees
join dept_emp
	on employees.emp_no = dept_emp.emp_no
join departments 
	on dept_emp.dept_no = departments.dept_no
	
--list first name, last name and sex of employees whose first name is Hercules and last name begins with B

select first_name, last_name 
from employees
where first_name = 'Hercules' 
and last_name like 'B%'

--list all employees in the sales dept, including their emp number, last name, first name, and dept name

select employees.emp_no, last_name, first_name, departments.dept_name
from employees
join dept_emp
	on employees.emp_no = dept_emp.emp_no
join departments
	on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales'

--list all employees in sales and dev depts, include their employee number, last name, first name, dept time 

select employees.emp_no, last_name, first_name, departments.dept_name
from employees 
join dept_emp
	on employees.emp_no = dept_emp.emp_no
join departments
	on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales' or dept_name = 'Development'

--in desc order, list frequency count of employee last names: how many employees share each last name

select last_name, count(last_name)
from employees
group by last_name
order by count desc