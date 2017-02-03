SELECT last_name, 
TRUNC(MONTHS_BETWEEN(current_date,hire_date)+1) as "MONTHS_WORKED"
FROM employees
order by "MONTHS_WORKED" asc
;
