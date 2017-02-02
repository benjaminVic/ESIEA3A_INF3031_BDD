SELECT last_name as "Employee", salary as "Monthly Salary",
commission_pct
FROM employees
WHERE salary < 12000 AND salary > 5000
AND department_id in (20,50)
AND commission_pct = 0.2
;