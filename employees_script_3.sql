DELETE FROM employees.employees as e
WHERE
    e.emp_no = 
    (SELECT * FROM 
		(SELECT
			e.emp_no
		FROM
			employees.employees AS e
				LEFT JOIN
			employees.salaries AS s ON e.emp_no = s.emp_no
		WHERE
			s.salary = 
            (SELECT 
				MAX(salary)
			FROM
				employees.salaries AS s 
			WHERE
				s.to_date > CURDATE()
			)
		) AS t
	)