SELECT 
    s.emp_no,
    MAX(s.salary) as 'max_salary'
FROM
    employees.salaries AS s
GROUP BY
	s.emp_no