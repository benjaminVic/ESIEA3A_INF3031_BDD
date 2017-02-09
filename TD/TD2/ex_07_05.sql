SELECT last_name, salary
FROM employees emp
WHERE manager_id in (
                    SELECT employee_id
                    FROM employees
                    WHERE last_name = 'King'
                    )
;
