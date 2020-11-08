CREATE FUNCTION `emp_manager`(first_n CHAR(30), last_n CHAR(30)) RETURNS char(70) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE employee_id int;
    DECLARE department_id char(4);
    DECLARE manager_id int;
    DECLARE fn char(30);
    DECLARE ln char(30);

    SET employee_id = (
		SELECT
			emp_no
		FROM
			employees
		WHERE
			(first_name = first_n AND
            last_name = last_n)
		LIMIT 1
		);
	SET @employee_id = employee_id;
    
    SET department_id = (
        SELECT
            dept_no
        FROM
            dept_emp
        WHERE
            emp_no = employee_id AND
            to_date > CURDATE()
    );
	SET @department_id = department_id;
    
    SET manager_id = (
		SELECT
			emp_no
		FROM
			dept_manager
		WHERE
			dept_no = department_id AND
            to_date > CURDATE()
		);
	SET @manager_id = manager_id;
    
    SET fn = (
		SELECT
			first_name
		FROM
			employees
		WHERE
			emp_no = manager_id
		);
	SET @fn = fn;
    
    SET ln = (
		SELECT
			last_name
		FROM
			employees
		WHERE
			emp_no = manager_id
		);
	SET @ln = ln;
	
    RETURN (
		CONCAT(manager_id, ' ', fn, ' ', ln)
	);
    
END