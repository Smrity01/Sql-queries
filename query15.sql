#Question 15
select distinct (fname),lname
from employee,project,works_on
where dno != dnum and super_ssn = essn and pno = pnumber
order by lname ,fname;