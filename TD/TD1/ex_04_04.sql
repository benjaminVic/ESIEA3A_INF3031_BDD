select last_name, 
NVL2(commission_pct, TO_CHAR(commission_pct), 'No Commission') as "COMM"
from employees
;