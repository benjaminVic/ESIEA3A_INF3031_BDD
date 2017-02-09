SELECT e2.last_name, e2.hire_date
FROM employees e1
JOIN employees e2 on e1.department_id=e2.department_id
WHERE e1.first_name = :first_name
AND e2.first_name != e1.first_name
;