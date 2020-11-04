SELECT 
    de.dept_no,
    d.dept_name,
    COUNT(de.emp_no) AS 'total_employees'
FROM
    employees.dept_emp AS de
        LEFT JOIN
    employees.departments AS d ON de.dept_no = d.dept_no
WHERE
    de.to_date > CURDATE()
GROUP BY de.dept_no