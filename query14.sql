#Question 14
select dependent_name, ssn as same_name_emp, essn as depend_upon
from dependent, employee
where dependent_name = fname and ssn!=essn
order by dependent_name;
