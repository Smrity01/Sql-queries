#Question 12
select p.pname, p.pnumber, b.emp_count
from project as p, (select pno,count(*) as emp_count from works_on
group by pno
having count(essn) = (select max(a.emp_count) from (select count(*) as emp_count from works_on
group by pno) as a)) as b
where b.pno = p.pnumber
order by p.pname, b.pno;
