SELECT last_name as "Name", length(last_name) as "Length"
FROM employees
WHERE SUBSTR(last_name, 1) like :startletter || '%'
;