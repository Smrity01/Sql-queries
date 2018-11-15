#Question 7
select distinct(d.dnumber),d.dname
from department as d, employee as e
where d.dnumber=e.dno and e.ssn in (select essn from works_on 
group by essn
having count(pno)<(select count(pnumber) from project))
order by d.dname,d.dnumber;
