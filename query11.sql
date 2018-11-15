 #Question 11
 select distinct e.fname, e.lname, r.proj_count as project_count , s.avg_proj as average_project
 from employee as e, works_on as w, (select avg(q.pnum) as avg_proj
 from (select count(pno) as pnum from works_on group by essn) as q) as s,
 (select count(pno) as proj_count,essn from works_on group by essn) as r
 where e.ssn = w.essn and r.proj_count>s.avg_proj and w.essn = r.essn
 order by e.lname,e.fname;
