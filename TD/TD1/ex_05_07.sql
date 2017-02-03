select job_id, count(1)
from employees
where job_id = :job_id
group by job_id
;