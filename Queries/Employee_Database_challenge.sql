-- Retiring Employees

-- Joining names and dates
SELECT employees.emp_no,
	 employees.first_name,
	 employees.last_name,
     employees.birth_date,
     titles.from_date,
     titles.to_date,
	 titles.title
INTO employee_dates
FROM titles
INNER JOIN employees
ON employees.emp_no = titles.emp_no
ORDER BY employees.emp_no;

-- retirement titles
SELECT emp_no, first_name, last_name, title, from_date, to_date
--INTO retirement_titles
FROM employee_dates
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employee_dates.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
--INTO unique_titles
FROM retirement_titles
WHERE (to_date BETWEEN '9999-01-01' AND '9999-01-01');


-- Number of employees retiring by title
SELECT COUNT(emp_no), title
INTO Retiring_Titles 
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY count DESC;





-- Mentorship

-- Joining names and dates
SELECT employees.emp_no,
	 employees.first_name,
	 employees.last_name,
     employees.birth_date,
     dept_emp.from_date,
     dept_emp.to_date
--INTO mentorship
FROM dept_emp
INNER JOIN employees
ON employees.emp_no = dept_emp.emp_no
ORDER BY employees.emp_no;


-- Joining names, dates and titles
SELECT mentorship.emp_no,
	 mentorship.first_name,
	 mentorship.last_name,
     mentorship.birth_date,
     mentorship.from_date,
     mentorship.to_date,
	 titles.title
--INTO mentorship_titles
FROM titles
INNER JOIN mentorship
ON mentorship.emp_no = titles.emp_no
ORDER BY mentorship.emp_no;



-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, birth_date, from_date, to_date, title
INTO unique_mentorship
FROM mentorship_titles
ORDER BY mentorship_titles.emp_no;


-- mentorship eligibilty
SELECT emp_no, first_name, last_name, birth_date, from_date, to_date, title
INTO mentorship_eligibilty
FROM unique_mentorship
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (to_date BETWEEN '9999-01-01' AND '9999-01-01');
