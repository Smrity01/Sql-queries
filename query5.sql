#Question 5
select dno,count(ssn)
from employee
where sex='M'
group by dno;
