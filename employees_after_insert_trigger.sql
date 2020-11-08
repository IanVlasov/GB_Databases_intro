CREATE TRIGGER `employees_AFTER_INSERT` AFTER INSERT ON `employees` FOR EACH ROW BEGIN
	INSERT INTO salaries (emp_no, salary, from_date, to_date)
    VALUES (new.emp_no, 10000, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 MONTH));
END