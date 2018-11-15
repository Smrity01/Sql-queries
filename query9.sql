#Question 9
select D.dname,pname
from department D, (select pname,count(essn) as emp_proj,dnum
from project,works_on,employee
where pnumber = pno and dno=dnum and essn=ssn
group by dnum,pnumber) P, (select count(ssn) as emp_dept,dno
from employee
group by dno) E
where P.emp_proj = E.emp_dept and P.dnum = E.dno and D.dnumber = E.dno;
