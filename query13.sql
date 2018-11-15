#Question 13
select d.dname,l.dlocation
from department as d,dept_locations as l
where l.dlocation not in (select plocation
from project as p where p.dnum=l.dnumber) and d.dnumber=l.dnumber 
order by dname asc;
