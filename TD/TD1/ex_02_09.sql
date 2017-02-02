SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct > 0
order by 2 desc, 3 desc
;