select job_id, count(1)
from employees
group by job_id
;