#Question 3(also giving null in output )
select dnumber as dno_having_less_employee
from department 
where (select count(*)
from employee
where dno=dnumber) <5;
