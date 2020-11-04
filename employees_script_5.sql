SELECT 
    de.dept_no,
    d.dept_name,
    COUNT(de.emp_no) AS 'total_employees',
    SUM(s.salary) AS 'total_salary'
FROM
    employees.dept_emp AS de
        LEFT JOIN
    employees.departments AS d ON de.dept_no = d.dept_no
        LEFT JOIN
    (SELECT 
        *
    FROM
        (SELECT 
			s.emp_no, s.salary
		FROM
			employees.salaries AS s
		WHERE
			s.to_date > CURDATE()
		) AS inner_select
	) AS s ON de.emp_no = s.emp_no
WHERE
    de.to_date > CURDATE()
GROUP BY de.dept_no