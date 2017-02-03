select count(e.employee_id) as "TOTAL",
nb1995.nbEmp1995 as "1995",
nb1996.nbEmp1996 as "1996",
nb1997.nbEmp1997 as "1997",
nb1998.nbEmp1998 as "1998"
from employees e,
(select count(1) as nbemp1995 
from employees emp1995 
where EXTRACT(YEAR from hire_date) = 1995) nb1995,
(select count(1) as nbemp1996
from employees emp1996 
where EXTRACT(YEAR from hire_date) = 1996) nb1996,
(select count(1) as nbemp1997
from employees emp1997 
where EXTRACT(YEAR from hire_date) = 1997) nb1997,
(select count(1) as nbemp1998 
from employees emp1998 
where EXTRACT(YEAR from hire_date) = 1998) nb1998
group by nb1995.nbEmp1995,
nb1996.nbEmp1996,
nb1997.nbEmp1997,
nb1998.nbEmp1998
;