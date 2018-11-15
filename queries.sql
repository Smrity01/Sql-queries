#Question 1
select salary
from employee as e
where 4 =(select count(distinct(salary))
from  employee as e1
where e1.salary > e.salary);


#Question 2
select distinct E.fname,E.lname
from employee as E, employee as W
where E.salary=W.salary and E.ssn!=W.ssn;

#Question 3(also giving null in output don't know why)
select dnumber as dno_having_less_employee
from department 
where (select count(*)
from employee
where dno=dnumber) <5;

#Question 4
select fname,lname
from employee
where salary>=(select min(salary)
from employee)+10000;

#Question 5
select dno,count(ssn)
from employee
where sex='M'
group by dno;

#Question 6
select fname,lname,dno,dname
from employee,department
where super_ssn =(select ssn
from employee
where fname='James' and lname='Borg')
and dno=dnumber
order by lname,fname;

#Question 7
select distinct(d.dnumber),d.dname
from department as d, employee as e
where d.dnumber=e.dno and e.ssn in (select essn from works_on 
group by essn
having count(pno)<(select count(pnumber) from project))
order by d.dname,d.dnumber;

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

#Question 9
select D.dname,pname
from department D, (select pname,count(essn) as emp_proj,dnum
from project,works_on,employee
where pnumber = pno and dno=dnum and essn=ssn
group by dnum,pnumber) P, (select count(ssn) as emp_dept,dno
from employee
group by dno) E
where P.emp_proj = E.emp_dept and P.dnum = E.dno and D.dnumber = E.dno;

#Question 10
 select e.fname, e.lname, p.pname as project_name ,p.dnum as controlling_dept,e.dno as dept_number
 from employee e, project p, works_on w
 where e.ssn=w.essn and w.pno=p.pnumber and dno!=dnum
 order by e.lname,e.fname,p.pname;
 
 #Question 11
 select distinct e.fname, e.lname, r.proj_count as project_count , s.avg_proj as average_project
 from employee as e, works_on as w, (select avg(q.pnum) as avg_proj
 from (select count(pno) as pnum from works_on group by essn) as q) as s,
 (select count(pno) as proj_count,essn from works_on group by essn) as r
 where e.ssn = w.essn and r.proj_count>s.avg_proj and w.essn = r.essn
 order by e.lname,e.fname;

#Question 12
select p.pname, p.pnumber, b.emp_count
from project as p, (select pno,count(*) as emp_count from works_on
group by pno
having count(essn) = (select max(a.emp_count) from (select count(*) as emp_count from works_on
group by pno) as a)) as b
where b.pno = p.pnumber
order by p.pname, b.pno;

#Question 13
select d.dname,l.dlocation
from department as d,dept_locations as l
where l.dlocation not in (select plocation
from project as p where p.dnum=l.dnumber) and d.dnumber=l.dnumber 
order by dname asc;

#Question 14
select dependent_name, ssn as same_name_emp, essn as depend_upon
from dependent, employee
where dependent_name = fname and ssn!=essn
order by dependent_name;

#Question 15
select distinct (fname),lname
from employee,project,works_on
where dno != dnum and super_ssn = essn and pno = pnumber
order by lname ,fname;