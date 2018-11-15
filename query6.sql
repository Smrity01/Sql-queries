#Question 6
select fname,lname,dno,dname
from employee,department
where super_ssn =(select ssn
from employee
where fname='James' and lname='Borg')
and dno=dnumber
order by lname,fname;
