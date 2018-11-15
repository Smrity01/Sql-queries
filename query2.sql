#Question 2
select distinct E.fname,E.lname
from employee as E, employee as W
where E.salary=W.salary and E.ssn!=W.ssn;
