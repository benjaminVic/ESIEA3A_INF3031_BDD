SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE manager_id = :manager_id
;