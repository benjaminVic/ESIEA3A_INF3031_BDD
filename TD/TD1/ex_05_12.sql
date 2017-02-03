SELECT job_id as "Job", 
NVL2(dep20.salary,dep20.salary,null) as "Dept 20",
NVL2(dep50.salary,dep50.salary,null) as "Dept 50",
NVL2(dep80.salary,dep80.salary,null) as "Dept 80",
NVL2(dep90.salary,dep90.salary,null) as "Dept 90",  
(dep20.salary+dep50.salary+dep80.salary+dep90.salary) as "Total"
FROM employees emp,
(select salary from employees emp20 where emp20.department_id = 20) dep20,
(select salary from employees emp50 where emp50.department_id = 50) dep50,
(select salary from employees emp80 where emp80.department_id = 80) dep80,
(select salary from employees emp90 where emp90.department_id = 90) dep90
GROUP BY job_id, dep20.salary, dep50.salary, dep80.salary, dep90.salary
;