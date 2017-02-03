SELECT last_name || ' earns $' || ROUND(salary,2) || '.00 monthly but wants $' 
|| ROUND(salary*3 ,2) || '.00.' as "Dream Salaries"
FROM employees
;
