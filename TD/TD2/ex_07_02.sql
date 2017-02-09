SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (select avg(salary) from employees)
order by salary
;