SELECT last_name, (trunc(TO_DATE(current_date, 'DD/MM/YYYY'),'d')
-trunc(TO_DATE(hire_date,'DD/MM/YYYY'),'d'))/7 as "TENURE"
FROM employees
WHERE department_id = 90
;