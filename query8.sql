#Question 8
select dname,hours_for_project,hours_for_employee
from department D, (select dnum,sum(hours) as hours_for_project 
from project,works_on
where pnumber=pno
group by dnum) p, (select dno,sum(hours) as hours_for_employee
from employee,works_on
where ssn=essn
group by dno) E
where D.dnumber = P.dnum and Dnumber = E.dno
order by D.dname asc;
