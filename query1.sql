#Question 1
select salary
from employee as e
where 4 =(select count(distinct(salary))
from  employee as e1
where e1.salary > e.salary);

# 5th highest will be given as 4 i.e to nth salary will be given n-1