SELECT emp.last_name, emp.department_id, job_id
FROM employees emp
JOIN departments dep 
    on emp.department_id = dep.department_id
WHERE dep.location_id = :location_id
;