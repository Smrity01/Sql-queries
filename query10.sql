#Question 10
 select e.fname, e.lname, p.pname as project_name ,p.dnum as controlling_dept,e.dno as dept_number
 from employee e, project p, works_on w
 where e.ssn=w.essn and w.pno=p.pnumber and dno!=dnum
 order by e.lname,e.fname,p.pname;
