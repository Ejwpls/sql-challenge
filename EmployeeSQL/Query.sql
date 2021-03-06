
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
Select employees.emp_no, employees.last_name, employees.first_name, salaries.salary
From employees
inner join salaries on  employees.emp_no = salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date from employees
where hire_date like '%1986'

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select a.dept_no, a.dept_name, m.emp_no, e.first_name, e.last_name
from departments a
join dept_manager m
on a.dept_no = m.dept_no
Left Join employees e
on m.emp_no = e.emp_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
Create view view1 as 
select a.emp_no, a.last_name, a.first_name, dep.dept_name
from employees a
LEft Join dept_emp d
on a.emp_no = d.emp_no
left join departments dep
on d.dept_no = dep.dept_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
Select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select * from view1
where dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select * from view1
where dept_name = 'Sales' or dept_name = 'Development'

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "Last_name_frequency"
from employees
group by last_name
ORDER BY "Last_name_frequency" DESC;
